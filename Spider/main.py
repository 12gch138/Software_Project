import csv
import queue
from multiprocessing import Process,RLock,Queue,Pool
from bs4 import BeautifulSoup
import re
import json
import threading
import requests
from getUA import GetUserAgent
from testIP import updataIP, getIP
from getIP import getIPList

# url
index_url = "https://yp.120ask.com/search/0-0-{0}--0-0-0-0.html"
drug_url = "https://yp.120ask.com/detail/{0}.html"

# CSS selector
selector_name = '.details-right-drug p'  # [0]
selector_price = '.Drugs-Price span'  # [0]
selector_diseases = '.details-right-drug ul li var'
selector_details_key = '.cont-Drug-details .tab-dm-1 .table .td'
selector_details_val = '.cont-Drug-details .tab-dm-1 .table .td-details'
selector_instructions_key = '.cont-Drug-details .tab-dm-2 .table .td'
selector_instructions_val = '.cont-Drug-details .tab-dm-2 .table .td-details'

# ID selector
selector_id = '.Sort-list.Drug-store ul li a'

# headers



def CrawlPage(id,proxy = "0.0.0.0"):
    headers = {
        "User-Agent":GetUserAgent()}
    response = requests.get(drug_url.format(id), headers=headers, timeout=5, proxies={"http": proxy})
    if response.status_code == 404:
        return False
    else:
        bs = BeautifulSoup(response.text, "lxml")
        return CreateItem(id, bs)


def CreateItem(id, bs):
    drug = {}
    drug['类型'] = '药品'
    drug['网址'] = 'https://yp.120ask.com/detail/{0}.html'.format(id)
    drug['名称'] = bs.select(selector_name)[0].get_text()
    drug['相关疾病'] = getDiseases(bs.select(selector_diseases))
    drug['药品详情'] = getDetails(bs.select(selector_details_key),
                              bs.select(selector_details_val))
    drug['药品说明书'] = getDetails(bs.select(selector_instructions_key),
                               bs.select(selector_instructions_val))
    return drug


def getDiseases(content):
    diseases = []
    for s in content:
        name = re.search('tagSearch\\(\'(.*?)\'\\)', str(s)).group(1)
        diseases.append({
            '名称': name,
            '网址': 'https://yp.120ask.com/search/?kw=' + name
        })
    return diseases


def getDetails(list_key, list_val):
    l1 = []
    l2 = []
    for i in list_key:
        l1.append(i.get_text())
    for i in list_val:
        l2.append(i.get_text())
    return dict(zip(l1, l2))

def getId():
    IdList = []
    headers = {
        "User-Agent":
            "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36 Edg/114.0.1823.51"
    }
    for id in range(1, 101):
        response = requests.get(index_url.format(id), headers=headers, timeout=10)
        if response.status_code == 404:
            continue
        else:
            print(f"Page {id} is loaded...")
            bs = BeautifulSoup(response.text, "lxml")
            for item in bs.select(selector_id):
                IdList.append(item.get('href').split('/')[-1].split('.')[0])
    return IdList

def getData():
    while not IDQueue.empty():
        id = IDQueue.get()
        proxy = getIP()
        try:
            Data = CrawlPage(id, proxy)
            if Data == False:
                print(f"{id} Error!")
                continue
            # 申请获取锁，此过程为阻塞等待状态，直到获取锁完毕
            mutex_lock.acquire()

            # 追加数据写入csv文件，若文件不存在则自动创建
            writer.writerow(Data)

            # 释放锁
            mutex_lock.release()
            print(f"{id} over!")

        except Exception:
            # 访问失败了，所以要把我们刚才取出的数据再放回去队列中
            IDQueue.put(id)
            print(f"{id} Error!")



# Start
# TODO: traverse all pages using index
if __name__ == '__main__':
    print("Spider start running...")
    # 更新IP池
    getIPList()
    updataIP()
    IdList = list(set(getId()))
    if len(IdList) == 0:
        print("Get id error!")
    else:
        f = open('test.csv', 'w', newline='', encoding='utf-8')
        header = ['类型','网址','名称','相关疾病','药品详情','药品说明书']
        writer = csv.DictWriter(f, fieldnames=header)  # 提前预览列名，当下面代码写入数据时，会将其一一对应。
        writer.writeheader()  # 写入列名
        IDQueue = Queue(len(IdList))
        for it in IdList:
            IDQueue.put(it)
        threads = []
        mutex_lock = RLock()

        # p = Pool(20)
        # for i in range(21):
        #     p.apply_async(getData)
        # print('Waiting for all subprocesses done...')
        # p.close()
        # p.join()

        for _ in range(50):
            thread = Process(target=getData())
            thread.start()
            threads.append(thread)
        
        for thread in threads:
            thread.join()

        # mutex_lock = threading.Lock()
        # # 线程数为50，在一定范围内，线程数越多，速度越快
        # for i in range(50):
        #     t = threading.Thread(target=getData,name='LoopThread'+str(i))
        #     t.start()
        print("Spider is over!")
        f.close()

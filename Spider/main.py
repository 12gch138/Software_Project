from bs4 import BeautifulSoup
import re
import json
import requests

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
headers = {
    "User-Agent":
    "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36 Edg/114.0.1823.51"
}


def CrawlPage(id):
    response = requests.get(drug_url.format(id), headers=headers, timeout=60)
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


def SaveJson(data, path):
    with open(path, 'w', encoding='utf-8') as file_obj:
        json.dump(data, file_obj, ensure_ascii=False, sort_keys=True, indent=4)

def getId():
    IdList = []
    for id in range(1, 101):
        response = requests.get(index_url.format(id), headers=headers, timeout=60)
        if response.status_code == 404:
            continue
        else:
            print(f"Page {id} is loaded...")
            bs = BeautifulSoup(response.text, "lxml")
            for item in bs.select(selector_id):
                IdList.append(item.get('href').split('/')[-1].split('.')[0])
    return IdList

def main():
    IdList = list(set(getId()))
    if len(IdList) == 0:
        print("Get id error!")
        return
    save_data = []
    valid_id = []
    valid_count = 0
    for id in IdList:
        item = CrawlPage(id)
        if (item):
            save_data.append(item)
            valid_id.append(id)
            print('OK  :' + str(id))
            valid_count += 1
        else:
            print('FAIL:' + str(id))
    SaveJson(save_data, 'drugs_data.json')
    SaveJson(valid_id, 'valid_id_{0}_in_{1}.json'.format(valid_count, 200000))

# Start
# TODO: traverse all pages using index
if __name__ == '__main__':
    print("Spider start running...")
    main()
    print("Spider is over!")

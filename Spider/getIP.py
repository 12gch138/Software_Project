import requests
import os
import webbrowser
from bs4 import BeautifulSoup
import json
import pickle

temp_set = set()

def get_66ip():
    print("getting ip from 66ip.cn...")
    headers = {
        "Accept": "text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8",
        "Accept-Encoding": "gzip, deflate",
        "Accept-Language": "en-US,en;q=0.9",
        "Cache-Control": "max-age=0",
        "Connection": "keep-alive",
        #"Cookie": "",
        "DNT": "1",
        "Host": "www.66ip.cn",
        "Upgrade-Insecure-Requests": "1",
        "User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36",
    }
    ses = requests.session()

    for i in range(26):
        fucking_url = "http://www.66ip.cn/areaindex_{}/1.html".format(str(i+1))     #每个地区只有第一页的是最近验证的
        addr = ses.get(fucking_url,headers=headers)
        if addr.status_code == 200:
            soup = BeautifulSoup(addr.content,'html.parser')
            table = soup.find_all('table')[2]
            trs = table.find_all('tr')
            for i,tr in enumerate(trs):
                if i > 0:
                    td = tr.find_all('td')
                    ip_port = td[0].string+ ":" + td[1].string
                    print(ip_port)
                    temp_set.add(ip_port)

def getIPList():
    get_66ip()
    f = open("pool.pkl",'wb')
    pickle.dump(temp_set,f)
    f.close()
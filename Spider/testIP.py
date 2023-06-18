import pickle
import requests
from getUA import GetUserAgent
import random


def test_proxy(temp_set):
    test_url = "http://www.baidu.com/"
    for ip_port in temp_set:
        user_agent = GetUserAgent()
        header = {
            "User-Agent":user_agent,
        }
        proxy = {
            'http': ip_port,
            # 'https': 'https://' + proxy,
        }
        try:
            r = requests.get(test_url,headers=header,proxies=proxy,timeout=5)
            if r.status_code != 200:
                temp_set.remove(ip_port)
            print("successful:{}".format(ip_port))
        except:
            temp_set.remove(ip_port)
            print("failed:{}".format(ip_port))

def updataIP():
    f = open("pool.pkl",'rb')
    temp_set = list(pickle.load(f))
    f.close()
    test_proxy(temp_set)
    f = open("pool.pkl",'wb')
    pickle.dump(temp_set,f)
    f.close()

def getIP():
    f = open("pool.pkl", 'rb')
    temp_set = list(pickle.load(f))
    f.close()
    IP_port = random.choice(temp_set)
    return IP_port

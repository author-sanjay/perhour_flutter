import crochet
crochet.setup()

from scrapy import signals
from scrapy.crawler import CrawlerRunner
from scrapy.signalmanager import dispatcher
from flask import Flask, request
import time
import json
from datetime import datetime
from lortArtSpider import LotArtSpider
from lortArtDetailSpider import LortArtDetailSpider

app = Flask('scrapapp')
spiderData = dict()
spiderCount = 0 

def initData(spiderId):
    spiderData[spiderId] = dict()
    spiderData[spiderId]['data']=[]
    spiderData[spiderId]['ended']=False

#This will append the data to the spider output data list.
def _crawler_result(item, response, spider):
    print(str(datetime.now())+"received item for uuid "+str(spider.uuid))
    spiderData[spider.uuid]['data'].append(dict(item))


def _spider_closed(spider, reason):
    print("spider closed for reason:"+reason)
    spiderData[spider.uuid]['ended']=True


@app.route('/search', methods=['GET'])
def search():
    global spiderCount
    spiderCount += 1
    args = request.args
    query = args.get("q", default="", type=str)
    section =  args.get("s", default=2, type=int) # 1:future sales, 2: past sales
    page =  args.get("p", default=1, type=int)
    lang = args.get("l", default="fr", type=str)
    userAgent = args.get("a", default=request.headers.get('User-Agent'), type=str)
    #print("userAgent:"+userAgent)
    baseURL = 'https://www.lot-art.com/auction-lots?itms=1&page='+str(page)+'&sq='+query+'&ssection='+str(section)+'&smq=&order=relevance&scat=&scountry=&shouses=&sest_min=&sest_max=&stype=0'
    uuid = spiderCount
    initData(uuid)
    scrape_with_crochet(spider=LotArtSpider,uuid=uuid,baseURL=baseURL,lang=lang,userAgent=userAgent) 
    def generate():
        sleep_time = 30
        sep = ''
        yield '['
        while (len(spiderData[uuid]['data'])>0) | (not(spiderData[uuid]['ended']) & (sleep_time>0)):
            while (len(spiderData[uuid]['data'])>0):
                row = spiderData[uuid]['data'].pop(0)
                with app.app_context():
                    line = sep+'\n'+json.dumps(row)
                    print(line)
                    yield line
                sep=','
            if(not(spiderData[uuid]['ended'])):
                print(datetime.now())
                print('sleep_time'+str(sleep_time))
                time.sleep(1)
                sleep_time-=1
        yield ']'
        del spiderData[uuid]
    return generate(), {"Content-Type": "application/json"}

@app.route('/detail/<artist>/<item>', methods=['GET'])
def detail(artist,item):
    global spiderCount
    spiderCount += 1
    #print("detail:"+artist+","+item) 
    baseURL = 'https://www.lot-art.com/auction-lots/'+str(artist)+'/'+str(item)  
    userAgent = request.args.get("a", default=request.headers.get('User-Agent'), type=str)
    lang = request.args.get("l", default="fr", type=str)     
    #print("userAgent:"+userAgent) 
    #print("baseURL:"+baseURL) 
    #print("lang:"+lang) 
    uuid = spiderCount
    initData(uuid)
    scrape_with_crochet(spider=LortArtDetailSpider,uuid=uuid,baseURL=baseURL,lang=lang,userAgent=userAgent)
    def generate():
        sleep_time = 30
        sep = ''
        yield '['
        while (len(spiderData[uuid]['data'])>0) | (not(spiderData[uuid]['ended']) & (sleep_time>0)):
            print("len(spiderData[uuid]['data'])"+str(len(spiderData[uuid]['data']))+" spiderData[uuid]['ended']"+str(spiderData[uuid]['ended']))
            while (len(spiderData[uuid]['data'])>0):
                row = spiderData[uuid]['data'].pop(0)
                with app.app_context():
                    line = sep+'\n'+json.dumps(row)
                    print(line)
                    yield line
                sep=','
            if(not(spiderData[uuid]['ended'])):
                print(datetime.now())
                print('sleep_time: '+str(sleep_time))
                time.sleep(1)
                sleep_time-=1
        print("2  len(spiderData[uuid]['data'])"+str(len(spiderData[uuid]['data']))+" spiderData[uuid]['ended']"+str(spiderData[uuid]['ended']))
                    
        yield ']'
        del spiderData[uuid]
    return generate(), {"Content-Type": "application/json"}

@crochet.run_in_reactor
def scrape_with_crochet(spider,uuid,baseURL,lang,userAgent):
    dispatcher.connect(_crawler_result, signal=signals.item_scraped)
    dispatcher.connect(_spider_closed, signal=signals.spider_closed)
    runner = CrawlerRunner(settings={
        "DEFAULT_REQUEST_HEADERS":{
            'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8',
            'Accept-Language': lang,
        }
    })
    # This will connect to the Spider function in our scrapy file and after each yield will pass to the crawler_result function.
    eventual = runner.crawl(spider, uuid=uuid,category = baseURL,user_agent = userAgent)
    return eventual

if __name__== "__main__":
    app.run(debug=False)
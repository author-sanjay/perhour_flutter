import scrapy
import requests

class LortArtDetailSpider(scrapy.Spider):
    uuid=0
    name = 'lotartdetailspider'
    myBaseUrl = ''
    user_agent = ''
    start_urls = []

    def __init__(self, uuid=0, category='',user_agent='Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', **kwargs): # The category variable will have the input URL.
        self.uuid=uuid
        self.myBaseUrl = category
        self.start_urls.append(self.myBaseUrl)
        self.user_agent = user_agent
        super().__init__(**kwargs)

    custom_settings = {'FEED_URI':'stdout:', 'CLOSESPIDER_TIMEOUT' : 30} 
    
    def parse(self, response):
        headers = {
            'User-Agent': self.user_agent
        }
        modal = response.css('.my_modal_conf')
        url = modal.xpath('./div[contains(@class, "itemv_img")]/a/@href').get()
        r = requests.get(url, allow_redirects=False,headers=headers)
        print("r.status_code="+str(r.status_code))
        if(r.status_code == 302):
            url = r.headers['Location']
        yield {
            'title': modal.xpath('./div[contains(@class, "itemv_header")]/h1[contains(@class, "itemv_title")]/span/text()').get().replace('  ','').replace('\n',''),
            'img':modal.xpath('./div[contains(@class, "itemv_img ")]/a/img/@src').get(),
            'url': url,
            'short_desc':' '.join(modal.xpath('//span[starts-with(@id,"desc_short")]/node()').extract()),
            'long_desc':' '.join(modal.xpath('//span[starts-with(@id,"desc_full")]/node()').extract())
            }

        #for next_page in response.css('a.next'):
        #    yield response.follow(next_page, self.parse)
import scrapy
from datetime import datetime

class LotArtSpider(scrapy.Spider):
    uuid = 0
    name = 'lotartspider'
    myBaseUrl = ''
    user_agent = ''
    start_urls = []

    def __init__(self,uuid=0, category='',user_agent='Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', **kwargs): # The category variable will have the input URL.
        self.uuid = uuid
        self.myBaseUrl = category
        self.start_urls.append(self.myBaseUrl)
        self.user_agent = user_agent
        super().__init__(**kwargs)

    custom_settings = {'FEED_URI':'stdout:', 'CLOSESPIDER_TIMEOUT' : 30} 
    
    def parse(self, response):
        for item in response.css('.iteml_card'):
            for card in item.css('.card-body'):
                yield {
                    'id': item.xpath('./@match_str').get(),
                    'url': item.xpath('./a/@href').get().replace('https://www.lot-art.com/auction-lots/','./detail/'),
                    'title': card.xpath('./h5/a/text()').get().replace('  ','').replace('\n',''),
                    'date':card.xpath('./p/span[contains(@class, "iteml_detail")]/a/text()').get(),
                    'img':item.xpath('./a/img/@src').get()}

        #for next_page in response.css('a.next'):
        #    yield response.follow(next_page, self.parse)
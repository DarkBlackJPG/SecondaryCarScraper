import scrapy

class main_scraper(scrapy.Spider):
    name = 'polovniautomobili_scraper'
    start_urls = [
        # 'https://www.polovniautomobili.com/auto-oglasi/pretraga?page=1&sort=basic&city_distance=0&showOldNew=all&without_price=1'
        'https://icanhazip.com/'
    ]

    def parse(self, response):
        yield response.follow('https://icanhazip.com/', callback=self.analyze_data)
        links = [link.get() for link in response.css('.ga-title::attr(href)')]
        # for link in links:
        #     yield response.follow(link, callback=self.analyze_data)

    def analyze_data(self, response):
        print(response.body)
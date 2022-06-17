import scrapy
import csv
from bs4 import BeautifulSoup
from w3lib.html import remove_tags
import pprint
import time

class main_scraper(scrapy.Spider):
    name = 'polovniautomobili_scraper'
    start_urls = [
        'https://www.polovniautomobili.com/auto-oglasi/pretraga?page=1&sort=basic&city_distance=0&showOldNew=all'
    ]
    current_page = 1

    def __init__(self):
        self.start_time = time.time()
        timestr = time.strftime("%Y%m%d-%H%M%S")
        self.filename = f'polovni_automobili_database.csv'
        with open(self.filename, 'w', encoding="utf-8") as csvfile:
            filewriter = csv.writer(csvfile, delimiter=',', quotechar='|', quoting=csv.QUOTE_MINIMAL)
            filewriter.writerow([
                'boja_eksterijer'
                , 'boja_enterijer'
                , 'broj_oglasa'
                , 'broj_sedista'
                , 'broj_vrata'
                , 'emisiona_klasa'
                , 'fiksna_cena'
                , 'cena_popust'
                , 'cena_regularna'
                , 'godiste'
                , 'gorivo'
                , 'grad'
                , 'karoserija'
                , 'kilometraza'
                , 'klima'
                , 'kubikaza'
                , 'marka'
                , 'materijal_enterijera'
                , 'menjac'
                , 'model'
                , 'ostecenje'
                , 'pogon'
                , 'poreklo_vozila'
                , 'registrovan_do'
                , 'snaga'
                , 'stanje'
                , 'strana_volana'
                , 'vlasnistvo'
                , 'zamena'
                , 'zemlja_uvoza'
            ])

    def parse(self, response):
        #time.sleep(0.5)
        links = [link.get() for link in response.css('.ga-title::attr(href)')]
        for link in links:
            yield response.follow(link, callback=self.analyze_data)

        self.current_page += 1
        if self.current_page < 1500:
            next_page = f'https://www.polovniautomobili.com/auto-oglasi/pretraga?page={self.current_page}&sort=basic&city_distance=0&showOldNew=all'
            yield scrapy.Request(next_page, callback=self.parse)
        else:
            print(f'Scraping finishing up.\nExecution took: {(time.time() - self.start_time) / 60} minutes\nExecution took: {(time.time() - self.start_time) / (60 * 60)} hours')



    def analyze_data(self, response):
        #time.sleep(0.5)
        data_info_boxes = response.css('.infoBox').css('.uk-width-1-2').extract()
        city_infobox = response.css('.infoBox').css('.js-tutorial-contact')

        datastrings = {
            'Stanje:' : 'stanje',
            'Marka' : 'marka',
            'Model': 'model',
            'Godište': 'godiste',
            'Kilometraža': 'kilometraza',
            'Karoserija': 'karoserija',
            'Gorivo': 'gorivo',
            'Kubikaža': 'kubikaza',
            'Fiksna cena': 'fiksna_cena',
            'Snaga motora': 'snaga',
            'Emisiona klasa motora': 'emisiona_klasa',
            'Pogon': 'pogon',
            'Menjač': 'menjac',
            'Broj vrata': 'broj_vrata',
            'Broj sedišta': 'broj_sedista',
            'Strana volana': 'strana_volana',
            'Klima': 'klima',
            'Boja': 'boja_eksterijer',
            'Materijal enterijera': 'materijal_enterijera',
            'Boja enterijera': 'boja_enterijer',
            'Registrovan do': 'registrovan_do',
            'Poreklo vozila': 'poreklo_vozila',
            'Oštećenje': 'ostecenje',
            'Vlasništvo': 'vlasnistvo',
            'Zemlja uvoza:': 'zemlja_uvoza',
            'Zemlja uvoza': 'zemlja_uvoza',
            'Broj oglasa:': 'broj_oglasa',
            'Zamena:': 'zamena'
        }

        removed_tags = [remove_tags(element) for element in data_info_boxes]
        car_data = {
            'boja_eksterijer': ''
            , 'boja_enterijer': ''
            , 'broj_oglasa': ''
            , 'broj_sedista': ''
            , 'broj_vrata': ''
            , 'emisiona_klasa': ''
            , 'fiksna_cena': ''
            , 'cena_popust': ''
            , 'cena_regularna': ''
            , 'godiste': ''
            , 'gorivo': ''
            , 'grad': ''
            , 'karoserija': ''
            , 'kilometraza': ''
            , 'klima': ''
            , 'kubikaza': ''
            , 'marka': ''
            , 'materijal_enterijera': ''
            , 'menjac': ''
            , 'model': ''
            , 'ostecenje': ''
            , 'pogon': ''
            , 'poreklo_vozila': ''
            , 'registrovan_do': ''
            , 'snaga': ''
            , 'stanje': ''
            , 'strana_volana': ''
            , 'vlasnistvo': ''
            , 'zamena': ''
            , 'zemlja_uvoza': ''
        }

        for i in range(0, len(removed_tags)):
            first_element = removed_tags[i]
            if first_element in datastrings:
                car_data[datastrings[first_element]] = removed_tags[i + 1].strip()
                i += 2
            else:
                continue

        city = city_infobox.css('.uk-margin-top-remove').css('.uk-width-1-2::text').get().strip()
        car_data['grad'] = city

        regular_price = response.css('.regularPriceColor::text').extract()
        discount_price = response.css('.discountedPriceColor::text').extract()
        car_data['cena_popust'] = discount_price
        car_data['cena_regularna'] = regular_price
        self.write_to_csv(car_data)

    def write_to_csv(self, car_data):
        filerow = [
            car_data['boja_eksterijer'],
            car_data['boja_enterijer'],
            car_data['broj_oglasa'],
            car_data['broj_sedista'],
            car_data['broj_vrata'],
            car_data['emisiona_klasa'],
            car_data['fiksna_cena'],
            car_data['cena_popust'],
            car_data['cena_regularna'],
            car_data['godiste'],
            car_data['gorivo'],
            car_data['grad'],
            car_data['karoserija'],
            car_data['kilometraza'],
            car_data['klima'],
            car_data['kubikaza'],
            car_data['marka'],
            car_data['materijal_enterijera'],
            car_data['menjac'],
            car_data['model'],
            car_data['ostecenje'],
            car_data['pogon'],
            car_data['poreklo_vozila'],
            car_data['registrovan_do'],
            car_data['snaga'],
            car_data['stanje'],
            car_data['strana_volana'],
            car_data['vlasnistvo'],
            car_data['zamena'],
            car_data['zemlja_uvoza']
        ]
        with open(self.filename, 'a', encoding="utf-8") as csvfile:
            filewriter = csv.writer(csvfile, delimiter=',', quotechar='|', quoting=csv.QUOTE_MINIMAL)
            filewriter.writerow(filerow)
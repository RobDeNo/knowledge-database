#!/usr/bin/python

import lxml.html
import requests

page = requests.get('https://quotes.toscrape.com')
tree = lxml.html.fromstring(page.content)

authors = tree.xpath('//small[@class="author"]/text()')
#within the small you looking for osmthing within that class

print ('Authors', authors)ip neigh  

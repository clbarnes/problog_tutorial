from bs4 import BeautifulSoup
from urllib.request import urlopen
import os

ROOT_URL = 'https://dtai.cs.kuleuven.be/problog/'
CONTENTS_URL = ROOT_URL + 'tutorial.html'
ORIGINALS_DIR = 'originals'

INVALID_CHARS = r'/<>:"\|?*'


def sanitise_name(s):
    return ''.join(char for char in s if char not in INVALID_CHARS)


def url2soup(url):
    return BeautifulSoup(urlopen(url).read(), 'html.parser')


contents_soup = url2soup(CONTENTS_URL)
links = contents_soup.findAll('a', class_='reference internal')

for i, link in enumerate(links[:-1], 1):  # ignore 'problog as a python library'
    url = ROOT_URL + link['href']
    path = os.path.join(ORIGINALS_DIR, '{:02d} - {}'.format(i, sanitise_name(link.text)))
    os.makedirs(path, exist_ok=True)

    page_soup = url2soup(url)
    code_blocks = page_soup.findAll('div', class_='problog-editor')

    for j, code_block in enumerate(code_blocks, 1):
        example_path = os.path.join(path, 'example_{:02d}.pl'.format(j))
        with open(example_path, 'w') as f:
            f.write(code_block.text)

print('done')
import chromedriver_autoinstaller
from selenium import webdriver
from selenium.webdriver.chrome.service import Service
from selenium.webdriver.chrome.options import Options
from bs4 import BeautifulSoup
from prettytable import PrettyTable

chromedriver_autoinstaller.install()

chrome_options = Options()
chrome_options.add_argument("--no-sandbox")
# chrome_options.add_argument("--headless")
chrome_options.binary_location = "/usr/bin/chromium"

driver = webdriver.Chrome(options=chrome_options)
driver.get("https://www.olx.in/items/q-car-cover")
driver.implicitly_wait(20)

html = driver.page_source
driver.quit()

soup = BeautifulSoup(html, "html.parser")

ads = soup.select('li._1DNjI')

table = PrettyTable(["Title", "Price", "Location"])

for ad in ads:
    title = ad.select_one('span[data-aut-id="itemTitle"]')
    price = ad.select_one('span[data-aut-id="itemPrice"]')
    location = ad.select_one('span[data-aut-id="item-location"]')

    link_tag = ad.select_one("a._1fYFY")

    table.add_row([
        title.get_text(strip=True) if title else "N/A",
        price.get_text(strip=True) if price else "N/A",
        location.get_text(strip=True) if location else "N/A",
    ])

print(table)

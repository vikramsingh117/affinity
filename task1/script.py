import chromedriver_autoinstaller
from selenium import webdriver
from selenium.webdriver.chrome.service import Service
from selenium.webdriver.chrome.options import Options
from bs4 import BeautifulSoup
from prettytable import PrettyTable

# auto-install correct driver for Chromium
chromedriver_autoinstaller.install()

chrome_options = Options()
chrome_options.binary_location = "/usr/bin/chromium"
chrome_options.add_argument("--no-sandbox")
chrome_options.add_argument("--disable-dev-shm-usage")
chrome_options.add_argument("--disable-gpu")

driver = webdriver.Chrome(options=chrome_options)
driver.get("https://www.olx.in/items/q-car-cover")

driver.implicitly_wait(20)
html = driver.page_source
driver.quit()

soup = BeautifulSoup(html, "html.parser")
ads = soup.select("li.EIR5N")

table = PrettyTable(["Title", "Price"])

# for ad in ads:
    # title = ad.select_one("span._2tW1I")
    # price = ad.select_one("span._89yzn")
    
    # table.add_row([
    #     title.text.strip() if title else "N/A",
    #     price.text.strip() if price else "N/A"
    # ])

print(table)

import numpy as np
import pandas as pd
import time
import random
from shutil import which
from selenium.webdriver.chrome.options import Options
from selenium.webdriver.support import expected_conditions as EC
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.common.by import By
from selenium.common.exceptions import NoSuchElementException
from selenium import webdriver

#Inicialização do driver e carregamento de opções
def driver_inicialization():
    chrome_path = which("chromedriver")
    chrome_options = Options()
    chrome_options.add_argument("start-maximized")
    chrome_options.add_argument("--incognito")
    #chrome_options.add_argument("--headless")
    chrome_options.add_experimental_option("excludeSwitches", ["enable-automation"])
    chrome_options.add_experimental_option('useAutomationExtension', False)
    chrome_options.add_argument('--disable-blink-features=AutomationControlled')
    driver = webdriver.Chrome(executable_path=chrome_path, options = chrome_options)
    driver.execute_script("Object.defineProperty(navigator, 'webdriver', {get: () => undefined})")
    driver.execute_cdp_cmd('Network.setUserAgentOverride', {"userAgent": 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.53 Safari/537.36'})
    return driver

#Verifica o número de dígitos do mês
def month_checker(month):
    if month < 10:
        verified_month = str("0"+str(month))
    else:
        verified_month = str(month)
    return verified_month

#Cria as datas de início e fim da pesquisa
def search_dates(entry_date):
    date_treatment = entry_date.split("/")

    day = date_treatment[0]
    month = date_treatment[1]
    year = date_treatment[2]

    month_previous_quarter = int(month)-6
    month_next_quarter = int(month)+6

    if month_previous_quarter < 1:
        month_previous_quarter = month_checker(month_previous_quarter+12)
        year_previous_quarter = str(int(year)-1)
        year_next_quarter = str(year)
    else:
        month_previous_quarter = month_checker(month_previous_quarter)
        year_previous_quarter = year
        
    if month_next_quarter > 12:
        month_next_quarter = month_checker(month_next_quarter-12)
        year_next_quarter = str(int(year)+1)
        year_previous_quarter = str(year)
    else:
        month_next_quarter = month_checker(month_next_quarter)
        year_next_quarter = year

    dates = np.array([day+month_previous_quarter+year_previous_quarter,day+month_next_quarter+year_next_quarter])
    return dates

#Realiza a aplicação de filtros
def filter_apply(driver, url, dates):
    driver.get(url)
    time.sleep(random.randint(2, 4))
    date_dropdown_menu = driver.find_element_by_xpath('//button[@id = "filter-deadline"]')
    date_dropdown_menu.click()
    WebDriverWait(driver, timeout = 2).until(EC.presence_of_element_located((By.XPATH, './/div[@id = "filter-deadline-emission-min"]/input')))
    date_dropdown_menu_first_date = driver.find_element_by_xpath('.//div[@id = "filter-deadline-emission-min"]/input')
    date_dropdown_menu_first_date.click()
    date_dropdown_menu_first_date.send_keys(dates[0])
    date_dropdown_menu_last_date = driver.find_element_by_xpath('.//div[@id = "filter-deadline-emission-max"]/input')
    date_dropdown_menu_last_date.click()
    date_dropdown_menu_last_date.send_keys(dates[1])
    date_dropdown_menu_filter_button = driver.find_element_by_xpath('.//button[@id = "filter-deadline-apply"]')
    date_dropdown_menu_filter_button.click()
    WebDriverWait(driver, timeout = 10).until(EC.presence_of_element_located((By.XPATH, '//h4[@class = "anbima-ui-list-item__header__title"]')))
    return driver.current_url
    
#Obtem os links dos títulos
def get_links(driver, url):
    bond_links = []
    titles = driver.find_elements_by_xpath('//h4[@class = "anbima-ui-list-item__header__title"]')
    for title in titles:
        page_link = title.find_element_by_xpath('.//span/a').get_attribute("href")
        bond_links.append(page_link)
    return bond_links

#Realiza a extração dos dados de uma página
def data_extractor(driver, links):
    bond_data = []
    for link in links:
        driver.get(link)
        WebDriverWait(driver, timeout = 10).until(EC.presence_of_element_located((By.XPATH, '//h1[@class = "display-bold"]')))
        time.sleep(random.randint(2,5))
        try:
            asset = driver.find_element_by_xpath('//h1[@class = "display-bold"]').text
        except NoSuchElementException:
            asset = "-"
        try:
            issuer = driver.find_element_by_xpath('//div[@style = "display: inline-flex; margin-top: 16px; margin-bottom: 32px;"]/dl/dd').text
        except NoSuchElementException:
            issuer = "-"
        try:
            sector = driver.find_element_by_xpath('//div[@id = "output__container--setor"]/div/span').text
        except NoSuchElementException:
            sector = "-"
        try:
            issue_date = driver.find_element_by_xpath('//div[@class = "card-content__container "]//ul//li[@style = "margin-bottom: 8px; line-height: 100%;"][2]//span[@class = "normal-text"]').text
        except NoSuchElementException:
            issue_date = "-"
        try:
            start_interest = driver.find_element_by_xpath('//div[@class = "card-content__container "]/div/ul//li[2]/div/div/span').text
        except NoSuchElementException:
            start_interest = "-"
        try:
            expiration_date = driver.find_element_by_xpath('//div[@class = "card-content__container "]//ul//li[@style = "margin-bottom: 8px; line-height: 100%;"][3]//span[@class = "normal-text"]').text    
        except NoSuchElementException:
            expiration_date = "-"
        try:
            coupon = driver.find_element_by_xpath('//div[@class = "card-content__container "]//ul[@style = "margin-bottom: 24px;"]/li/dl/dd').text
        except NoSuchElementException:
            coupon = "-"
        try:
            reference_rate = driver.find_element_by_xpath('//div[@class = "card-content__container "]//ul[@style = "margin-bottom: 24px;"]//li[2]//dl//dd').text
        except NoSuchElementException:
            reference_rate = "-"
        try:
            pu_par = driver.find_element_by_xpath('//div[@class = "card-content__container "]//ul[@style = "margin-bottom: 24px;"]//li[3]/dl/dd').text
        except NoSuchElementException:
            pu_par = "-"
        try:
            pu_par_indicative = driver.find_element_by_xpath('//div[@class = "card-content__container "]//ul[@style = "margin-bottom: 24px;"]//li[4]/dl/dd').text
        except NoSuchElementException:
            pu_par_indicative = "-"
        try:
            amount_issued = driver.find_element_by_xpath('//div[@class = "card-content__container "]/div/ul//li[4]/div/div/span').text
        except NoSuchElementException:
            amount_issued = "-"
        try:
            volume_emission = driver.find_element_by_xpath('//div[@class = "card-content__container "]/div/ul//li[5]/div/div/span').text
        except NoSuchElementException:
            volume_emission = "-"
        try:
            nominal_value_emission = driver.find_element_by_xpath('//div[@class = "card-content__container "]/div/ul//li[6]/div/div/span').text
        except NoSuchElementException:
            nominal_value_emission = "-"
        try:
            current_nominal_value = driver.find_element_by_xpath('//div[@class = "card-content__container "]/div/ul//li[7]/div/div/span/a').text
        except NoSuchElementException:
            current_nominal_value = "-"
        try:
            amount_B3 = driver.find_element_by_xpath('//div[@class = "card-content__container "]/div/ul//li[8]/div/div/span').text
        except NoSuchElementException:
            amount_B3 = "-"
        try:
            value_B3 = driver.find_element_by_xpath('//div[@class = "card-content__container "]/div/ul//li[9]/div/div/span').text
        except NoSuchElementException:
            value_B3 = "-"
        try:
            maturity = driver.find_element_by_xpath('//div[@class = "card-content__container "]/div/ul//li[13]/div/div/span').text
        except NoSuchElementException:
            maturity = "-"
        bond = pd.DataFrame({'asset': [asset], 'issuer': [issuer], 'sector': [sector], 'issue_date': [issue_date], 'start_interest': [start_interest], 'expiration_date': [expiration_date], 'coupon': [coupon], 'reference_rate': [reference_rate], 'pu_par': [pu_par], 'pu_par_indicative': [pu_par_indicative], 'amount_issued': [amount_issued], 'volume_emission': [volume_emission], 'nominal_value_emission': [nominal_value_emission], 'current_nominal_value': [current_nominal_value],'amount_B3': [amount_B3], 'value_B3': [value_B3], 'maturity': [maturity]})
        bond_data.append(bond)
    return bond_data

#Realiza a busca em todas as páginas
def spider(driver, entry_date, url):
    dates = search_dates(entry_date)
    current_url = filter_apply(driver, url, dates)
    time.sleep(random.randint(2,5))
    bond_data = data_extractor(driver, get_links(driver, current_url))
    driver.get(current_url)
    time.sleep(random.randint(2,5))

    while True:
        try:
            time.sleep(random.randint(2,4))
            next_page_link = driver.find_element_by_xpath('//a[@id = "pagination-next-button"]').get_attribute("href")
            WebDriverWait(driver, timeout = 10).until(EC.element_to_be_clickable((By.XPATH, '//a[@id = "pagination-next-button"]'))).click()
        except Exception as error:
            print(error)
            break
        time.sleep(random.randint(2,4))
        page_bonds = data_extractor(driver, get_links(driver, next_page_link))
        bond_data.extend(page_bonds)
        driver.get(next_page_link)
    return bond_data

#Trata o banco de dados
def database_treatment(df):
    for i in range(0,len(df.index)):
        if "LEI" in df.loc[i,"asset"]:
           df.loc[i,"asset"] = df.loc[i, "asset"].split("\n")[0]
        if df.loc[i,"reference_rate"] != "-":
            df.loc[i,"reference_rate"] = float(df.loc[i, "reference_rate"].split("%")[0].replace(",","."))
        if df.loc[i,"pu_par"] != "-":
            df.loc[i, "pu_par"] = float(df.loc[i, "pu_par"].split("R$ ")[1].replace(".","").replace(",","."))
        if df.loc[i,"pu_par_indicative"] != "-":
            df.loc[i, "pu_par_indicative"] = float(df.loc[i, "pu_par_indicative"].split("R$ ")[1].replace(".","").replace(",","."))   
        if df.loc[i,"amount_issued"] != "-":
            df.loc[i, "amount_issued"] = float(df.loc[i, "amount_issued"].replace(".",""))
        if df.loc[i,"volume_emission"] != "-":
            df.loc[i, "volume_emission"] = float(df.loc[i, "volume_emission"].split("R$ ")[1].replace(".","").replace(",","."))
        if df.loc[i,"nominal_value_emission"] != "-":
            df.loc[i, "nominal_value_emission"] = float(df.loc[i, "nominal_value_emission"].split("R$ ")[1].replace(".","").replace(",","."))
        if df.loc[i,"current_nominal_value"] != "-":
            df.loc[i, "current_nominal_value"] = float(df.loc[i, "current_nominal_value"].split("R$ ")[1].replace(".","").replace(",","."))
        if df.loc[i,"amount_B3"] != "-":
            df.loc[i, "amount_B3"] = float(df.loc[i, "amount_B3"].replace(".",""))
        if df.loc[i,"value_B3"] != "-":
            df.loc[i, "value_B3"] = float(df.loc[i, "value_B3"].split("R$ ")[1].replace(".","").replace(",","."))
        if df.loc[i,"maturity"] != "-":
            if " e " in df.loc[i, "maturity"]:
                years_maturity = float(df.loc[i, "maturity"].split(" e ")[0].split(" ano")[0])
                if "meses" in df.loc[i, "maturity"]:
                    months_maturity = float(df.loc[i, "maturity"].split(" e ")[1].split(" mes")[0])/12
                else:
                    months_maturity = 1/12
                df.loc[i, "maturity"] = years_maturity + months_maturity
            else:
                if "ano" in df.loc[i,"maturity"]:
                    df.loc[i, "maturity"] = float(df.loc[i, "maturity"].split(" ano")[0])
                else:
                    if "meses" in df.loc[i,"maturity"]:
                        df.loc[i, "maturity"] = float(df.loc[i, "maturity"].split(" meses")[0])/12
                    else:
                        df.loc[i, "maturity"] = 1/12
    return df

#Filtra o banco de dados
def database_filtering(df, asset, sector, volume_emission):
    df_filtered = df.drop(df[df.asset == asset].index).reset_index(drop = True)
    df_filtered = df_filtered.drop(df_filtered[df_filtered.sector != sector].index).reset_index(drop = True)
    df_filtered = df_filtered.drop(df_filtered[(df_filtered.volume_emission <= 0.5*volume_emission)|(df_filtered.volume_emission >= 1.5*volume_emission)|(df_filtered.volume_emission == "-")].index).reset_index(drop = True)
    return df_filtered

#Exporta em formato .xlsx
def save_xlsx(bonds_db, path):
    with pd.ExcelWriter(path) as writer:
        for key in bonds_db:
            df = []
            df = bonds_db[key]
            df.to_excel(writer, key, index = False)
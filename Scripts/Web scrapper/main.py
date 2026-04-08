import pandas as pd
from functions import driver_inicialization, spider, database_treatment, database_filtering, save_xlsx

#Inicializa o driver
driver = driver_inicialization()

#Define as datas e a página de pesquisa
url = 'https://data.anbima.com.br/debentures'
path_import = r'C:\Users\hbrac\Downloads\green_bonds.xlsx'
path_export = r'C:\Users\hbrac\Downloads\bonds_db.xlsx'

#Importa os green bonds pesquisados
df_filter = pd.read_excel(path_import)

#Realiza o scraping
bonds_db = {}
for i in range(0, len(df_filter.index)):
    bond_data = []
    df = []
    bond_data = spider(driver, df_filter.loc[i, "issue_date"], url)
    df = database_filtering(database_treatment(pd.concat(bond_data, ignore_index=True)), df_filter.loc[i, "asset"], df_filter.loc[i, "sector"], df_filter.loc[i, "volume_emission"])
    bonds_db[df_filter.loc[i, "asset"]] = df

driver.close()

#Exporta em formato .xlsx
save_xlsx(bonds_db, path_export)

    
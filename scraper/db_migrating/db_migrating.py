import psycopg2
import pandas as pd
import re
from sqlalchemy import create_engine
import math
# establish connections
conn_string = 'postgresql://postgres:123@127.0.0.1/polovniautomobili'

db = create_engine(conn_string)
sqlalchemy_conn = db.connect()

conn = psycopg2.connect("dbname=polovniautomobili user=postgres password=123")
cur = conn.cursor()

def execute_insert(field_name, table_name, elements):
    for element in elements:
        if type(element) == float:
            continue
        cur.execute("INSERT INTO public." + table_name + " (" + field_name + ") VALUES (%(element)s) ON CONFLICT DO NOTHING", {'element': element})
    conn.commit()

csv_file = pd.read_csv('../polovni_automobili_database_formatted_data.csv')

boja_eksterijer = csv_file['boja_eksterijer'].unique()
boja_enterijer = csv_file['boja_enterijer'].unique()
emisiona_klasa = csv_file['emisiona_klasa'].unique()
gorivo = csv_file['gorivo'].unique()
grad = csv_file['grad'].unique()
karoserija = csv_file['karoserija'].unique()
klima = csv_file['klima'].unique()
marka = csv_file['marka'].unique()
materijal_enterijera = csv_file['materijal_enterijera'].unique()
menjac = csv_file['menjac'].unique()
ostecenje = csv_file['ostecenje'].unique()
pogon = csv_file['pogon'].unique()
poreklo_vozila = csv_file['poreklo_vozila'].unique()
stanje = csv_file['stanje'].unique()
vlasnistvo = csv_file['vlasnistvo'].unique()
zemlja_uvoza = csv_file['zemlja_uvoza'].unique()

execute_insert('naziv', 'boja', boja_eksterijer)
execute_insert('naziv', 'boja', boja_enterijer)
execute_insert('naziv', 'emisiona_klasa', emisiona_klasa)
execute_insert('naziv', 'gorivo', gorivo)
execute_insert('naziv', 'grad', grad)
execute_insert('opis',  'karoserija', karoserija)
execute_insert('opis',  'klima', klima)
execute_insert('naziv', 'materijal', materijal_enterijera)
execute_insert('opis',  'menjac', menjac)
execute_insert('opis',  'ostecenje', ostecenje)
execute_insert('opis',  'pogon', pogon)
execute_insert('opis',  'poreklo', poreklo_vozila)
execute_insert('opis',  'stanje', stanje)
execute_insert('opis',  'vlasnistvo', vlasnistvo)
execute_insert('naziv', 'zemlja_uvoza', zemlja_uvoza)
execute_insert('naziv', 'marka', marka)

print('Starting model insertation')
model = csv_file['marka'].groupby(csv_file['model']).unique().apply(pd.Series)
for model_name, manufacturers in model.iterrows():
    for manufacturer in manufacturers:
        if type(manufacturer) == float:
            break
        cur.execute("""
        INSERT INTO public.model (marka, naziv) VALUES ( (SELECT id FROM public.marka WHERE naziv = %(marka)s), %(model)s) ON CONFLICT DO NOTHING
        """, {'marka': manufacturer, 'model': model_name})
conn.commit() # <- We MUST commit to reflect the inserted data

# Populating with all cars

def fetch_id_value_tuple(table_name):
    cur.execute('SELECT * FROM public.'+table_name)
    return cur.fetchall()

def update_dataframe_with_ids(dataframe, column_name, id_tuple, value_index = 1):
    for tuple in id_tuple:
        dataframe[column_name] = dataframe[column_name].replace(tuple[value_index], tuple[0])
    return dataframe

def clean_up_engine(element):
    if math.isnan(element):
        return False
    # people are fucking retarded and don't know how to fill in simple data
    return element < 10000

boja_tuple = fetch_id_value_tuple('boja')
emisiona_klasa_tuple = fetch_id_value_tuple('emisiona_klasa')
gorivo_tuple = fetch_id_value_tuple('gorivo')
grad_tuple = fetch_id_value_tuple('grad')
karoserija_tuple = fetch_id_value_tuple('karoserija')
klima_tuple = fetch_id_value_tuple('klima')
marka_tuple = fetch_id_value_tuple('marka')
materijal_enterijera_tuple = fetch_id_value_tuple('materijal')
menjac_tuple = fetch_id_value_tuple('menjac')
model_tuple = fetch_id_value_tuple('model')
ostecenje_tuple = fetch_id_value_tuple('ostecenje')
pogon_tuple = fetch_id_value_tuple('pogon')
poreklo_vozila_tuple = fetch_id_value_tuple('poreklo')
stanje_tuple = fetch_id_value_tuple('stanje')
vlasnistvo_tuple = fetch_id_value_tuple('vlasnistvo')
zemlja_uvoza_tuple = fetch_id_value_tuple('zemlja_uvoza')

csv_file = update_dataframe_with_ids(csv_file, 'boja_eksterijer',   boja_tuple)
csv_file = update_dataframe_with_ids(csv_file, 'boja_enterijer',   boja_tuple)
csv_file = update_dataframe_with_ids(csv_file, 'emisiona_klasa',    emisiona_klasa_tuple)
csv_file = update_dataframe_with_ids(csv_file, 'gorivo',   gorivo_tuple)
csv_file = update_dataframe_with_ids(csv_file, 'grad',    grad_tuple)
csv_file = update_dataframe_with_ids(csv_file, 'karoserija',   karoserija_tuple)
csv_file = update_dataframe_with_ids(csv_file, 'klima',    klima_tuple)
csv_file = update_dataframe_with_ids(csv_file, 'marka',   marka_tuple)
csv_file = update_dataframe_with_ids(csv_file, 'materijal_enterijera',    materijal_enterijera_tuple)
csv_file = update_dataframe_with_ids(csv_file, 'menjac',    menjac_tuple)
csv_file = update_dataframe_with_ids(csv_file, 'model',    model_tuple, 2)
csv_file = update_dataframe_with_ids(csv_file, 'ostecenje',   ostecenje_tuple)
csv_file = update_dataframe_with_ids(csv_file, 'pogon',    pogon_tuple)
csv_file = update_dataframe_with_ids(csv_file, 'poreklo_vozila',    poreklo_vozila_tuple)
csv_file = update_dataframe_with_ids(csv_file, 'stanje',    stanje_tuple)
csv_file = update_dataframe_with_ids(csv_file, 'vlasnistvo',    vlasnistvo_tuple)
csv_file = update_dataframe_with_ids(csv_file, 'zemlja_uvoza',    zemlja_uvoza_tuple)

only_numbers_regex = r'([0-9\.]+)'
csv_file['fiksna_cena'] = csv_file['fiksna_cena'].replace('NE', 0).replace('DA', 1)
csv_file['zamena'] = csv_file['zamena'].replace('NE', 0).replace('DA', 1)
csv_file['snaga_ks'] = 0
csv_file['snaga_kw'] = 0
csv_file['broj_sedista'] = csv_file['broj_sedista'].map(lambda x: x[0])
csv_file['broj_vrata'] = csv_file['broj_vrata'].map(lambda x: x[0])
csv_file['snaga_kw'] = csv_file['snaga'].map(lambda x: re.findall(only_numbers_regex, x)[0])
csv_file['snaga_ks'] = csv_file['snaga'].map(lambda x: re.findall(only_numbers_regex, x)[1])
csv_file['registrovan_do'] = csv_file['registrovan_do'].map(lambda x: x if x != 'Nije registrovan' else float('nan'))
csv_file = csv_file[csv_file['kubikaza'].apply(lambda x: clean_up_engine(x))]

del csv_file['snaga']

print(csv_file.head(15).to_string())

csv_file.to_sql('automobili', sqlalchemy_conn, if_exists='append')

cur.close()
conn.close()

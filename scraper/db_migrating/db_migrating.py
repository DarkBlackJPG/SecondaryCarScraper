import psycopg2
import pandas as pd
import numpy

conn = psycopg2.connect("dbname=polovniautomobili user=postgres password=123")
cur = conn.cursor()

def execute_insert(field_name, table_name, elements):
    for element in elements:
        if type(element) == float:
            continue
        cur.execute("INSERT INTO public." + table_name + " (" + field_name + ") VALUES (%(element)s) ON CONFLICT DO NOTHING", {'element': element})
    conn.commit()

csv_file = pd.read_csv('../polovni_automobili_database_20220612-152247_formatted_data.csv')

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
execute_insert('opis', 'karoserija', karoserija)
execute_insert('opis', 'klima', klima)
execute_insert('naziv', 'materijal', materijal_enterijera)
execute_insert('opis', 'menjac', menjac)
execute_insert('opis', 'ostecenje', ostecenje)
execute_insert('opis', 'pogon', pogon)
execute_insert('opis', 'poreklo', poreklo_vozila)
execute_insert('opis', 'stanje', stanje)
execute_insert('opis', 'vlasnistvo', vlasnistvo)
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
cur.close()
conn.close()

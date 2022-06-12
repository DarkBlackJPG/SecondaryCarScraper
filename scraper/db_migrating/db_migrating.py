import psycopg2
import pandas as pd
import numpy

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



conn = psycopg2.connect("dbname=polovniautomobili user=postgres password=123")
cur = conn.cursor()

print('Starting boja_eksterijer insertation')
for element in boja_eksterijer:
    if type(element) == float:
        break
    cur.execute("INSERT INTO public.boja (naziv) VALUES (%(element)s) ON CONFLICT DO NOTHING", {'element': element})

print('Starting boja_enterijer insertation')
for element in boja_enterijer:
    cur.execute("INSERT INTO public.boja (naziv) VALUES (%(element)s) ON CONFLICT DO NOTHING", {'element': element})
conn.commit()

print('Starting emisiona_klasa insertation')
for element in emisiona_klasa:
    if type(element) == float:
        break
    cur.execute("INSERT INTO public.emisiona_klasa (naziv) VALUES (%(element)s) ON CONFLICT DO NOTHING", {'element': element})
conn.commit()

print('Starting gorivo insertation')
for element in gorivo:
    if type(element) == float:
        break
    cur.execute("INSERT INTO public.gorivo (naziv) VALUES (%(element)s) ON CONFLICT DO NOTHING", {'element': element})
conn.commit()

print('Starting grad insertation')
for element in grad:
    if type(element) == float:
        break
    cur.execute("INSERT INTO public.grad (naziv) VALUES (%(element)s) ON CONFLICT DO NOTHING", {'element': element})
conn.commit()

print('Starting karoserija insertation')
for element in karoserija:
    if type(element) == float:
        break
    cur.execute("INSERT INTO public.karoserija (opis) VALUES (%(element)s) ON CONFLICT DO NOTHING", {'element': element})
conn.commit()

print('Starting klima insertation')
for element in klima:
    if type(element) == float:
        break
    cur.execute("INSERT INTO public.klima (opis) VALUES (%(element)s) ON CONFLICT DO NOTHING", {'element': element})
conn.commit()

print('Starting materijal_enterijera insertation')
for element in materijal_enterijera:
    if type(element) == float:
        break
    cur.execute("INSERT INTO public.materijal (naziv) VALUES (%(element)s) ON CONFLICT DO NOTHING",
                {'element': element})
conn.commit()

print('Starting menjac insertation')
for element in menjac:
    if type(element) == float:
        break
    cur.execute("INSERT INTO public.menjac (opis) VALUES (%(element)s) ON CONFLICT DO NOTHING", {'element': element})
conn.commit()

print('Starting ostecenje insertation')
for element in ostecenje:
    if type(element) == float:
        break
    cur.execute("INSERT INTO public.ostecenje (opis) VALUES (%(element)s) ON CONFLICT DO NOTHING", {'element': element})
conn.commit()

print('Starting pogon insertation')
for element in pogon:
    if type(element) == float:
        break
    cur.execute("INSERT INTO public.pogon (opis) VALUES (%(element)s) ON CONFLICT DO NOTHING", {'element': element})
conn.commit()

print('Starting poreklo_vozila insertation')
for element in poreklo_vozila:
    if type(element) == float:
        break
    cur.execute("INSERT INTO public.poreklo (opis) VALUES (%(element)s) ON CONFLICT DO NOTHING", {'element': element})
conn.commit()

print('Starting stanje insertation')
for element in stanje:
    if type(element) == float:
        break
    cur.execute("INSERT INTO public.stanje (opis) VALUES (%(element)s) ON CONFLICT DO NOTHING", {'element': element})
conn.commit()

print('Starting vlasnistvo insertation')
for element in vlasnistvo:
    if type(element) == float:
        break
    cur.execute("INSERT INTO public.vlasnistvo (opis) VALUES (%(element)s) ON CONFLICT DO NOTHING", {'element': element})
conn.commit()

print('Starting zemlja_uvoza insertation')
for element in zemlja_uvoza:
    if type(element) == float:
        break
    cur.execute("INSERT INTO public.zemlja_uvoza (naziv) VALUES (%(element)s) ON CONFLICT DO NOTHING", {'element': element})
conn.commit()

print('Starting marka insertation')
for element in marka:
    if type(element) == float:
        break
    cur.execute("INSERT INTO public.marka (naziv) VALUES (%(element)s) ON CONFLICT DO NOTHING", {'element': element})
conn.commit()

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

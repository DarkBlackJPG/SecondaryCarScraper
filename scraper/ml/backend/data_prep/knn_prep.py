import pandas as pd
import psycopg2

manufacturer_label_encoded = {}
model_label_encoded = {}
stanje_label_encoded = {}
ostecenje_label_encoded = {}

def extract_relevant_data(connection, cursor):
    # Generate ids for manu & model
    cursor.execute('select marka.id from marka')
    results = cursor.fetchall()
    for i, result in enumerate(results):
        manufacturer_label_encoded[result[0]] = i

    cursor.execute('select model.id from model')
    results = cursor.fetchall()
    for i, result in enumerate(results):
        model_label_encoded[result[0]] = i

    cursor.execute('select stanje.id from stanje')
    results = cursor.fetchall()
    for i, result in enumerate(results):
        stanje_label_encoded[result[0]] = i

    cursor.execute('select ostecenje.id from ostecenje')
    results = cursor.fetchall()
    for i, result in enumerate(results):
        ostecenje_label_encoded[result[0]] = i

    # Fetch cars and create dataframe

    cursor.execute('select automobili.model, automobili.marka, automobili.kilometraza, automobili.godiste, automobili.kubikaza, automobili.ostecenje, automobili.stanje, coalesce(automobili.cena_popust, automobili.cena_regularna) as cena from automobili where automobili.model is not null and automobili.marka is not null and automobili.kilometraza is not null and automobili.godiste is not null and automobili.kubikaza is not null and ostecenje is not null and automobili.stanje is not null')
    results = cursor.fetchall()

    df = pd.DataFrame(results, columns=['model', 'marka', 'kilometraza', 'godiste', 'kubikaza', 'ostecenje', 'stanje', 'cena'])

    df['model'] = df['model'].apply(lambda x: model_label_encoded[x])
    df['marka'] = df['marka'].apply(lambda x: manufacturer_label_encoded[x])
    df['ostecenje'] = df['ostecenje'].apply(lambda x: ostecenje_label_encoded[x])
    df['stanje'] = df['stanje'].apply(lambda x: stanje_label_encoded[x])
    df['godiste'] = df['godiste'].astype('int32')
    df['cena'] = df['cena'].astype('int32')

    return df.drop(['cena'], axis=1), df['cena']

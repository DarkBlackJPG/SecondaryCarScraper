import pandas as pd
import psycopg2
import sys

manufacturer_label_encoded = {}
model_label_encoded = {}
stanje_label_encoded = {}
ostecenje_label_encoded = {}

price_encoded_ranges = [
    (0, 1999),
    (2000, 4999),
    (5000, 9999),
    (10000, 14999),
    (15000, 19999),
    (20000, 24999),
    (25000, 29999),
    (30000, sys.maxsize),
]

def min_max_normalize(df: pd.DataFrame):
    return (df-df.min())/(df.max()-df.min())

def z_score_standardization(series: pd.Series):
    return (series - series.mean()) / series.std()

def get_category_id_from_range(price):
    if price < 2000:
        return 0
    elif price >= 2000 and price <= 4999:
        return 1
    elif price >= 5000 and price <= 9999:
        return 2
    elif price >= 10000 and price <= 14999:
        return 3
    elif price >= 15000 and price <= 19999:
        return 4
    elif price >= 20000 and price <= 24999:
        return 5
    elif price >= 25000 and price <= 29999:
        return 6
    else:
        return 7

def extract_relevant_data_knn(cursor, normalization_method: str):
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

    cursor.execute('select automobili.model, automobili.marka, automobili.kilometraza, automobili.godiste, automobili.kubikaza, coalesce(automobili.cena_popust, automobili.cena_regularna) as cena from automobili where automobili.model is not null and automobili.marka is not null and automobili.kilometraza is not null and automobili.godiste is not null and automobili.kubikaza is not null')
    results = cursor.fetchall()

    df = pd.DataFrame(results, columns=['model', 'marka', 'kilometraza', 'godiste', 'kubikaza', 'cena'])

    df['model'] = df['model'].apply(lambda x: model_label_encoded[x])
    df['marka'] = df['marka'].apply(lambda x: manufacturer_label_encoded[x])
    df['godiste'] = df['godiste'].astype('int32')
    df['cena'] = df['cena'].apply(lambda x: get_category_id_from_range(x))
    data = df.drop(['cena'], axis=1)

    if normalization_method == 'minmax':
     data = min_max_normalize(data)
    elif normalization_method =='z-score':
        for col in data.columns:
            data[col] = z_score_standardization(data[col])

    return data, df['cena']


def extract_relevant_data_lin_reg(cursor, normalization_method: str):
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

    cursor.execute('select automobili.model, automobili.marka, automobili.kilometraza, automobili.godiste, automobili.kubikaza, coalesce(automobili.cena_popust, automobili.cena_regularna) as cena from automobili where automobili.model is not null and automobili.marka is not null and automobili.kilometraza is not null and automobili.godiste is not null and automobili.kubikaza is not null')
    results = cursor.fetchall()

    df = pd.DataFrame(results, columns=['model', 'marka', 'kilometraza', 'godiste', 'kubikaza', 'cena'])

    df['model'] = df['model'].apply(lambda x: model_label_encoded[x])
    df['marka'] = df['marka'].apply(lambda x: manufacturer_label_encoded[x])
    df['godiste'] = df['godiste'].astype('int32')
    df['cena'] = df['cena'].astype('int32')
    data = df.drop(['cena'], axis=1)

    if normalization_method == 'minmax':
     data = min_max_normalize(data)
    elif normalization_method =='z-score':
        for col in data.columns:
            data[col] = z_score_standardization(data[col])

    return data, df['cena']

import pandas as pd
import psycopg2
import sys

manufacturer_label_encoded = {}
model_label_encoded = {}

manufacturer_labels = {}
model_labels = {}

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

min_max_input = (-1, -1)
min_max_output = (-1, -1)

def min_max_denormalize_output(output, normalization_tuple):
    temp = output + normalization_tuple[0]
    temp *= (normalization_tuple[1]- normalization_tuple[0]) / 10 # jbg ne znam zasto je 10 puta veci broj
    return temp

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

def get_manus_models(cursor):
    cursor.execute("select marka.id, marka.naziv from marka where marka.naziv <> 'Ostalo'")
    results = cursor.fetchall()
    for i, result in enumerate(results):
        manufacturer_label_encoded[result[0]] = i
        manufacturer_labels[result[0]] = (i, result[1])

    cursor.execute("select model.id, model.naziv, model.marka from model join marka on marka.id = model.marka where model.naziv <> 'Ostalo'")
    results = cursor.fetchall()
    for i, result in enumerate(results):
        model_label_encoded[result[0]] = i
        model_labels[result[0]] = (i, result[1], manufacturer_labels[result[2]][1])

def extract_relevant_data_knn(cursor):
    data, price = extract_relevant_data_lin_reg(cursor)
    data = data.drop(['snaga_ks'], axis=1)
    return data, price.apply(lambda x: get_category_id_from_range(x))

def normalize(df, method):
    if method == 'minmax':
     df = min_max_normalize(df)
    elif method == 'z-score':
        for col in df.columns:
            df[col] = z_score_standardization(df[col])
    return df
def extract_relevant_data_lin_reg(cursor):
    cursor.execute("select automobili.model, automobili.marka, automobili.kilometraza, automobili.godiste, automobili.kubikaza, coalesce(automobili.cena_popust, automobili.cena_regularna) as cena, automobili.snaga_ks "
                   "from automobili join model on automobili.model = model.id join marka on automobili.marka = marka.id "
                   "where automobili.model is not null and automobili.marka is not null and automobili.kilometraza is not null "
                   "and automobili.godiste is not null and automobili.kubikaza is not null and coalesce(automobili.cena_popust, automobili.cena_regularna) > 500 and automobili.kilometraza < 500000 and automobili.kilometraza < 500000 and model.naziv <> 'Ostalo' and marka.naziv <> 'Ostalo'")
    results = cursor.fetchall()

    df = pd.DataFrame(results, columns=['model', 'marka', 'kilometraza', 'godiste', 'kubikaza', 'cena', 'snaga_ks'])

    df['model'] = df['model'].apply(lambda x: model_label_encoded[x])
    df['marka'] = df['marka'].apply(lambda x: manufacturer_label_encoded[x])
    df['godiste'] = df['godiste'].astype('int32')
    df['cena'] = df['cena'].astype('int32')
    data = df.drop(['cena'], axis=1)

    return data, df['cena']

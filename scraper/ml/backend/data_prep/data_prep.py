import pandas as pd
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


def min_max_normalize(df: pd.DataFrame, df_min=None, df_max=None):
    if df_min is None:
        df_min = df.min()
    if df_max is None:
        df_max = df.max()

    return (df - df_min) / (df_max - df_min)


def z_score_standardization(series: pd.Series, df_mean=None, df_std=None):
    if df_mean is None:
        df_mean = series.mean()
    if df_std is None:
        df_std = series.std()

    return (series - df_mean) / df_std


def get_category_id_from_range(price):
    if price < 2000:
        return 0
    elif 2000 <= price <= 4999:
        return 1
    elif 5000 <= price <= 9999:
        return 2
    elif 10000 <= price <= 14999:
        return 3
    elif 15000 <= price <= 19999:
        return 4
    elif 20000 <= price <= 24999:
        return 5
    elif 25000 <= price <= 29999:
        return 6
    else:
        return 7


def get_manus_models(cursor):
    cursor.execute("select marka.id, marka.naziv from marka where marka.naziv <> 'Ostalo'")
    results = cursor.fetchall()
    for i, result in enumerate(results):
        manufacturer_label_encoded[result[0]] = i
        manufacturer_labels[result[0]] = (i, result[1])

    cursor.execute(
        "select model.id, model.naziv, model.marka from model join marka on marka.id = model.marka where model.naziv <> 'Ostalo'")
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
    cursor.execute(
        "select automobili.model, automobili.marka, automobili.kilometraza, automobili.godiste, automobili.kubikaza, coalesce(automobili.cena_popust, automobili.cena_regularna) as cena, automobili.snaga_ks "
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

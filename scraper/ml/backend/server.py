from data_prep import data_prep
from models import knn
from models import lin_reg
import matplotlib.pyplot as plt
import psycopg2
from flask import Flask, Response, jsonify, request
from flask_cors import CORS
import pandas as pd
from sklearn.model_selection import train_test_split
import seaborn as sb  # visualizations
from sklearn.metrics import accuracy_score

from sklearn.linear_model import Ridge, LinearRegression
from sklearn.metrics import mean_squared_error, r2_score

import os


conn = psycopg2.connect("dbname=polovniautomobili user=postgres password=123")
cur = conn.cursor()

data_prep.get_manus_models(cur)  # Must be run, otherwise won't work

lin_reg_weights = None

for File in os.listdir('.'):
    if File.endswith('.lrw'):
        lin_reg_weights = File.title().lower()

if lin_reg_weights is None:
    print('Run prepare_lin_regression_for_app.py first, then run server!')
    exit()

linear_regression_model = lin_reg.LinearRegression()
linear_regression_model.read_weights(lin_reg_weights)

print('Server loaded the model')

cur.close()
conn.close()

app = Flask(__name__)
CORS(app)


@app.route('/fetch_all_models', methods=['GET'])
def fetch_all_models():
    return jsonify(data_prep.model_labels)


@app.route('/fetch_all_manufacturers', methods=['GET'])
def fetch_all_manufacturers():
    return jsonify(data_prep.manufacturer_labels)


@app.route('/execute_query', methods=['POST'])
def execute_query():
    # this should receive the correct values!!
    model = int(request.json['model'])
    marka = int(request.json['marka'])
    kilometraza = int(request.json['kilometraza'])
    godiste = int(request.json['godiste'])
    kubikaza = int(request.json['kubikaza'])
    konjskih_snaga = int(request.json['konjskih_snaga'])

    df = pd.DataFrame(columns=[
        'model',
        'marka',
        'kilometraza',
        'godiste',
        'kubikaza',
        'snaga_ks'
    ])

    df['model'] = [model]
    df['marka'] = [marka]
    df['kilometraza'] = [kilometraza]
    df['godiste'] = [godiste]
    df['kubikaza'] = [kubikaza]
    df['snaga_ks'] = [konjskih_snaga]

    print(df.head())

    prediction = linear_regression_model.predict_with_minmax(df)
    print(prediction)
    return jsonify({"result": abs(prediction.tolist()[0])})


if __name__ == "__main__":
    app.run(debug=True)  # start the webserver

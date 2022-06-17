from data_prep import data_prep
from models import knn
from models import lin_reg
import matplotlib.pyplot as plt
import psycopg2
from flask import Flask, Response, jsonify, request
from flask_cors import CORS
import pandas as pd
from sklearn.model_selection import train_test_split
import seaborn as sb # visualizations
from sklearn.metrics import accuracy_score

from sklearn.linear_model import Ridge, LinearRegression
from sklearn.metrics import mean_squared_error, r2_score

import os

def knnf():
    knn_data, knn_result = data_prep.extract_relevant_data_knn(cur, 'minmax')

    knn_data_train, knn_data_test, knn_result_train, knn_result_test = train_test_split(knn_data, knn_result,
                                                                                        test_size=0.2)

    colors = sb.color_palette("husl", 8)
    sb.pairplot(data=pd.concat([knn_data, pd.DataFrame(knn_result)], axis=1), hue='cena', palette=colors)
    plt.show()

    e_knn = knn.EuclideanKNN(knn_data_train, knn_result_train)
    m_knn = knn.ManhattanKNN(knn_data_train, knn_result_train)

    predictions_e = []
    predictions_m = []
    for i in range(0, len(knn_data_test)):
        predictions_e.append(e_knn.predict(knn_data_test.iloc[i]))
        predictions_m.append(m_knn.predict(knn_data_test.iloc[i]))

    print(f'Euclidean correct = {accuracy_score(knn_result_test, predictions_e) * 100}%')
    print(f'Manhattram correct = {accuracy_score(knn_result_test, predictions_m) * 100}%')

def lin():
    lin_reg_data, lin_reg_result = data_prep.extract_relevant_data_lin_reg(cur)
    # data_prep.min_max_input = (lin_reg_data.min(), lin_reg_data.max())
    # data_prep.min_max_output = (lin_reg_result.min(), lin_reg_result.max())
    lin_reg_data_normalized, lin_reg_result_normalized = data_prep.normalize(lin_reg_data,
                                                                             'minmax'), data_prep.normalize(
        lin_reg_result, 'minmax')
    lin_reg_data_train, lin_reg_data_test, lin_reg_res_train, lin_reg_res_test \
        = train_test_split(lin_reg_data_normalized, lin_reg_result, test_size=0.33)

    ridge = Ridge()
    ridge.fit(lin_reg_data_train, lin_reg_res_train)
    p = ridge.predict(lin_reg_data_test)
    print(lin_reg_res_test[:5].to_list())
    print(p[:5].tolist())
    print(mean_squared_error(lin_reg_res_test, p))
    # print(lin_reg_res_test.to_list())
    print('----------')
    lin = LinearRegression()
    lin.fit(lin_reg_data_train, lin_reg_res_train)
    pl = lin.predict(lin_reg_data_test)
    print(pl[:5].tolist())
    print(mean_squared_error(lin_reg_res_test, pl))

    print('----------')
    lr = lin_reg.LinearRegression(lin_reg_data_train, lin_reg_res_train, 0.05, 10000, 0.01)
    lr.fit(lin_reg_data_train, lin_reg_res_train)
    predictions = lr.predict(lin_reg_data_test)
    lr.save_weights('naa')
    lr.read_weights(f'naa_feature_num_{lr.cols}.lrw')
    print(predictions[:5].tolist())
    print(mean_squared_error(lin_reg_res_test, predictions))

conn = psycopg2.connect("dbname=polovniautomobili user=postgres password=123")
cur = conn.cursor()

data_prep.get_manus_models(cur) # Must be run, otherwise won't work

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

@app.route('/fetch_all_models', methods = ['GET'])
def fetch_all_models():
    return jsonify(data_prep.model_labels)

@app.route('/fetch_all_manufacturers', methods = ['GET'])
def fetch_all_manufacturers():
    return jsonify(data_prep.manufacturer_labels)

@app.route('/execute_query', methods = ['POST'])
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
    return jsonify({ "result" : abs(prediction.tolist()[0])})

if __name__ == "__main__":
    app.run(debug=True) #start the webserver
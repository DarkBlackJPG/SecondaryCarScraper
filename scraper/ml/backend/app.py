import psycopg2
from flask import Flask, Response
from flask_cors import CORS
import json
from data_prep import data_prep
from models import knn
from models import lin_reg
import matplotlib.pyplot as plt
import numpy as np
import psycopg2
from flask import Flask, Response
from flask_cors import CORS
import json
import pandas as pd
from sklearn.model_selection import train_test_split
import seaborn as sb # visualizations
from sklearn.metrics import accuracy_score

def knn():
    knn_data, knn_result = data_prep.extract_relevant_data_knn(cur, 'z-score')

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
        # print(f'E: Predicted: {e_knn.predict(knn_data_test.iloc[i])}\tReal: {knn_result_test.iloc[i]}')
        predictions_e.append(e_knn.predict(knn_data_test.iloc[i]))
        predictions_m.append(m_knn.predict(knn_data_test.iloc[i]))

    print(f'Euclidean correct = {accuracy_score(knn_result_test, predictions_e) * 100}%')
    print(f'Manhattram correct = {accuracy_score(knn_result_test, predictions_m) * 100}%')

conn = psycopg2.connect("dbname=polovniautomobili user=postgres password=123")
cur = conn.cursor()

lin_reg_data, lin_reg_result = data_prep.extract_relevant_data_lin_reg(cur, 'minmax')

lin_reg_data_train, lin_reg_data_test, lin_reg_res_train, lin_reg_res_test\
    = train_test_split(lin_reg_data, lin_reg_result, test_size=0.2)

lr = lin_reg.LinearRegression(lin_reg_data_train, lin_reg_res_train, 0.01, 5000)

lr.fit(lin_reg_data_test, lin_reg_res_test)

cur.close()
conn.close()

exit()

app = Flask(__name__)
CORS(app)



@app.route("/")
def hello_world():
    return Response()

if __name__ == "__main__":
    app.run(debug=True) #start the webserver
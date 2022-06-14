import matplotlib.pyplot as plt
import numpy as np
import psycopg2
from flask import Flask, Response
from flask_cors import CORS
import json

conn = psycopg2.connect("dbname=polovniautomobili user=postgres password=123")
cur = conn.cursor()

# Return only one line
def read_script_from_file(script_location):
    with open(script_location, 'r', encoding='utf8') as script:
        temp = script.readlines()
        return "".join(map(str, temp))

def read_script_and_execute(script_location):
    sql_string = read_script_from_file(script_location)
    cur.execute(sql_string)
    headings = [desc[0] for desc in cur.description]
    return cur.fetchall(), headings,

top_10_script_location                      = '../scripts/top_10.sql'
grouped_by_km_script_location               = '../scripts/grouped_by_km.sql'
grouped_by_year_script_location             = '../scripts/grouped_by_year.sql'
automatic_manual_percent_script_location    = '../scripts/automatic_manual_percent.sql'
price_categorization_script_location        = '../scripts/price_categorization.sql'

top_10_results, _ = read_script_and_execute                     (top_10_script_location                  )
grouped_by_km_results, _ = read_script_and_execute              (grouped_by_km_script_location           )
grouped_by_year_results, _ = read_script_and_execute            (grouped_by_year_script_location         )
automatic_manual_percent_results, _ = read_script_and_execute   (automatic_manual_percent_script_location)
price_categorization_results, _ = read_script_and_execute       (price_categorization_script_location    )

cur.close()
conn.close()

app = Flask(__name__)
CORS(app)

@app.route("/")
def hello_world():
    return Response()

@app.route("/top_10_results")
def top_10_results_url():
    return Response(json.dumps(top_10_results),  mimetype='application/json')


@app.route("/grouped_by_km_results")
def grouped_by_km_results_url():
    return Response(json.dumps(grouped_by_km_results),  mimetype='application/json')


@app.route("/grouped_by_year_results")
def grouped_by_year_results_url():
    return Response(json.dumps(grouped_by_year_results),  mimetype='application/json')


@app.route("/automatic_manual_percent_results")
def automatic_manual_percent_results_url():
    return Response(json.dumps(automatic_manual_percent_results),  mimetype='application/json')


@app.route("/price_categorization_results")
def price_categorization_results_url():
    return Response(json.dumps(price_categorization_results),  mimetype='application/json')

if __name__ == "__main__":
    app.run(debug=True) #start the webserver
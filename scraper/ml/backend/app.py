import psycopg2
from flask import Flask, Response
from flask_cors import CORS
import json

import matplotlib.pyplot as plt
import numpy as np
import psycopg2
from flask import Flask, Response
from flask_cors import CORS
import json

conn = psycopg2.connect("dbname=polovniautomobili user=postgres password=123")
cur = conn.cursor()



cur.close()
conn.close()

app = Flask(__name__)
CORS(app)

@app.route("/")
def hello_world():
    return Response()

if __name__ == "__main__":
    app.run(debug=True) #start the webserver
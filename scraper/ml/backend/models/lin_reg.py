import math

import pandas as pd
import numpy as np

class LinearRegression():
    def __init__(self, dataset: pd.DataFrame
                 , expected_values: pd.Series
                 , alpha: float
                 , iterations: int):

        self.dataset = dataset
        self.expected_values = expected_values
        self.alpha = alpha
        self.m = dataset.shape[0]
        self.cols = dataset.shape[1]
        self.iterations = iterations
        self.w = np.zeros(self.cols)
        self.b = 0


    def fit(self, training_set: pd.DataFrame, training_set_vals: pd.Series):
        concat = pd.concat([training_set, training_set_vals], axis=1)
        for i in range(0, self.iterations):
            for index, row in concat.iterrows():
                hx = self.predict(row.drop(['cena'])).astype('int64')
                err = hx - row['cena']
                print(err)

                self.b = self.b - self.alpha / self.m * err

                self.w[0] = self.w[0] - self.alpha / self.m * (err * row['model'] + 0.75 * self.w[0])
                self.w[1] = self.w[1] - self.alpha / self.m * (err * row['marka'] + 0.75 * self.w[1])
                self.w[2] = self.w[2] - self.alpha / self.m * (err * row['kilometraza'] + 0.75 * self.w[2])
                self.w[3] = self.w[3] - self.alpha / self.m * (err * row['godiste'] + 0.75 * self.w[3])
                self.w[4] = self.w[4] - self.alpha / self.m * (err * row['kubikaza'] + 0.75 * self.w[4])



        pass

    def predict(self, entity: pd.DataFrame):
        t = self.b
        t += self.w[0] * entity['model']
        t += self.w[0] * entity['marka']
        t += self.w[0] * entity['kilometraza']
        t += self.w[0] * entity['godiste']
        t += self.w[0] * entity['kubikaza']
        return t
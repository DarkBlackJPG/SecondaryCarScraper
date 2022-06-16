import math

import pandas as pd
import numpy as np

from sklearn.metrics import mean_squared_error, r2_score
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
        for i in range(0, self.iterations):
            # hx = self.predict(training_set)
            # err = hx - training_set_vals
            # dataframe = pd.DataFrame(columns=[
            #     'model',
            #     'marka',
            #     'kilometraza',
            #     'godiste',
            #     'kubikaza'
            # ])
            # dataframe['model'] = err
            # dataframe['marka'] = err
            # dataframe['kilometraza'] = err
            # dataframe['godiste'] = err
            # dataframe['kubikaza'] = err
            #
            # dataframe = dataframe * training_set
            #
            # alpha_m = self.alpha / self.m
            #
            # dw0 = alpha_m * err.sum()
            # dw1 = alpha_m * dataframe['model'].sum()
            # dw2 = alpha_m * dataframe['marka'].sum()
            # dw3 = alpha_m * dataframe['kilometraza'].sum()
            # dw4 = alpha_m * dataframe['godiste'].sum()
            # dw5 = alpha_m * dataframe['kubikaza'].sum()
            #
            # self.b = self.b - dw0
            # self.w[0] = self.w[0] - dw1 + 0.1 * self.w[0]
            # self.w[1] = self.w[1] - dw2 + 0.1 * self.w[1]
            # self.w[2] = self.w[2] - dw3 + 0.1 * self.w[2]
            # self.w[3] = self.w[3] - dw4 + 0.1 * self.w[3]
            # self.w[4] = self.w[4] - dw5 + 0.1 * self.w[4]

            Y_pred = self.predict(training_set)

            # calculate gradients
            dW = (- (2 * (training_set.T).dot(training_set_vals - Y_pred)) + (2 * 0.01 * self.w)) / self.m
            db = - 2 * np.sum(training_set_vals - Y_pred) / self.m

            # update weights
            self.w = self.w - self.alpha * dW
            self.b = self.b - self.alpha * db

    def predict(self, entity: pd.DataFrame):
        return np.dot(entity, self.w) + self.b
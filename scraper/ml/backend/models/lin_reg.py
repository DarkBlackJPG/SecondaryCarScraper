import math

import pandas as pd
import numpy as np
import pickle

from sklearn.metrics import mean_squared_error, r2_score
class LinearRegression():
    def __init__(self, dataset: pd.DataFrame
                 , expected_values: pd.Series
                 , alpha: float
                 , iterations: int
                 , regularization: float):

        self.dataset = dataset
        self.expected_values = expected_values
        self.alpha = alpha
        self.m = dataset.shape[0]
        self.cols = dataset.shape[1]
        self.iterations = iterations
        self.regularization = regularization
        self.w = np.zeros(self.cols)
        self.b = 0


    def fit(self, training_set: pd.DataFrame, training_set_vals: pd.Series):
        for i in range(0, self.iterations):
            Y_pred = self.predict(training_set)
            dW = (- (2 * (training_set.T).dot(training_set_vals - Y_pred)) + (2 * self.regularization * self.w)) / self.m
            db = -2 * np.sum(training_set_vals - Y_pred) / self.m
            self.w = self.w - self.alpha * dW
            self.b = self.b - self.alpha * db

    def predict(self, entity: pd.DataFrame):
        return np.dot(entity, self.w) + self.b

    def save_weights(self, filename):
        with open(f'{filename}_feature_num_{self.cols}.lrw', 'wb') as fw:
            data = {
                'weights': self.w,
                'b': self.b
            }

            pickle.dump(data, fw)

    def read_weights(self, filename):
        with open(filename, 'rb') as fw:
            data = pickle.load(fw)
            self.w = data['weights']
            self.b = data['b']
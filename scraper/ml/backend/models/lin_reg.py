import math
import pandas as pd
import numpy as np
import pickle
from sklearn.metrics import mean_squared_error, r2_score

# Python imports allude me, had to copy
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

class LinearRegression():
    def __init__(self
                 , dataset: pd.DataFrame = None
                 , expected_values: pd.Series = None
                 , alpha: float = 0
                 , iterations: int = 0
                 , regularization: float = 0
                 , min_standardization: float = 0
                 , max_standardization: float = 0
                 , std_deviation: float = 0
                 , mean_deviation: float = 0):

        self.dataset = dataset
        self.expected_values = expected_values
        self.alpha = alpha
        self.min_standardization = min_standardization
        self.max_standardization = max_standardization
        self.std_deviation = std_deviation
        self.mean_deviation = mean_deviation
        self.m = 0
        self.cols = 0
        if dataset is not None:
            self.m = dataset.shape[0]
            self.cols = dataset.shape[1]
        self.iterations = iterations
        self.regularization = regularization
        self.w = np.zeros(self.cols)
        self.b = 0

    # TODO Reformat
    def fit(self, training_set: pd.DataFrame, training_set_vals: pd.Series):
        for i in range(0, self.iterations):
            Y_pred = self.predict(training_set)
            dW = (-(2 * (training_set.T).dot(training_set_vals - Y_pred)) + (2 * self.regularization * self.w)) / self.m
            db = -2 * np.sum(training_set_vals - Y_pred) / self.m
            self.w = self.w - self.alpha * dW
            self.b = self.b - self.alpha * db

    def predict(self, entity: pd.DataFrame):
        return np.dot(entity, self.w) + self.b

    def predict_with_minmax(self, entity: pd.DataFrame):
        minimaxed = min_max_normalize(entity, self.min_standardization, self.max_standardization)
        return self.predict(minimaxed)

    def predict_with_z_score(self, entity: pd.DataFrame):
        z_scored = z_score_standardization(entity, self.mean_deviation, self.std_deviation)
        return self.predict(z_scored)

    def add_min_max_parameters(self, min_standardization, max_standardization):
        self.min_standardization = min_standardization
        self.max_standardization = max_standardization

    def add_z_score_parameters(self, std_deviation, mean_deviation):
        self.std_deviation  = std_deviation
        self.mean_deviation = mean_deviation

    def save_weights(self, filename):
        with open(f'{filename}_feature_num_{self.cols}.lrw', 'wb') as fw:
            data = {
                'weights': self.w,
                'b': self.b,
                'min_standardization': self.min_standardization,
                'max_standardization': self.max_standardization,
                'std_deviation': self.std_deviation,
                'mean_deviation': self.mean_deviation
            }

            pickle.dump(data, fw)

    def read_weights(self, filename):
        with open(filename, 'rb') as fw:
            data = pickle.load(fw)
            self.w = data['weights']
            self.b = data['b']
            self.min_standardization = data['min_standardization']
            self.max_standardization = data['max_standardization']
            self.std_deviation = data['std_deviation']
            self.mean_deviation = data['mean_deviation']
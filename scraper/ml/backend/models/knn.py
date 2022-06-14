import pandas as pd
import math
import numpy as np


def manhattan_distance(x, y):
    return np.linalg.norm(x - y, ord=1)


def euclidean_distance(x, y):
    temp = np.linalg.norm(x - y, ord=2)
    return temp


class KNN():
    def __init__(self, dataset: pd.DataFrame, correct_values: pd.Series, k = None ):
        self.dataset = dataset
        self.correct_values = correct_values
        if k is None:
            self.k = math.floor(math.sqrt(dataset.shape[0]))
            if self.k % 2 == 0: # must be odd
                self.k += 1
        else:
            self.k = k

    def fit(self):
        print("Fit function doesn't exist")
        pass

    def change_k(self, k):
        if k <= 0 or math.floor(math.sqrt(self.dataset.shape[0])) < k:
            print('K is invalid')
            return False
        self.k = k

    def calculate_distances(self, prediction_data):
        raise NotImplementedError(self.__class__.__name__ + '.try_something')

    # TODO
    def predict(self, prediction_data):
        distances = self.calculate_distances(prediction_data)
        nearest_neighbors = distances.argsort()[: self.k]
        nearest_neighbor_price = self.correct_values[nearest_neighbors]
        return np.bincount(nearest_neighbor_price).argmax()

class EuclideanKNN(KNN):
    def calculate_distances(self,  prediction_data):
        return euclidean_distance(self.dataset, prediction_data)

class ManhattanKNN(KNN):
    def calculate_distances(self,  prediction_data):
        return manhattan_distance(self.dataset, prediction_data)

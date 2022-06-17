from models import knn
from models import lin_reg
from data_prep import data_prep
import psycopg2
from sklearn.model_selection import train_test_split, KFold
import seaborn as sb  # visualizations
from sklearn.metrics import accuracy_score, r2_score, mean_squared_log_error
import os
import matplotlib.pyplot as plt
import pandas as pd



def run_knn_test(model, knn_data_test, knn_result_test):
    predictions = []
    for i in range(0, len(knn_data_test)):
        predictions.append(model.predict(knn_data_test.iloc[i]))
    return accuracy_score(knn_result_test, predictions)


def KNN(model, knn_data_test, knn_result_test, model_name):
    default_k = model.k

    with open('./exploratory_testing_results/knn_testing_log.txt', 'a') as fle:
        print(f'{model_name}')
        fle.writelines([f'{model_name}\n'])
        print(f'Default k: {default_k}')
        fle.writelines([f'Default k: {default_k}\n'])
        accuracy_original = run_knn_test(model, knn_data_test, knn_result_test)
        print(f'Accuracy for k[{model.k}]: {accuracy_original}')
        fle.writelines([f'Accuracy for k[{model.k}]: {accuracy_original}\n'])
        accuracy_list = []
        best_acc = accuracy_original
        best_k = model.k
        _range = []
        iters = 0
        for k in range(1, default_k):
            if k % 2 == 0:
                continue
            iters += 1
            _range.append(iters)
            model.change_k(k)
            accuracy = run_knn_test(model, knn_data_test, knn_result_test)
            if accuracy > best_acc:
                best_acc = accuracy
                best_k = k
            accuracy_list.append(accuracy)
            print(f'Accuracy for k[{model.k}]: {accuracy}')
            fle.writelines([f'Accuracy for k[{model.k}]: {accuracy}\n'])

        _range.append(iters + 1)
        accuracy_list.append(accuracy_original)
        plt.clf()
        plt.plot(_range, accuracy_list)
        plt.savefig(f'./exploratory_testing_results/{model_name}_accuracy.png')
        print(f'Best accuracy for k[{best_k}]: {best_acc}\n')
        fle.writelines([f'Best accuracy for k[{best_k}]: {best_acc}\n'])


conn = psycopg2.connect("dbname=polovniautomobili user=postgres password=123")
cur = conn.cursor()

data_prep.get_manus_models(cur)

knn_data, knn_result = data_prep.extract_relevant_data_knn(cur)
lin_reg_data, lin_reg_result = data_prep.extract_relevant_data_lin_reg(cur)

cur.close()
conn.close()

lin_reg_data_normalized = data_prep.normalize(lin_reg_data, 'minmax')
knn_data_normalized = data_prep.normalize(knn_data, 'z-score')

colors = sb.color_palette("husl", 8)
sb.pairplot(data=pd.concat([knn_data_normalized, pd.DataFrame(knn_result)], axis=1), hue='cena', palette=colors)
plt.savefig('./exploratory_testing_results/KNN_data_distribution.png')

# KNN
knn_data_train, knn_data_test, knn_result_train, knn_result_test = train_test_split(knn_data, knn_result,
                                                                                    test_size=0.33)
model = knn.EuclideanKNN(knn_data_train, knn_result_train)
KNN(model, knn_data_test, knn_result_test, "EUCLIDEAN MODEL")
model = knn.ManhattanKNN(knn_data_train, knn_result_train)
KNN(model, knn_data_test, knn_result_test, "MANHATTAN MODEL")

# Ridge Regression

# Grid search best with R2 metric
ridge_data_train, ridge_data_test, ridge_result_train, ridge_result_test = train_test_split(lin_reg_data_normalized,
                                                                                            lin_reg_result,
                                                                                            test_size=0.33)

possible_regularization = [0.1, 0.5, 0.01, 0.05, 0.001]
possible_lr = [0.1, 0.5, 0.01, 0.05, 0.001]
iterations = [50, 100, 1000, 5000, 10000]

with open(f'./exploratory_testing_results/linear_regression_log.csv', 'a') as fil:
    print('Ridge regression')
    print('Regularization value\tLearning rate value\tIterations value\tR2')
    fil.writelines(['Regularization value,Learning rate value,Iterations value,R2\n'])

    best_reg = 0
    best_lr = 0
    best_iter = 0
    best_r2 = 0
    for reg in possible_regularization:
        for lr in possible_lr:
            for iter in iterations:
                _lin_reg = lin_reg.LinearRegression(lin_reg_data, lin_reg_result, lr, iter, reg)
                _lin_reg.fit(ridge_data_train, ridge_result_train)
                test_predictions = _lin_reg.predict(ridge_data_test)
                r2 = r2_score(ridge_result_test, test_predictions)
                if r2 > best_r2:
                    best_r2 = r2
                    best_reg = reg
                    best_lr = lr
                    best_iter = iter
                print(f'{reg}\t{lr}\t{iter}\t{r2}')
                fil.writelines([f'{reg},{lr},{iter},{r2}\n'])

    fil.writelines([f'\n'])
    fil.writelines([f'{best_reg},{best_lr},{best_iter},{best_r2}\n'])

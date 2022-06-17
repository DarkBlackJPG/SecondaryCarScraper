from data_prep import data_prep
from models import lin_reg
import psycopg2
from sklearn.model_selection import train_test_split
from sklearn.metrics import r2_score

conn = psycopg2.connect("dbname=polovniautomobili user=postgres password=123")
cur = conn.cursor()

data_prep.get_manus_models(cur)

# From linear_regression_log.csv
best_lr = 0.5
best_reg = 0.001
best_iter = 10000

lin_reg_data, lin_reg_result = data_prep.extract_relevant_data_lin_reg(cur)

cur.close()
conn.close()

lin_reg_data_normalized = data_prep.min_max_normalize(lin_reg_data)

min_val = lin_reg_data.min()
max_val = lin_reg_data.max()

ridge_data_train, ridge_data_test, ridge_result_train, ridge_result_test = train_test_split(lin_reg_data_normalized, lin_reg_result, test_size=0.33)

model = lin_reg.LinearRegression(lin_reg_data, lin_reg_result, best_lr, best_iter, best_reg, min_standardization=min_val, max_standardization=max_val)

model.fit(ridge_data_train, ridge_result_train)
test_predictions = model.predict(ridge_data_test)
r2 = r2_score(ridge_result_test, test_predictions)
print(f'R2 score achieved: {r2}')

model.save_weights('server_prepared')

print('Model prepared...')


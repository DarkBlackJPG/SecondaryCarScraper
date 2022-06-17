import pandas as pd

df = pd.read_csv('../polovni_automobili_database_.csv')
df.to_csv('../polovni_automobili_database_removed_newlines.csv')
import pandas as pd

df = pd.read_csv("IK17.csv", sep=",", index_col=False)
df.reset_index(drop=True, inplace=True)
print(df.head())

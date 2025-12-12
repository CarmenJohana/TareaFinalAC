import pandas as pd

df = pd.read_csv("datos.csv")
D_vals = df["D"]

D_vals.describe()
D_vals.mode()

frecuencias = df["D"].value_counts().sort_index()
print(frecuencias)

plt.hist(D_vals, bins=range(min(D_vals), max(D_vals)+2))
plt.xlabel("Valores de D")
plt.ylabel("Frecuencia")
plt.title("Distribución experimental del grado D")
plt.show()

df_1 = pd.read_csv("grupo_GF(53)_101s.csv")
D_vals_1 = df_1["D"]
D_vals_1.describe()

plt.hist(D_vals_1, bins=range(min(D_vals_1), max(D_vals_1)+2))
plt.xlabel("Valores de D")
plt.ylabel("Frecuencia")
plt.title("Distribución experimental del grado D")
plt.show()

frecuencias_1 = df_1["D"].value_counts().sort_index()
print(frecuencias_1)

df_2 = pd.read_csv("grupo_GF(3547)_202s.csv")
D_vals_2 = df_2["D"]

D_vals_2.describe()

plt.hist(D_vals_2, bins=range(min(D_vals_2), max(D_vals_2)+2))
plt.xlabel("Valores de D")
plt.ylabel("Frecuencia")
plt.title("Distribución experimental del grado D")
plt.show()

frecuencias_2 = df_2["D"].value_counts().sort_index()
print(frecuencias_2)

df_3 = pd.read_csv("Var4_T_4.354564204200142.csv")
D_vals_3 = df_3["D"]

D_vals_3.describe()

plt.hist(D_vals_3, bins=range(min(D_vals_3), max(D_vals_3)+2))
plt.xlabel("Valores de D")
plt.ylabel("Frecuencia")
plt.title("Distribución experimental del grado D")
plt.show()

frecuencias_3 = df_3["D"].value_counts().sort_index()
print(frecuencias_3)

df_4 = pd.read_csv("Var5_T_100.67333833299926.csv")
D_vals_4 = df_4["D"]

D_vals_4.describe()

plt.hist(D_vals_4, bins=range(min(D_vals_4), max(D_vals_4)+2))
plt.xlabel("Valores de D")
plt.ylabel("Frecuencia")
plt.title("Distribución experimental del grado D")
plt.show()

frecuencias_4 = df_4["D"].value_counts().sort_index()
print(frecuencias_4)
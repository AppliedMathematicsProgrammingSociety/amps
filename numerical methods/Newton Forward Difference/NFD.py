#Hunter: Tanvir Kabir '07
#Gamemaker: Irteza Asif '06

import numpy as np
import pandas as pd
dat = pd.read_csv('input.csv')
x = list(dat['x'])
y = list(dat['y'])
n = len(x)
p = float(input("Please enter the value at which you want to approximate the function: "))
t = y[0]
r = (p-x[0])/(x[1]-x[0])
f = np.zeros((n,n))

for i in range(n):
    f[i][0] = y[i]

for j in range(1,n):
    for i in range(0,n-j):
        f[i][j] = f[i+1][j-1] - f[i][j-1]

for j in range(1,n):
    M = 1
    for k in range(2,n):
        M = M*((r-(k-2))/(k-1))
        if k == j + 1 : break
    t = t + M*f[0][j]

df = pd.DataFrame(f) 
df.to_csv('table.csv')
print("The value at postion x = ", p , " is ", t)
print("Please open the file table.csv to see the difference table")

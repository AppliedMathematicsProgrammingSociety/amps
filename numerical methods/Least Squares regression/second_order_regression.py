import numpy as np

def summularray(arx, ary, exp, n):
    sum = 0
    i = 0
    while i < n:
        sum = sum + (arx[i] ** exp)*ary[i]
        i = i + 1
    return sum

def sumofarray(arr, exp, n):
    sum = 0
    i = 0
    while i < n:
        sum = sum + arr[i]**exp
        i = i + 1
    return sum

# Open the file for reading
n = int(input("Enter the number of values to read: "))
filename = "x_val.txt"#input("Enter the filename: ")
with open(filename, 'r') as file:
    x = np.zeros(n)
    for i in range(n):
        value = float(file.readline().strip())
        x[i] = value

print("The values read from the file are:", x)
filename = "y_val.txt"#input("Enter the filename: ")
with open(filename, 'r') as file:
    y = np.zeros(n)
    for i in range(n):
        value = float(file.readline().strip())
        y[i] = value

print("The values read from the file are:", y)
xi = []
for i in range(5):
    xi.append(sumofarray(x,i,n))

a = np.array([[xi[0],xi[1],xi[2]],[xi[1],xi[2],xi[3]],[xi[2],xi[3],xi[4]]])
print(a)

xiyi = []

for i in range(3):
    xiyi.append(summularray(x,y,i,n))

b = np.array(xiyi)

print(b)

ainv = A_inv = np.linalg.inv(a)

ainv = ainv[::-1]

print(np.matmul(ainv,b))

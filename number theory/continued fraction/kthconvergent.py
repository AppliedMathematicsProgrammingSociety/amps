from math import gcd

#Shajiratul Yaqueen
#AMTH batch 6
#Purpose : taking the list of finite continued fraction of a rational, prints out the kth convergent
#Input : size of FCF, FCF as a list, k
#Output : the kth convergent
#Caution : n>=k does not work
def p(l,k):
    if k == 0:
        return l[0]
    elif k == 1:
        return l[0]*l[1]+1
    else:
        return l[k] * p(l, k-1) + p(l, k-2)

def q(l,k):
    if k == 0:
        return 1
    elif k == 1:
        return l[1]
    else:
        return l[k] * q(l, k - 1) + q(l, k - 2)

print("Size of the FCF : ")
n = int(input(''))

list = []

for i in range(n):
    list.append(int(input('')))

print("Which convergent do you want to find out?")
k = int(input(''))

p = p(list,k)
q = q(list,k)
m = gcd(p,q)
p = p/m
q = q/m
print(str(p)+'/'+str(q))

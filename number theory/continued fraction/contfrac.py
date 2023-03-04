#Shajiratul Yakeen
#AMTH batch 6
#Purpose : prints the continued fraction of a rational number
#Inputs : numerator and denominator of the number
#Output : continued fraction of the number in a list

print('Enter numerator and denominator ')

n = int(input())
d = int(input())

frac = []

for i in range(1,100):
    if n == 1:
        break
    frac.append(int(n/d))
    dummy = n - int(n/d)*d
    n = d
    d = dummy
print(frac)

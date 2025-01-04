def fastmodexp(a, m, n):
    res = 1
    pow = a%n
    while m>0:
        if m%2==1:
            res = (res*pow)%n
        pow = (pow*pow)%n
        m = m //2
    return res

R.<x,y> = PolynomialRing(RR, 2, "xy", order = "lex")

def div_multinomio(F, f, R = R):
    """
    Implementa el algoritmo de division
    de polinomios multivariados.
    De: Ideals, Varieties, and Algorithms, pag 65
    F es una lista de polinomios, f es el polinomio a dividir
    R es el conjunto de polinomios sobre el que se
    """
    q = [R(0) for _ in range(len(F))]
    r = R(0)
    p = f

    while p!=R(0):
        i=0
        divisionoccurred = False
        while i<len(F) and not divisionoccurred:

            quo = R.monomial_quotient(p.lt(),F[i].lt(),coeff=True)
            rem = p.lt().reduce(F[i].lt())

            if rem == 0:
                q[i] = q[i]+quo
                p = p - quo*F[i]
                divisionoccurred = True
            else:
                i += 1
        if not divisionoccurred:
            r = r+p.lt()
            p = p-p.lt()

    return q, r


# Ejemplo 1

f = x*y^2+y
f1 = x*y+1
f2 = y+1

# Ejemplo 2

f = x^2*y+x*y^2+y^2
f1 = y^2-1
f2 = x*y-1

F, r = div_multinomio([f1,f2], f)

print(F,r)

print(F[0]*f1+F[1]*f2 + r)


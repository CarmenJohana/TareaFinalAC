R.<x,y> = PolynomialRing(RR, 2, "xy", order = "lex")

def div_poly(F, f, R = R):
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




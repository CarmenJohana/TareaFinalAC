def poly_to_Macaulay(F, D):
    R = F[0].parent()
    order = R.term_order()
    
    # Paso 1: Construimos todos los polinomios u*f
    UF = []
    for f in F:
        df = f.degree()
        for d in range(D - df + 1):
            for u in R.monomials_of_degree(d):
                UF.append(u * f)

    # Paso 2: Construimos  el conjunto U de monomios que aparecen
    U = set()
    for g in UF:
        for m in g.monomials():
            U.add(m)

    # Paso 3: Ordenamos U con el orden monomial del anillo
    U = sorted(U, reverse=True)
    print(U)

    # Paso 4: Construimos la matriz de Macaulay
    M = []
    for g in UF:
        fila = [g.monomial_coefficient(u) for u in U]
        M.append(fila)

    return Matrix(M), U

R.<x,y> = PolynomialRing(QQ, order='lex')

f1 = x^2 + y^2 +5*x^2*y
f2 = x*y + 1
F = [f1, f2]

D = 3

# Llamado para construir la matriz de Macaulay
M, U = poly_to_Macaulay(F, D)

print(M)
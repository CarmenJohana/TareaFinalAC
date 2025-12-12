def macaulay_to_Poly(M, U):
    
    R = U[0].parent()
    polinomios_base = []
    
    for fila in M.rows():
        # Sage: M.rows() ya maneja la conversión de la matriz a una secuencia de filas
        
        if not fila.is_zero():
            # Se construyen los polinomios polinomio multiplicando los coeficientes por los monomios adecuados
            p = sum(c * m for c, m in zip(fila, U))
            
            # Se revisa que el coeficiente lider sea 1 en caso de que se use la función de forma general
            # sin embargo en el flujo resultante de la rutina find_Grobner_Basis esto resulta innecesario
            # porque siempre se reduce la matriz a su forma escalonada
            if p.lc() != 0 and p.lc() != 1:
                 p = p / p.lc()
                 
            polinomios_base.append(p)
            
    return polinomios_base

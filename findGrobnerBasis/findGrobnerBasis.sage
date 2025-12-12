def find_Grobner_Basis(F):
    grados = [f.degree() for f in F]
    D = max(grados)
    basis = F
    
    entered_loop = False
    
    while is_Groebner(basis) == False: 
        entered_loop = True
        M, U = poly_to_Macaulay(F,D)
        M_echelon = M.echelon_form()
        basis = macaulay_to_Poly(M_echelon, U)
        D += 1
        
    if entered_loop:    
        return basis, D-1
    else:
        return basis, D

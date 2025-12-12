#import "@preview/slydst:0.1.5": *
#import "@preview/algo:0.3.6": algo, i, d, comment, code


#set text(size: 10pt)

#show: slides.with(
  title: "Tarea final AC",
  layout: "large",
)


= Algoritmo de la división
== Código

#algo(
  title: "división",
  parameters: ($f_1, ... ,f_2$,$f$),
)[
  $q_1:=0; ... ; q_s:=0; r:=0$ $p:=f$\
  while $p!=0$ do #i\
    $i:=1$\
    divisionoccurred=false\
    while $i<= s$ and divisionoccurred=false do#i\
      if $op("lt")(f_i)$ divides $op("lt")(p)$ then#i\
        $q_i:=q_i+op("lt")(p)\/op("lt")(f_i)$\
        $p:=p-(op("lt")(p)\/op("op")(f_i))f_i$\
        divisionoccurred=true#d\
      else#i\
        $i:=i+1$#d#d\
    if  divisionoccurred = false then#i\
      $r:=r+op("lt")(p)$ $p:=p-op("lt")(p)$#d#d\
return $q_1,...,q_s,r$
]

== Ejemplo del libro
Sean $f_1=x y-1$, $f_2=y^2-1$, con órden lexicográfico. Si dividimos $f=x y^2-x$ por $F=(f_1,f_2)$ obtenemos:
$
x y^2-x=y  (x y-1) + 0 (y^2-1)+(-x+y)
$

Si tomamos $F=(f_2,f_1)$, obtenemos:
$
x y^2-x= x (y^2-1) + 0 (x y-1) + 0
$

En python:
```python
R.<x,y> = PolynomialRing(RR, 2, "xy", order = "lex")
f = x*y^2-x; f1=x*y-1; f2=y^2-1

[q1,q2], r = div_poly([f1,f2],f)
print("Caso 1:")
show(html(f"${f} = {q1} ({f1}) + {q2} ({f2}) + ({r})$"))
print("Caso 2:")
f = x*y^2-x
f1=x*y-1
f2=y^2-1

[q2,q1], r = div_poly([f2,f1],f)
show(html(f"${f} = {q2} ({f2}) + {q1} ({f1}) + {r}$"))
```
`Caso 1:`
$
  x*y^2 - x = x (y^2 - 1.00000000000000) + 0 (x*y - 1.00000000000000) + 0
$
`Caso 2:`
$
  x*y^2 - x = y (x*y - 1.00000000000000) + 0 (y^2 - 1.00000000000000) + (-x + y)
$


== Aplicado a polinomios aleatorios

```python
R.<x_1,x_2,x_3,x_4> = PolynomialRing(GF(7), order="lex")

f = R.random_element(degree=4, terms = 4)
F = [R.random_element(degree=1, terms=2) for _ in range(3)]
Q, r = div_poly(F, f, R = R)

show(html(f"""
$$
\\begin{{align*}}
f = &{f} \\\\
\\sum_i q_i f_i +r = &{
    sum([q*f for q,f in zip(Q,F)]) + r
    }\\\\
    f_1 = &{F[0]} \\quad \\quad q_1 = {Q[0]} \\\\
    f_2 = &{F[1]} \\quad \\quad q_2 = {Q[1]} \\\\
    f_3 = &{F[2]} \\quad \\quad q_3 = {Q[2]} \\\\
    r = &{r}
\\end{{align*}}
$$
"""))

```


$
  f = &3*x_1*x_2 + x_3^2 + 3*x_3 \
  sum_i q_i f_i +r = &3*x_1*x_2 + x_3^2 + 3*x_3\
  f_1 = &-x_2 + 3*x_4 quad quad   & q_1 = -3*x_1 \
  f_2 = &-2*x_3 - 3 quad quad  & q_2 = 3*x_3 + 1 \
  f_3 = &-x_2 - 1 quad quad  &q_3 = 0 \
  r = &2*x_1*x_4 + 3
$





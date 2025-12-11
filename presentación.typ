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
== Output
`Caso 1:`



F = ZZ/2;



I1 = read "Ideal :"
I = ideal(value I1)

C = primaryDecomposition I;

rmdupes = i ->
(
    for a from 0 to numgens i - 1 do --scan each generator
    (
        for b from 1 to RL do --check each x
        (
            if i_a % x_b == 0 then
            (
                for c from 0 to numgens i - 1 do
                    if i_c % y_b == 0 then
                    (
                        C = delete(i, C)
                    )
            )
        )
    )
)

scan(C, rmdupes)

C = intersect(C)

D = first entries gens C

chckdivsble = i ->
(
    for a from 0 to numgens i - 1 do
        for b from 1 to RL do
            if i_a % x_b == 0 and i_a % y_b == 0 then
                D = delete(i_a, D)
)

chckdivsble C

I = ideal D

E = first entries gens I

rmvmultples = i ->
(
    for a from 0 to numgens i - 1 do
    (
        for b from 0 to numgens i - 1 do
        (
            if i_b % i_a == 0 and i_b != i_a then
            (
                E = delete(i_b, E)
            )
        )
    )
)



rmvmultples I

I = ideal E;

print "cannonical form saved to variable I"
print E;

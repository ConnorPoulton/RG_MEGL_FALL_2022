F = ZZ/2;
RingLength = read "Ring Length:"
RL = value RingLength
R = F[x_1..x_RL,y_1..y_RL, Degrees=>{1..RL*2}]

I1 = read "Ideal :"
I = ideal(value I1)

C = primaryDecomposition I;

print "prim decomp";
print C;

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

print "without dupes";
print C;

C = intersect(C)

print "intersect of C"
print C;

D = first entries gens C

chckdivsble = i ->
(
    for a from 0 to numgens i - 1 do
        for b from 1 to RL do
            if i_a % x_b == 0 and i_a % y_b == 0 then
                D = delete(i_a, D)
)

chckdivsble C

print "Almost cannonical"
print D;

print D;

I = ideal D;

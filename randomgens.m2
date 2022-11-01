-- Parameters
F = ZZ/2;
RingLength = read "Ring Length:"
SampleSize = read "Sample Size:"
RL = value RingLength;
SS = value SampleSize;
R = F[x_1..x_RL,y_1..y_RL, Degrees=>{1..RL*2}];

-- Define list of polarized vars for nice indexing
-- NOTE: apply() doesn't appear to play nice with external rings
-- Append 1 to X and Y lists to allow for products with only x_i's or y_j's
X = apply(RL, i -> x_(i+1));
X = append(X,1);
Y = apply(RL, i -> y_(i+1));
Y = append(Y, 1);

-- Index list needed for apply() operator
indlist = apply(RL, i -> i + 1);

-- Construct dummy list for generator containment
-- NOTE: Be sure to define mutable lists instead of standard lists
ghold = apply(SS, i -> {x_((i % RL)+1)});
gnlist = new MutableList from ghold;

-- Assign random monomial products to elements of gnlists
-- Change apply index calls here to adjust for CF types 
for k from 0 to SS-1 do
(
    gnlist#k =
     apply(random(indlist), random(indlist), (i,j) ->
	    product(1..j, i ->
	    X_(random(min(indlist), max(indlist))) * Y_(random(min(indlist), max(indlist)))
				)
           )
    
)
 
print "Call specific list using gnlist#i and elements out of said list with gnlist#i_j";
print "See entire list with peek(gnlist)";
# gosper.m: Combinatoral Iteration in Matlab
Matlab code which, given a binary vector representing a subset, produces the next subset in lexicographical order.
Big-endian, so the following subsets are ascending:  

    000 < 001 < 010 < 100 < 011 < 101 < 110 < 111
    
Implemented roughly according to [Gosper's hack](https://en.wikipedia.org/wiki/Combinatorial_number_system#Applications).
    
#### Input

    v_s = Binary row vector with k of n bits set to 1.
    
#### Output
    v_snew = - Next binary vector with k bits set to 1. 
             - If there are none, left, then the first binary vector
               with (k+1) bits set to 1.
             - If k=n, then the 0 vector.
----

Also includes `n2set.m` and `set2n.m` which convert between a set and its place in the lexicographical ordering. 

#### A warning
These functions are implemented in the most naive way possible, they run in O(n), O(2^n) when they should run in O(log(n)). I haven't gotten around to fixin them because I didn't have to but if you need to use them then you should.

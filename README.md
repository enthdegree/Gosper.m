# gosper.m: Combinatoral Iteration
Matlab code which, given a binary vector representing a subset, produces the next subset in lexicographical order.
Big-endian, so the following subsets are ascending:  

    000 < 001 < 010 < 100 < 011 < 101 < 110 < 111
    
Implemented using [Gosper's hack](https://en.wikipedia.org/wiki/Combinatorial_number_system#Applications).
    
#### Input

    v_s = Binary row vector with k of n bits set to 1.
    
#### Output
    v_snew = - Next binary vector with k bits set to 1. 
             - If there are none, left, then the first binary vector
               with (k+1) bits set to 1.
             - If k=n, then the 0 vector.

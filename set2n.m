function n_n = set2n(v_set)
%% N2SET Set to number in lexicographical order
% Given a set, return which position it comes in following the usual
% lexicographical ordering. Big-endian, so the following subsets are
% ascending:  
%     000 < 001 < 010 < 100 < 011 < 101 < 110 < 111
%
% Note: Not very efficient/intelligent algorithm, just calls gosper.m 
% until the set is equal 
%
% Input: v_set = set 
% Output: n_n = set #
%
% Depends on: gosper.m
    
% Preamble
    N_SZ = length(v_set);
    v_set_can = zeros(1,N_SZ);
    n_n = 1;
    
% Iterate
    while(~isequal(v_set_can, v_set)) 
        v_set_can = gosper(v_set_can);
        n_n = n_n+1;
    end
    return;
end

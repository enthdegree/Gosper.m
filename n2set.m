function v_set = n2set(n_n, N_SZ)
%% N2SET Number to corresponding set in lexicographical order
% Given a number n_n and a set size N_SZ, return the n_n'th subset of N_SZ
% elements following the usual lexicographical ordering. Big-endian, so the
% following subsets are ascending: 
%     000 < 001 < 010 < 100 < 011 < 101 < 110 < 111
%
% Note: Not very efficient/intelligent algorithm, just calls gosper.m 
% n_n times. 
%
% Input: n_n = set # (from 1 to 2^N_SZ)
%        N_SZ = set size
% Output: v_set = n_n'th subset of N_SZ elements
%
% Depends on: gosper.m

% Preamble
    n_ni = n_n-1;
    v_set = zeros(1,N_SZ);
    
% Iteration
    for n_it=1:n_ni
        v_set = gosper(v_set);
    end
    return;
end

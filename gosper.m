function v_snew = gosper(v_s)
%% GOSPER Combinatoral Iteration
% Given a binary vector representing a subset, return the next subset in
% lexicographical order. Big-endian, so the following subsets are
% ascending:
%     000 < 001 < 010 < 100 < 011 < 101 < 110 < 111
%
% Input: v_s = Binary row vector with k of n bits set to 1.
% Output: v_snew = - Next binary vector with k bits set to 1.
%                  - If there are none, left, then the first binary vector
%                    with (k+1) bits set to 1.
%                  - If k=n, then the 0 vector.

%% Preamble
    % "Universe" size
    n_unisz = length(v_s);
    if(n_unisz == 0)
        v_snew = [];
        return;
    end
    
    % Unsigned add
    fn_uadd = @(n,m) mod(n+m, 2^n_unisz);
    
    % Binary vector to number and vice-versa
    v_pow = 2.^(((n_unisz:(-1):1))-1);
    fn_bv2n = @(v) sum(v_pow(v));
    fn_n2bv = @(n) logical(mod(floor(n./v_pow),2));
      

%% Computation
    v_snew = false(size(v_s));
    % If v_s is the whole universe, loop back to the empty set.
    if(all(v_s))
        return;
    end
    
    % Get rightmost set bit
    idx_u = find(v_s,1,'last');
    % If v_s is empty, return first nonempty set.
    if(isempty(idx_u))
        v_snew(end) = true;
        return;
    end
    n_u = v_pow(idx_u);

    % Set rightmost non-trailing bit 0, clear to the right
    v_v = fn_n2bv(fn_uadd(n_u, fn_bv2n(v_s)));

    if(all(~v_v))
        % We've exhausted all the sets of this size so go to first of
        % the next biggest size.
        n_setsz = sum(v_s);
        v_snew = fn_n2bv(2^(n_setsz+1)-1);
        return;
    end
    
    n_snew0 = fn_bv2n(xor(v_v,v_s))/(4*n_u);
    v_snew = or(v_v,fn_n2bv(n_snew0));
    return;
end

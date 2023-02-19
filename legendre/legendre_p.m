function l = legendre_p(n, p)

arguments
    n {isinteger}
    p {isprime}
end

[leg1, ~] = legendre(p);

if (mod(n, p) == 0)
    l = 0;
elseif (sum(find(leg1 == mod(n, p))) > 0) % if q is a quadratic residue mod p...
    l = 1;
else
    l = -1;
end


end
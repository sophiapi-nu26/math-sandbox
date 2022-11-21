function [v, p] = pisano(m)

arguments
    m (1,1) {isinteger}
end

v = [1, 1, mod(2, m)];
k = 3;

while ~(v(k) == v(k-1) && v(k) == 1)
    k = k + 1;
    v(k) = mod(v(k-2) + v(k-1), m);
end

p = size(v, 2) - 2;

end
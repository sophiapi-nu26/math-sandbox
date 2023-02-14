p = primes(5);

for k = p
    fp2 = 1:(k^2 - 1);
    multTable = fp2' * fp2;
    disp(multTable);
end
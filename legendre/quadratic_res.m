pArr = primes(100); % array of primes
numSolns = zeros(1, size(pArr, 2)); % array to store number of solutions for each prime

% find quadratic residues by brute force
for p = pArr
    fprintf('%d:\n', p);
    squares = [1:p-1 ; zeros(1, p-1)];
    countSolns = 2;
    for a = 1:(p-1)
        squares(2, a) = mod(a^2, p); % fill squares with the square of each number
    end
    leg1 = unique(squares(2,:)); % set array to store only unique values (effectively chopping half the list)
    disp(leg1);
    fprintf('(%d, %d)\n', 1, 0); % add trivial solutions
    fprintf('(%d, %d)\n', 0, 1);
    for a = leg1 % for each element a with legendre number of 1...
        if (sum(leg1 == a) > 0 && sum(leg1 == p+1-a) > 0) % if 1-a is also a quadratic residue...
            countSolns = countSolns + 1; % increment number  solutions
            fprintf('(%d, %d)\n', a, mod(p+1-a, p));
        end
    end
    numSolns(1, pArr == p) = countSolns; % insert number of solutions for p into array
end

disp([pArr;numSolns]);

figure;
plot(pArr, numSolns);

figure;
plot(pArr(mod(pArr, 4) == 1), numSolns(mod(pArr, 4) == 1)); % plot only the primes that are == 1 mod 4

figure;
plot(pArr(mod(pArr, 4) == 3), numSolns(mod(pArr, 4) == 3)); % plot only the primes that are == 3 mod 4


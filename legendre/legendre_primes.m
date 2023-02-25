% comparing the Legendre symbols of primes p and q

dim = 100;
primesArr = primes(dim);

% matrix containing L(p) mod q for all p, q in the first dim primes
legendreMat = zeros(size(primesArr, 2), size(primesArr, 2));

% matrix where sqrtMat(pInd, qInd) = sqrt(p) mod p for all 
% quadratic residues p mod q (p, q primes up to dim)
% for p not quadratic residue of q, sqrtMat(pInd, qInd) = 0
sqrtMat = zeros(size(primesArr, 2), size(primesArr, 2));

% index counters
pInd = 1;
qInd = 1;

% for each ordered pair (p, q), find L(p) mod q
for q = primesArr
    [leg1, isL1, squares] = legendre(q);
    for p = primesArr
        Lpq = legendre_p(p, q);
        legendreMat(pInd, qInd) = Lpq; % place L(p) (mod q) into pth row, qth col
        if (Lpq == 1)
            sqrts = find(squares(2, :) == mod(p, q));
            sqrtMat(pInd, qInd) = sqrts(1) - 1;
        end
        pInd = pInd + 1;
    end
    pInd = 1;
    qInd = qInd + 1;
end

figure;
plot(primes(dim), sum(legendreMat, 2))

% display output matrix
disp(legendreMat);

% create and display heatmap of legendre 
figure;
hMap = heatmap(legendreMat);
hMap.XDisplayLabels = primesArr;
hMap.YDisplayLabels = primesArr;
hMap.ColorbarVisible = 'off';
hMap.GridVisible = 'off';
axp = struct(hMap);       %you will get a warning
axp.Axes.XAxisLocation = 'top';
xlabel('q')
ylabel('p')
title('L(p) mod q')

% create and display heatmap of legendre p (mod q) * legendre q (mod p)
% (i.e. multiplication across the major diagonal)
figure;
recipMat = legendreMat .* legendreMat';
hMap = heatmap(recipMat);
hMap.XDisplayLabels = primesArr;
hMap.YDisplayLabels = primesArr;
hMap.ColorbarVisible = 'off';
hMap.GridVisible = 'off';
axp = struct(hMap);       %you will get a warning
axp.Axes.XAxisLocation = 'top';
xlabel('q')
ylabel('p')
title('L(p) mod q * L(q) mod p')

% create and display heatmap of square roots
figure;
hMap = heatmap(sqrtMat);
hMap.XDisplayLabels = primesArr;
hMap.YDisplayLabels = primesArr;
hMap.ColorbarVisible = 'off';
hMap.GridVisible = 'off';
axp = struct(hMap);       %you will get a warning
axp.Axes.XAxisLocation = 'top';
xlabel('q')
ylabel('p')
title('sqrt(p) mod q (if NaN, 0)')
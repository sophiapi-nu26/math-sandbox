[v, ratio, ratio_fil, N, D, N_fil, D_fil, hist] = plotPisano(10000);

% this makes weird periodic double spikey things
plot(N)
scatter(N)
scatter(1:numel(N), N)
scatter(1:numel(N), N, 2)
scatter(1:numel(D), D, 2)
scatter(1:numel(ratio_fil), ratio_fil, 2)
scatter(1:numel(ratio), ratio, 2)

subplot(3, 1, 1); 
scatter(1:numel(ratio), ratio, 2); 
subplot(3, 1, 2); 
scatter(1:numel(N), N, 2);
subplot(3, 1, 3); 
scatter(1:numel(D), D, 2);

ratio_frac = [N; D];


plot(ratio)
scatter(1:numel(ratio), ratio, 2)
scatter(1:numel(ratio_fil), ratio_fil, 2)
unique_frac = [N; D];
frac = [N; D];
unique_frac = unique(frac);
dum1 = N ./ D;
dum2 = unique(dum1);
dum3 = rat(dum2);
[dum3, dum4] = rat(dum2);
dum5 = [dum3; dum4];

temprat1 = ratio == 1;
indrat1 = find(temprat1); % all n (up to limit) such that pi(n) / n = 1
temprat2 = ratio == 2;
indrat2 = find(temprat2); % all n (up to limit) such that pi(n) / n = 2
temprat3 = ratio == 3;
indrat3 = find(temprat3); % all n (up to limit) such that pi(n) / n = 3
temprat4 = ratio == 4;
indrat4 = find(temprat4); % all n (up to limit) such that pi(n) / n = 4
% none for 5?
temprat6 = ratio == 6;
indrat6 = find(temprat6); % all n (up to limit) such that pi(n) / n = 6

max = 1000;
ratio_multiplier = 2;
x = 2:max;
scatter(x, ratio(x) ./ ratio(ratio_multiplier*x), 2)
title(sprintf('Pisano period ratio ratio between n and %dn up to n = %d', ratio_multiplier, max))
xlabel('n');
ylabel(sprintf('ratio(n) / ratio(%dn)', ratio_multiplier))

k = 5;
tab_ratrat = [1:100;k*(1:100);ratio(1:100);ratio(k*(1:100));ratio(1:100)./ratio(k*(1:100))];

% OBSERVATIONS UP TO 1e5:
% - ratio of 5 doesn't show up
% - for n = ratio(x), if n is an int, ratio(5^k * x) = n
% - in some cases, ratio(2x) = 1/2 ratio(x) (this generalizes to other x ->
% kx; stratification of ratios) (only rly tested up to 1e3 but reason to
% believe the stratification continues indefinitely)
% - points (on the standard pisano period plot) seem to coagulate roughly
% into lines, but most dont actually lie on the line 
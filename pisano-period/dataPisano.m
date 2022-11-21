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


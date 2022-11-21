function [v, ratio, ratio_fil, N, D, N_fil, D_fil, hist] = plotPisano(k)
% PLOTPISANO 
%
% Inputs: 
% k = calculate pisano period for all integers up to and including k
%
% Outputs:
%
% calculates pisano period (and related info) for all natural numbers up to 
% a given number

arguments
    k (1,1) {isinteger}
end

x = 2:k;
[~,v] = arrayfun(@pisano, x, 'UniformOutput', false);
x = [1 x];
v = [1 cell2mat(v)];
ratio = v ./ x;
% ratio = v ./ (x.^2);
% subplot(2, 1, 1);
scatter(x, v, 2, "blue", 'DisplayName', 'pi(n)')
title(sprintf("Pisano period pi(n) for naturals up to %d", k))
xlabel("n")
ylabel("pi(n)")

slopes = [1/3, 1/2, 2/3, 4/5, 1, 2, 3, 4, 6];
for m = slopes
    hold on;
    line = m*x;
    plot(x, line, 'LineWidth', 1, 'DisplayName', sprintf("pi(n) = %dn", m))
end

% subplot(2, 1, 2);
% scatter(x, ratio, '-g')

[N, D] = rat(ratio);

ratio_fil = unique(ratio);
hist = histcounts(ratio, ratio_fil);
[N_fil, D_fil] = rat(ratio_fil);

end
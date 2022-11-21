% plot avg connected components for square matrix of size n by n as n
% increases
trials = 20;
max_n = 20;
x1 = 1:max_n;
y1 = zeros(1, max_n);
for k = 1:max_n
    y1(1, k) = diagComp(k, k, trials);
end
subplot(2, 1, 1);
plot(x1, y1);

% plot avg connected components for square matrix of size n by n as trials
% increase
max_trials = 500;
n = 10;
x2 = 1:max_trials;
y2 = zeros(1, max_trials);
for k = 1:max_trials
    y2(1, k) = diagComp(n, n, k);
end
subplot(2, 1, 2);
plot(x2, y2);
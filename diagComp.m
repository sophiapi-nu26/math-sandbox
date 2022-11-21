% given an m by n grid, of diagonal connections, how many connected
% components are expected?

function [avg_connected] = diagComp(m, n, trials)

arguments
    m (1, 1) {mustBePositive, mustBeInteger}
    n (1, 1) {mustBePositive, mustBeInteger}
    trials (1, 1) {mustBePositive, mustBeInteger}
end

avg_connected = 0;

for t = 1:trials
    grid = rand(m, n) <= 0.5;
    A = zeros(m*n);
    for r = 1:m
        for c = 1:n
            if r ~= m
                A(ind(r, c, n), ind(r+1, c, n)) = A(ind(r, c, n), ind(r+1, c, n)) || (grid(r,c) ~= grid(r+1, c));
                A(ind(r+1, c, n), ind(r, c, n)) = A(ind(r, c, n), ind(r+1, c, n));
                if c ~= n
                    A(ind(r, c, n), ind(r+1, c+1, n)) = A(ind(r, c, n), ind(r+1, c+1, n)) || (((0 == grid(r,c)) && (0 == grid(r+1, c+1))));
                    A(ind(r+1, c+1, n), ind(r, c, n)) = A(ind(r, c, n), ind(r+1, c+1, n));
                end
            end
            if c ~= n
                A(ind(r, c, n), ind(r, c+1, n)) = A(ind(r, c, n), ind(r, c+1, n)) || (grid(r,c) ~= grid(r, c+1));
                A(ind(r, c+1, n), ind(r, c, n)) = A(ind(r, c, n), ind(r, c+1, n));
                if r ~= 1
                    A(ind(r, c, n), ind(r-1, c+1, n)) = A(ind(r, c, n), ind(r-1, c+1, n)) || (((1 == grid(r,c)) && (1 == grid(r-1, c+1))));
                    A(ind(r-1, c+1, n), ind(r, c, n)) = A(ind(r, c, n), ind(r-1, c+1, n));
                end
            end
        end
    end
    G = graph(A);
    bins = conncomp(G);
    avg_connected = avg_connected + size(unique(bins), 2) / trials;
end


end

function index = ind(r, c, numcols)
index = (r-1)*numcols + c;
end

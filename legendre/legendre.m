function [leg1, isL1 squares] = legendre(p)
% LEGENDRE
% 
% Inputs:
% p = prime to find legendre symbols for
%
% Outputs:
% leg1 = row vector containing the list of quadratic residues
% isL1 = binary row vector where isL1(i+1) = 1 iff i has legendre symbol 1 
% squares = 2 by p matrix, 1st row is 0:(p-1), 2nd is 1st row squared mod p

arguments
    p (1, 1) {isprime}
end

squares = [0:p-1 ; zeros(1, p)]; % 2 by p matrix
isL1 = zeros(1, p);
for a = 0:(p-1)
    % fill squares with the square of each number
    squares(2, a+1) = mod(a^2, p); % place in a+1 index because of 1-indexing
    isL1(mod(a^2, p)+1) = 1;
end
leg1 = [unique(squares(2,:))]; % set array to store only unique values (effectively chopping half the list)

end
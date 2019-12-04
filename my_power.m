function [vec, value] = my_power(start, A, tol, k)
%
% Power method for computing eigenvalues
%
if nargin < 4 || isempty(k)
    k = 0;
end
if nargin < 3 || isempty(tol)
    tol = 1e-4;
end
dd = 1;
x = start;
n = 10;
if k > 0
    for i = 1:k
        y = A*x;
        n = norm(x);
        x = y/n;
    end
else
    while dd > tol
        y = A*x;
        dd = abs(norm(x)-n);
        n = norm(x);
        x = y/n;
    end
end
vec = x;
value = n;

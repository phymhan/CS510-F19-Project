function [vec, value] = my_power(start, A, toler)
%
% Power method for computing eigenvalues
%
dd = 1;
x = start;
n = 10;
while dd > toler
    y = A*x;
    dd = abs(norm(x)-n);
    n = norm(x);
    x = y/n;
end
vec = x;
value = n;

function [value, k] = my_power_3(start, A, max_val, tol)
%
% Power method for computing eigenvalues
%

dd = 1;
x = start;
n = 10;
k = 0;
while dd > tol
    y = A*x;
    dd = abs(norm(x)-n);
%     dd = abs(n-max_val);
    n = norm(x);
    x = y/n;
    k = k + 1;
end
value = n;

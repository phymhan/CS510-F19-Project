function values = my_power_2(start, A, k)
%
% Power method for computing eigenvalues
%

x = start;
values = zeros(k, 1);
for i = 1:k
    y = A*x;
    n = norm(x);
    values(i) = n;
    x = y/n;
end

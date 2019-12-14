rng(42)

n = 10;
A = 5*randn(n);
x_gt = rand(n, 1);
b = A * x_gt;
start = rand(n+1, 1);
[~, x, k] = my_triangle(A, b, start, 1e-4);

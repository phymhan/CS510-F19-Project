n = 100;

% A matrix, A is column stochastic
Adj = rand(n);
Adj = double(Adj > 0.6);
Adj = Adj .* (1 - eye(n));

G = digraph(Adj);
plot(G);

A = Adj ./ sum(Adj, 1);
[V, D] = eig(A);
D(1)
D(2,2)

% A = A ./ sum(A, 1);

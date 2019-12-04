n = 10;
n_dangling = 0;
d = 0.85;

% A matrix, A is column stochastic
Adj = rand(n);
Adj = double(Adj > 0.8);
Adj = Adj .* (1 - eye(n));  % remove self circle

% manually add dangling nodes
i = randperm(n, n_dangling);
Adj(:,i) = 0;

% dangling nodes in Adj
i = find(sum(Adj, 1) == 0);
Adj(:,i) = 1;

G = digraph(Adj);
plot(G);

% matrix A
A = Adj ./ sum(Adj, 1);

% forming matrix M
M = d*A + (1-d)/n*ones(n);

[V, D] = eig(A);
D(1)

% A = A ./ sum(A, 1);

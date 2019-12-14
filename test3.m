rng(42)
tol = 1e-15;
% ns = [10 50 100 250 500 750 1000 2000];
ns = 2.^(1:10);
ks = [];
for n = ns
    % construct a symmetric matrix A
    A = rand(n);
    A = (A + A') / 2;
    
    [V, ~] = eig(A);
    % eigval_gt = rand(n, 1);
    eigval_gt = [1; 0.5; 0.5*rand(n-2, 1)];
    A = V * diag(eigval_gt) * V';
    
    % A = diag(rand(n,1));
    
    % compute by built-in eig
    % [V, D] = eig(A);
    % eigval_gt = D(sub2ind(size(A),1:size(A,1),1:size(A,2)));
    max_eigval_gt = max(eigval_gt);
    
    % https://math.unice.fr/~frapetti/CorsoF/cours4part2.pdf
    start = rand(n, 1);
    [max_eigvals, k] = my_power_3(start, A, max_eigval_gt, tol);
    ks(end+1) = k;
end

% plot(ns, ks)
bar(log2(ns), ks)
xlabel('n')
ylabel('iterations')
set(gca, 'xticklabel', ns)
% xticks([10 100 250 500 750 1000 2000])
% xtickangle(45)
% title(sprintf('n=%d',n))
set(gcf, 'color', [1 1 1])
% saveas(gcf, sprintf('error_plot_n%d.png', n))
print(gcf, sprintf('iter_plot'), '-dpdf');
for n = [10 50 100 250 500 750 1000]
    % n = 100;
    k = 1000;
    % construct a symmetric matrix A
    A = rand(n);
    A = (A + A') / 2;
    
    [V, ~] = eig(A);
    eigval_gt = rand(n, 1);
    A = V * diag(eigval_gt) * V';
    
    % A = diag(rand(n,1));
    
    % compute by built-in eig
    % [V, D] = eig(A);
    % eigval_gt = D(sub2ind(size(A),1:size(A,1),1:size(A,2)));
    max_eigval_gt = max(eigval_gt);
    
    % compute by power method
    % [~, ax_eigval_power] = my_power(rand(n, 1), A, 0.01, 3);
    
    % https://math.unice.fr/~frapetti/CorsoF/cours4part2.pdf
    start = rand(n, 1);
    max_eigvals = my_power_2(start, A, k);
    err = abs(max_eigvals - max_eigval_gt);
    semilogy(1:k, err)
    xlabel('iterations')
    ylabel('error (log)')
    title(sprintf('n=%d',n))
    set(gcf, 'color', [1 1 1])
    saveas(gcf, sprintf('error_plot_n%d.png', n))
end

function [has_solution, x, cnt] = my_triangle(A, b, start, tol)
if nargin < 4 || isempty(tol)
    tol = 1e-4;
end
[d, n] = size(A);  % dimension and number of points
% test if 0 is in the convext hull of [A, -b]
has_solution = true;
x = nan;
B = [A, -b];
p = zeros(d, 1);
if nargin < 3 || isempty(start)
    start = rand(n+1, 1);
end
a_pp = start / sum(start);

% i = randi([1 n+1], 1);
% a_v = zeros(n+1, 1);
% a_v(i) = 1;
% a_pp = a_v;

pp = B * a_pp;

cnt = 0;
while norm(pp-p) > tol
    % find a pivot
    [pivot_exists, v, i] = find_pivot(B, p, pp);
    if ~pivot_exists
        has_solution = false;
        break
    end
    a_v = zeros(n+1, 1);
    a_v(i) = 1;
    if (p-v)'*(pp-v) <= 0
        ppp = v;
        a_pp = a_v;
    else
        lambda = (p-pp)'*(v-pp) / ((v-pp)'*(v-pp));
        ppp = (1-lambda)*pp + lambda*v;
        a_pp = (1-lambda)*a_pp + lambda*a_v;
    end
    pp = ppp;
    cnt = cnt + 1;
end
x = a_pp(1:n) / a_pp(n+1);
fprintf('total iterations: %d\n', cnt)


function [pivot_exists, v, i] = find_pivot(A, p, pp)
[~, n] = size(A);
pivot_exists = false;
v = nan;
for i = 1:n
    vi = A(:,i);
    if (p-pp)'*vi >= 1/2*(p'*p-pp'*pp)
        pivot_exists = true;
        v = vi;
        break;
    end
end


% function [pivot_exists, v, i] = find_pivot(A, p, pp)
% [~, n] = size(A);
% pivot_exists = false;
% v = nan;
% ddd = zeros(n, 1);
% for i = 1:n
%     vi = A(:,i);
%     ddd(i) = norm(pp-vi)-norm(p-vi);
% end
% [B, I] = sort(ddd);
% if B(end) >= 0
%     pivot_exists = true;
%     i = I(end);
%     v = A(:,i);
% end

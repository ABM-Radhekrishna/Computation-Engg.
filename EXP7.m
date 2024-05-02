% Given data
x = [1; 2; 3; 4; 5];
f = [0; 2.5; 7; 2; 0];

% Point to estimate
x_est = 3.4;

% (a) Newton's interpolating polynomials
% Order 1
p1 = f(3);
% Order 2
p2 = f(3) + (x_est - x(3)) * (f(4) - f(3)) / (x(4) - x(3));
% Order 3
coeff = zeros(3, 3);
for i = 1:3
    coeff(i, 1) = f(i);
end
for j = 2:3
    for i = 1:(4-j)
        coeff(i, j) = (coeff(i+1, j-1) - coeff(i, j-1)) / (x(i+j-1) - x(i));
    end
end
p3 = coeff(1, 1);
for j = 1:2
    prod = 1;
    for i = 1:(j)
        prod = prod * (x_est - x(i));
    end
    p3 = p3 + coeff(1, j+1) * prod;
end

% (b) Lagrange polynomial
p_lagrange = 0;
for i = 1:5
    term = f(i);
    for j = 1:5
        if j ~= i
            term = term * (x_est - x(j)) / (x(i) - x(j));
        end
    end
    p_lagrange = p_lagrange + term;
end

% Display results
fprintf('(a) Newton''s interpolating polynomials:\n');
fprintf('Order 1: %.4f\n', p1);
fprintf('Order 2: %.4f\n', p2);
fprintf('Order 3: %.4f\n\n', p3);
fprintf('(b) Lagrange polynomial: %.4f\n', p_lagrange);


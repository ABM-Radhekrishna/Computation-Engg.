% Define the function
F = @(x) x.^10 - 1;

% Define the interval
a = 0;
b = 1.3;

% Define tolerance
tol = 1e-6;

% Initialize variables
x_mid = (a + b) / 2;
iteration = 0;

% Bisection method
while abs(F(x_mid)) > tol
    if F(a) * F(x_mid) < 0
        b = x_mid;
    else
        a = x_mid;
    end
    x_mid = (a + b) / 2;
    iteration = iteration + 1;
end

% Display the root and number of iterations
fprintf('Root: %.6f\n', x_mid);
fprintf('Number of iterations: %d\n', iteration);


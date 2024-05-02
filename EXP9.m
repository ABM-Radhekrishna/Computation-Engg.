% Define the function to be integrated
f = @(x) 4*(1-x-4*x.^3 + 2*x.^5);

% Define the limits of integration
a = -2;
b = 4;

% Analytical solution
syms x
analytical_solution = int(f(x), a, b);

% Trapezoidal rule
trapezoidal_rule = (b-a)*(f(a) + f(b))/2;

% Composite trapezoidal rule with n = 2
n2 = 2;
h = (b-a)/n2;
x = linspace(a, b, n2+1);
composite_trapezoidal_2 = h*(sum(f(x)) - (f(a) + f(b))/2);

% Composite trapezoidal rule with n = 4
n4 = 4;
h = (b-a)/n4;
x = linspace(a, b, n4+1);
composite_trapezoidal_4 = h*(sum(f(x)) - (f(a) + f(b))/2);

% Simpson's 1/3 rule
n_simpson_13 = 2; % Use two points for Simpson's 1/3 rule
x = linspace(a, b, n_simpson_13+1);
h = (b-a)/n_simpson_13;
simpsons_13 = h/3 * (f(a) + 4*sum(f(x(2:2:end-1))) + 2*sum(f(x(3:2:end-2))) + f(b));

% Simpson's 3/8 rule
n_simpson_38 = 3; % Use three points for Simpson's 3/8 rule
x = linspace(a, b, n_simpson_38+1);
h = (b-a)/n_simpson_38;
simpsons_38 = 3*h/8 * (f(a) + 3*sum(f(x(2:2:end-1))) + 3*sum(f(x(3:2:end-2))) + 2*sum(f(x(4:2:end-3))) + f(b));

% Display the results
fprintf('Analytical solution: %.4f\n', double(analytical_solution));
fprintf('Trapezoidal rule: %.4f\n', trapezoidal_rule);
fprintf('Composite trapezoidal rule with n = 2: %.4f\n', composite_trapezoidal_2);
fprintf('Composite trapezoidal rule with n = 4: %.4f\n', composite_trapezoidal_4);
fprintf('Simpson''s 1/3 rule: %.4f\n', simpsons_13);
fprintf('Simpson''s 3/8 rule: %.4f\n', simpsons_38);

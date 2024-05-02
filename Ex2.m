% Exp 2
% Define range of x values
x = linspace(-5, 5, 100);

% Define functions
y1 = x.^2;
y2 = x.^3;
y3 = exp(x);
y4 = sin(x) .* cos(x);

% Plot functions
figure;
plot(x, y1, 'r-', 'LineWidth', 2); % x^2 in red
hold on;
plot(x, y2, 'g--', 'LineWidth', 2); % x^3 in green dashed
plot(x, y3, 'b-.', 'LineWidth', 2); % exp(x) in blue dash-dot
plot(x, y4, 'm:', 'LineWidth', 2); % sin(x)*cos(x) in magenta dotted

% Aesthetic labels
xlabel('x');
ylabel('y');
title('Plot of Multiple Functions');
legend('y = x^2', 'y = x^3', 'y = e^x', 'y = sin(x) * cos(x)', 'Location', 'Best');
grid on;


% Initialize sum
sum_numbers = 0;

% Sum numbers from 1 to 100 using a for loop
for i = 1:100
    sum_numbers = sum_numbers + i;
end

% Display result
disp(['The sum of numbers from 1 to 100 is: ', num2str(sum_numbers)]);

% Define domain for x
x = linspace(-27, 2*pi, 150);

% Calculate tan(x)
y = tan(x);

% Plot tan(x)
figure;
plot(x, y, 'b-', 'LineWidth', 2);

% Aesthetic adjustments for the plot
xlim([-27, 2*pi]);
ylim([-10, 10]);
xlabel('x');
ylabel('tan(x)');
title('Plot of tan(x)');
grid on;

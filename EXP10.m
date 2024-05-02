% Define parameters
h_values = [0.5, 0.25]; % Step sizes
t_final = 4 ; % Final time

% Analytical solution
t = linspace(0, t_final, 100);
y_analytical = exp(-0.1*t);

% Euler's method
for j = 1:length(h_values)
    h = h_values(j);
    num_steps = t_final / h;
    y_euler = zeros(1, num_steps + 1);
    y_euler(1) = 1; % Initial condition
    
    for i = 1:num_steps
        y_euler(i+1) = y_euler(i) + h * (y_euler(i) - 1.1 * y_euler(i));
    end
    
    % Plot results
    figure;
    plot(t, y_analytical, 'r', 'LineWidth', 2);
    hold on;
    plot(0:h:t_final, y_euler, 'bo--', 'MarkerSize', 8, 'LineWidth', 1.5);
    xlabel('t');
    ylabel('y(t)');
    title(['Euler''s Method with h = ', num2str(h)]);
    legend('Analytical Solution', 'Euler''s Method', 'Location', 'Best');
    grid on;
    hold off;
end

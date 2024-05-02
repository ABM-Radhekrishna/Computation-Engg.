x = [0.6, 1.5, 1.6, 2.5, 3.5];
f = [0.9036, 0.3734, 0.3261, 0.08422, 0.01596];
h = diff(x);
fd_numerical = diff(f)./h;
fd_true = (-10*x.* exp(-2*x)) + (5*exp(-2*x));
plot(x(1:end-1), fd_numerical, 'g--o');
hold on;
plot(x, fd_true, '-o');
hold off;
title('Derivative v/s X')
xlabel('X')
ylabel('Derivative')
legend('Numerical Derivative', 'True Derivative')
grid on

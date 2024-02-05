clc
clear all
x = linspace(-6.2832,6.2832,150);
y = tan(x);
plot(x,y);
xlim([-2*pi, 2*pi]);
ylim([-10, 10]);
xlabel('Angles')
ylabel('tanx')


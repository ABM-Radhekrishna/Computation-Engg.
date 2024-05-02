%EXP 6
x = [0 2 4 6 9 11 12 15 17 19];
y = [5 6 7 6 9 8 8 10 12 12];
%p = polyfit(x,y,1); % for linear regression
p = polyfit(x,y,2); % for quadratic regression

scatter(x,y,'r*');
%y1 = p(2) + p(1)*x;
y1 = p(2)*x + p(1)*(x.^2) + p(3);
hold on;
plot (x,y1,'-b');


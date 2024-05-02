x = (-5:1:5);
y1 = x.^2; % .* and .^ is used as it indicates that the operation after the dot must be applied element wise to arrays or matrices 
y2 = x.^3;
y3 = exp(x);
y4 = sin(x).*cos(x);
plot(x,y1,'DisplayName','y = x^2')
hold on
plot(x,y2,'DisplayName','y = x^3')
hold on
plot(x,y3,'DisplayName','y = e^2')
hold on
plot(x,y4,'DisplayName','y = sinx+cosx')
xlabel('x');
ylabel('y');
title('plot of the function');






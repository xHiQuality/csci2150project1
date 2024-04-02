% plot function
x = linspace(0, 2*pi, 100);
y = sin(x);
plot(x, y);
title('Sine Wave');
xlabel('x');
ylabel('sin(x)');


% scatter function
x = randn(1, 100);
y = randn(1, 100);
scatter(x, y);
title('Random Scatter Plot');
xlabel('x');
ylabel('y');

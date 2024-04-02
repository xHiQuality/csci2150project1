% Multiple Plots on the Same Axes: Use hold on and hold off.
plot(x, sin(x));
hold on;
plot(x, cos(x), 'r');
legend('sin(x)', 'cos(x)');
hold off;


% Subplots: Display multiple plots in a single figure.
subplot(2,1,1); % 2 rows, 1 column, 1st subplot
plot(x, sin(x));
title('Sine Wave');

subplot(2,1,2); % 2nd subplot
plot(x, cos(x), 'r');
title('Cosine Wave');


% Saving plots
saveas(gcf, 'sine_wave.png');
exportgraphics(gca, 'cosine_wave.pdf', 'ContentType', 'vector');
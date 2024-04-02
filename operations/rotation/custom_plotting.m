% Axis Limits: Control the range of the axes using xlim and ylim.
xlim([0, 2*pi]);
ylim([-1, 1]);

% Markers and Line Styles: Customize the appearance of plots.
plot(x, y, 'r--', 'LineWidth', 2);

% Adding Legends and Grids: Enhance readability.
legend('Sine Function');
grid on;
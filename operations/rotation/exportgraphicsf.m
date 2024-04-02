% Generate some data for plotting
x = 0:0.1:10; % Create a vector of x values
y = sin(x); % Compute the sine of each x value to create y values

% Create a figure and plot the data
figure;
plot(x, y, '-r', 'LineWidth', 2); % Plot y vs. x with a red line of width 2
title('Sine Wave'); % Add a title to the plot
xlabel('X'); % Label the x-axis
ylabel('Y'); % Label the y-axis
grid on; % Turn the grid on for easier visualization

% Save the figure to a PNG file
exportgraphics(gca, 'sine_wave.png', 'Resolution', 300);

% Additionally, to save as a PDF with a specific size, you can use:
exportgraphics(gca, 'sine_wave.pdf', 'ContentType', 'vector', 'Resolution', 300);
% Generate some sample data
x1 = 1:10; % X values for the first set of data points
y1 = rand(1, 10) * 10; % Random Y values for the first set

x2 = 1:10; % X values for the second set of data points
y2 = rand(1, 10) * 20; % Random Y values for the second set

% Plot the first set of data points
plot(x1, y1, 'ro-'); % 'ro-' specifies red color, circle marker, and solid line
hold on; % Keep the plot active to add another set of data points

% Plot the second set of data points
plot(x2, y2, 'bs--'); % 'bs--' specifies blue color, square marker, and dashed line

% Add a legend to the plot
legend('Set 1', 'Set 2', 'Location', 'best');
% 'Location', 'best' tries to find the best location for the legend that interferes least with the data

% Add labels and title to the plot
xlabel('X-axis Label');
ylabel('Y-axis Label');
title('Sample Data Plot with Legend');

% Release the hold on the current plot
hold off;

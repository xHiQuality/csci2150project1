% Generate sample data for plotting
x = linspace(-2*pi, 2*pi, 100); % Generate 100 linearly spaced points between -2π and 2π
y = sin(x); % Calculate the sine of these points

% Plot the data
plot(x, y);
hold on; % Keep the plot active for further customization

% Customize the plot's appearance using the axis function
axis([-2*pi 2*pi -1 1]); % Set the x-axis from -2π to 2π and y-axis from -1 to 1

% Customize the x-axis tick marks to show key angles in radians
xticks([-2*pi, -3*pi/2, -pi, -pi/2, 0, pi/2, pi, 3*pi/2, 2*pi]);
xticklabels({'-2π', '-3π/2', '-π', '-π/2', '0', 'π/2', 'π', '3π/2', '2π'});

% Customize the y-axis tick marks to show key values
yticks([-1, -0.5, 0, 0.5, 1]);
yticklabels({'-1', '-0.5', '0', '0.5', '1'});

% Add labels and a title
xlabel('X-axis (radians)');
ylabel('Y-axis (value)');
title('Sine Wave with Custom Axis Ticks');

% Release the hold on the current plot
hold off;
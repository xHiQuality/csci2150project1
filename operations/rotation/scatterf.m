% Original vectors (columns represent different vectors)
A = [1, 2; 3, 4];

% Simulating rotated vectors for demonstration
% In practice, you would calculate these based on the rotation matrix
B = [2, 3; -1, -2];

% Extracting x and y coordinates for original vectors
x_original = A(1, :);
y_original = A(2, :);

% Extracting x and y coordinates for rotated vectors
x_rotated = B(1, :);
y_rotated = B(2, :);

% Create scatter plot for original vectors
scatter(x_original, y_original, 'filled', 'DisplayName', 'Original Vectors');
hold on; % Hold on to plot rotated vectors on the same graph

% Create scatter plot for rotated vectors
scatter(x_rotated, y_rotated, 'filled', 'DisplayName', 'Rotated Vectors');

% Customizing the plot
xlabel('X-axis'); % Label for the x-axis
ylabel('Y-axis'); % Label for the y-axis
title('Original and Rotated Vectors'); % Title of the plot
legend show; % Show legend to distinguish between original and rotated vectors
axis equal; % Equal aspect ratio for x and y axis
grid on; % Turn on the grid for better visualization

% Releasing the hold
hold off;

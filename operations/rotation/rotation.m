%Your first and last name: Cason Pittman
%Your 810/811 number: 811830205
%Lab 05

%Your task for this lab assignment is to correctly implement
%the rotation function based on its comments, 
%pseudocode, provided code, and examples. 
%The rotation function will return B,
%the matrix containing the 2D vectors in matrix A rotated 
%by theta degrees counterclockwise (ccw) around
%the origin. The rotation function will also plot
%the vectors in A and B.
%This function assumes arg1 is the name of the file 
%in the current working directory that contains A's elements.
%This function assumes arg2 is a string that
%represents theta in degrees. 
%We will assume theta is inputted as an integer. 
function [B] = rotation(arg1, arg2)
  
  A = readmatrix(arg1); %Do not change this line of code
  theta = round(str2double(arg2)); %Do not change this line of code
  
  %Use Matlab's display function to display the elements of A as shown in
  %the examples
  disp('A = ');
  disp(A);
  %Convert theta (in degrees) to radians and store it in thetaRadians
  thetaRad = deg2rad(theta);
  %Initialize the 2 by 2 rotation matrix based on thetaRadians
   mat = [cos(thetaRad) -sin(thetaRad); sin(thetaRad) cos(thetaRad)];   
  %Assign B to the rotation matrix times A
   B = mat * A;
  %Use Matlab's display function to display the elements of B as shown in
  %the examples
  disp('B = ');
  disp(B);
  %Assign x to the first row of values in A
  x = A(1,:);
  %Assign y to the second row of values in A
  y = A(2,:);
  %Assign xNew to the first row of values in B
  xNew = B(1,:);
  %Assign yNew to the second row of values in B
  yNew = B(2,:);
  %Call the scatter Matlab plotting function with arguments
  % x, y, 'black', and 'filled'
  scatter(x,y,'black','filled');
  %Tur on the plot's hold (uncomment the line below)
  % hold on;
  hold on;
  %Call the scatter Matlab plotting function with arguments
  % xNew, yNew, 'blue', and 'filled'  
  scatter(xNew,yNew,'blue','filled');
  %Setup the plot's legend (uncomment the two lines below)
  legendOutput =  ['vectors in A', compose('vectors in A rotated by %i degrees ccw', theta)];
  legend(legendOutput);  
  
  %Label the x and y axis (uncomment the two lines below)
  xlabel('x');
  ylabel('y');

  %Set the axis to equal spacing (uncomment the line below)
  axis equal;
  
  %Set the x axis to -5 to 5 and the y axis to -5 to 5 (uncomment the line below)
  axis([-5 5 -5 5]);
  
  %Set the xticks and yticks (uncomment the two lines below)
  xticks(-5:1:5);
  yticks(-5:1:5);
  
  %Turn off the plot's hold (uncomment the line below)
  hold off;
  
  %Uncomment the remaining code below to export the plot
  %to a file. The code below should not be modified.
  figureHandle = gcf;
  inputFile = split(arg1, '.'); %split fileName based on .
  outputFile = char(strcat(inputFile(1), '_', arg2, '_output.png'));
  fprintf("Exporting %s to current working directory\n", outputFile);
  fprintf("Please ignore any Matlab warnings\n", outputFile);
  exportgraphics(figureHandle, outputFile);
end


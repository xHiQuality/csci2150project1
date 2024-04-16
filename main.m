

function main()
    fileErase();
    addpath('tasks');

	% Create a welcome page
	% Implement it yourself
	
    while true
% Initialize GUI components for task selection
    choice = menu('Choose a task or quit the program:', ...
        'Natural Number to Binary', ...
        'Decode Two''s Complement Bit String', ...
        'Vector Operations', ...
        'Matrix Multiplication', ...
        'Rotate 2D Vectors', ...
        'Matrix Analysis', ...
        'Gaussian Elimination', ...
        'Root Finding (Newton and Secant Methods)', ...
        'Interpolation', ...
        'Lagrange Polynomial Interpolation', ...
        'Quit Program');
    
    
    % Switch case to handle task selection
    switch choice
        case 1
            writeToOutputFile(naturalToBinaryTask(), 'naturalToBinary:');
        case 2
            writeToOutputFile(decodeTask(),'Decode:');
        case 3
            writeToOutputFile(vectorsTask(), 'Vectors:');
        case 4
            writeToOutputFile(matrixmultiplyTask(),'MatrixMultiply:');
        case 5
            writeToOutputFile(rotationTask(),'Rotation:');
        case 6
            writeToOutputFile(typeofmatrixTask(),'Type of Matrix:');
        case 7
            writeToOutputFile(gaussianeliminationTask(),'Gaussian Elimination:');
        case 8
            writeToOutputFile(rootfindingTask(),'Root Finding:');
        case 9
            writeToOutputFile(interpolationTask(),'Interpolation:'); % Assuming custom task is using interpolation.m
        case 10
            writeToOutputFile(lagrangeTask(),'Lagrange:');
        case 11
            disp('Quitting program.');
            
            return; % Exit the program
    end


    end
end



% Utility function to write to output file
% Make necessary changes if required
function writeToOutputFile(dataStr,name)
    % Open the file in append mode
    file = fopen('output.txt','a');
    % Append the result to the file
    fprintf(file,[name, '\n', dataStr, '\n']);
    % Close the file
    disp('Output written to output.txt');
end

function fileErase()
fopen('output.txt','w');
end
%Your first and last name: Cason Pittman
%Your 810/811 number: 811830205
%Lab 09

%Your task for this lab assignment is to correctly implement
%the functions called by interpolation: 
%  vandermondematrix, ycoordinates, gaussianelimination
%based on their comments, provided code, and examples. 
%The function interpolation assumes arg1 is the name of the file 
%in the current working directory that contains C's elements,
%where C is a 2 by n matrix of 2D coordinates where n >= 1. 
%All x-coordinates in C are assumed to be distinct.  
%The function interpolation is already implemented for you to have
%consistent I/O with our examples. After you finish implementing
%the functions aforementioned, you should not change the source 
%code in interpolation.
function [] = interpolation(arg1)
  C = readmatrix(arg1);
  fprintf("Polynomial interpolation using the Vandermonde matrix for the 2D coordinates in C.\n");
  display(C);
  fprintf("Computing the Vandermonde matrix V.\n");
  V = vandermondematrix(C);
  display(V);
  fprintf("Storing the y-coordinates in C in b.\n");
  b = ycoordinates(C);
  display(b);
  fprintf("Using Gaussian elemination to solve the linear system Va = b.\n");
  a = gaussianelimination(V, b);
  display(a);
  n = size(a, 1);
  fprintf("Interpolating polynomial p(x) is below.\n");
  if(n == 1)
    fprintf("p(x) = %.4f\n", a(1));
  else
    fprintf("p(x) = %.4f + ", a(1));
    for i = 2 : 1 : (n-1)
      fprintf("%.4f*x^%d + ", a(i), (i-1)); 
    end
    fprintf("%.4f*x^%d\n", a(n), (n-1));
  end    
end

%Return V, the Vandermonde matrix of C.
%You may use Matlab's size and zeros functions, but no other
%Matlab functions can be used to implement this function.
function [V] = vandermondematrix(C)
    % Get the size of the input vector
    [m,n] = size(C);
    
    % Initialize the Vandermonde matrix
    V = zeros(n, n);
    
    % Populate the Vandermonde matrix
    for i = 1:n
        for j = 1:n
            % Calculate the element based on the power of the corresponding element in C
            V(i, j) = C(1,i)^(j-1);
        end
    end
end




%Return b, the n by 1 matrix with the y-coordinates 
%in C, where b(i) is the ith y-coordinate in C.
%You may use Matlab's size and zeros functions, but no other
%Matlab functions can be used to implement this function.
function [b] = ycoordinates(C)
    [m,n] = size(C);
    b = zeros(n,1);

    for i = 1:n
        b(i) = C(2,i);
    end

end


%Return x, a solution to the linear system Ax = b,
%where A is a n by n matrix, x is a n by 1 matrix,
%and b is a n by 1 matrix, and n > 0.
%You may use Matlab's size and zeros functions, but no other
%Matlab functions can be used to implement this function.
%You may use and modify code you wrote in a previous
%lab for gaussianelimination. If you did not implement
%this function in a previous lab, then you must implement this function
%on your own for this lab.
function [x] = gaussianelimination(A, b)

    [m,n] = size(A);
    
 for k = 1:m-1
     for i = k+1:m
         %get factor to manipulate row
         factor = A(i,k) / A(k,k);

         %apply factor
         for j = k:n
             A(i,j) = A(i,j) - factor * A(k,j);
         end
         
         b(i) = b(i) - factor * b(k);
     end
 end

 n = size(A,1);

    %initialize
    x = zeros(n,1);

    %get last var
    x(n) = b(n) / A(n,n);
    
    %decrements until 1
    for i = n-1:-1:1
        sum = 0;
        for j = i+1:n
            sum = sum + A(i,j) * x(j);
        end

        x(i) = (b(i) - sum) / A(i,i);
    end
    
end


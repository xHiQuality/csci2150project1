%Your first and last name: Cason Pittman
%Your 810/811 number: 811830205
%Lab 07

%Your task for this lab assignment is to correctly implement
%the functions called by gaussianelimination: 
%  forwardelimination, backwardsubstitution, and residualvector
%based on their comments, provided code, and examples. 
%The function gaussianelimination assumes arg1 is the name of the file 
%in the current working directory that contains A's elements,
%where A is a n by n matrix.
%The function gaussianelimination assumes arg2 is the name of the file 
%in the current working directory that contains b's elements,
%where b is a n by 1 matrix.
%The function gaussianelimination is already implemented for you to have
%consistent I/O with our examples. After you finish implementing
%the functions aforementioned, you should not change the source 
%code in gaussianelimination.
function [] = gaussianelimination(arg1, arg2)
  A = readmatrix(arg1);
  b = readmatrix(arg2);
  Acopy = A; %used for residual vector
  bcopy = b; %used for residual vector
  fprintf("Executing Gaussian elimination to solve the linear system Ax = b.\n")
  display(A);
  display(b);
  fprintf("Forward elimination\n")
  [A, b] = forwardelimination(A, b);
  display(A);
  display(b);
  fprintf("Backward substitution\n")
  x = backwardsubstitution(A, b);
  display(x);
  fprintf("Residual (error) vector\n")
  r = residualvector(Acopy, x, bcopy);
  display(r);  
end

%Return the agumented A and b after applying
%the forward elemination step(s) of Gauassian elimination
%to A and b. 
%You may use Matlab's size and zeros functions, but no other
%Matlab functions can be used to implement this function. 
function [A, b] = forwardelimination(A, b)
% get dimensions 
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
end

%Return x, the solution to linear system Ax = b, by
%using backward substitution. This function assumes
%A is a n by n uppertriangular matrix and
%b is a n by 1 matrix. 
%You may use Matlab's size and zeros functions, but no other
%Matlab functions can be used to implement this function. 
function [x] = backwardsubstitution(A, b)
    %get mat1 size
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

%Return r, the residual (error) vector, where
%r = b - Ax. You may use matrix operators {+, -, *}
%to implement this function.
function [r] = residualvector(A, x, b)
    r = b - A * x;
end

%Your first and last name: Cason Pittman
%Your 810/811 number: 811830205
%Lab 06

%Your task for this lab assignment is to correctly implement
%the functions called by typeofmatrix: 
%  issquare, isdiagonal, isidentity, 
%  isuppertriangular, islowertriangular, and iszero 
%based on their comments, provided code, and examples. 
%The function typeofmatrix assumes arg1 is the name of the file 
%in the current working directory that contains A's elements,
%where A is a matrix.
%The function typeofmatrix is already implemented for you to have
%consistent I/O with our examples. After you finish implementing
%the functions aforementioned, you should not change the source 
%code in typeofmatrix.
function [] = typeofmatrix(arg1)
  A = readmatrix(arg1); 
  display(A);
  print("issquare(A)", issquare(A));
  print("isdiagonal(A)", isdiagonal(A));
  print("isidentity(A)", isidentity(A));
  print("isuppertriangular(A)", isuppertriangular(A));
  print("islowertriangular(A)", islowertriangular(A));
  print("iszero(A)", iszero(A));
end

%Return true if A is a square matrix;
%otherwise return false.
%You may use Matlab's size function, but
%no other Matlab functions can be used to
%implement this function. 
function [output] = issquare(A)
    if (size(A,1) == size(A,2)) 
        output = true;
        return;
    end
    output = false;
    return;
end

%Return true if A is a diagonal matrix;
%otherwise return false. 
%You may use Matlab's size function and 
%Matlab's matrix notation, but NO other built-in 
%Matlab functions can be used to implement this function.
%You may call other functions you implement for
%this lab assignment.  
function [output] = isdiagonal(A)
    if (issquare(A))
        for i= 1:size(A,1)
            for j = 1:size(A,2)
                if(A(i,j) ~= 0 && i ~= j)
                    output = false;
                    return;
                end
            end
        end
        output = true;
        return;
    end
    output = false;
    return;
end

%Return true if A is an identity matrix;
%otherwise return false.
%You may use Matlab's size function and 
%Matlab's matrix notation, but NO other built-in 
%Matlab functions can be used to implement this function.
%You may call other functions you implement for
%this lab assignment.  
function [output] = isidentity(A)
 i = 1;
 j = 1;

    if (issquare(A))
        if (isdiagonal(A))
            while i <= size(A,1) 
                if(A(i,j) == 1)
                    output = true;
                end
                i = i + 1;
                j = j + 1;
            end
            output = false;
            return;
        end
    end
  output = false;
  return;
end

%Return true if A is an upper triangular matrix;
%otherwise return false.
%You may use Matlab's size function and 
%Matlab's matrix notation, but NO other built-in 
%Matlab functions can be used to implement this function.
%You may call other functions you implement for
%this lab assignment.  
function [output] = isuppertriangular(A)

    if (issquare(A))
        for i= 1:size(A,1)
            for j = 1:size(A,2)
                if (j < i && A(i,j) ~= 0)
                    output = false;
                    return;
                end
            end
        end
        output = true;
        return;
    end
  output = false;
  return;
end

%Return true if A is a lower triangular matrix;
%otherwise return false.
%You may use Matlab's size function and 
%Matlab's matrix notation, but NO other built-in 
%Matlab functions can be used to implement this function.
%You may call other functions you implement for
%this lab assignment.  
function [output] = islowertriangular(A)
  if (issquare(A))
        for i= 1:size(A,1)
            for j = 1:size(A,2)
                if (j > i && A(i,j) ~= 0)
                    output = false;
                    return;
                end
            end
        end
        output = true;
        return;
    end
  output = false;
  return;
end

%Return true if A is a zero matrix;
%otherwise return false.
%You may use Matlab's size function and 
%Matlab's matrix notation, but NO other built-in 
%Matlab functions can be used to implement this function.
%You may call other functions you implement for
%this lab assignment.  
function [output] = iszero(A)
  for i=1:size(A,1)
      for j=1:size(A,2)
            if (A(i,j) ~= 0)
                output = false;
                return;
            end
      end
  end
  output = true;
  return;
end

%Print label and true or false based on 
%logicalValue in a manner consistent with our examples. 
%This function is already implemented for you, and
%you should NOT change it.
function [] = print(label, logicalValue)
  if(logicalValue == true)
    fprintf("%s: true\n", label);
  else
    fprintf("%s: false\n", label);
  end
end

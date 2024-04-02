%Your first and last name: Cason Pittman  
%Your 810/811 number: 811830205
%Lab 04

%Your task for this lab assignment is to correctly implement
%the matrixmultiply function and the dotproduct function 
%based on their comments, pseudocode, provided code, and examples. 
%Assume arg1 is the name of an input file in the current working 
%directory that contains the elements of the n by m matrix A. 
%Assume arg2 is the name of an input file in the current working 
%directory that contains the elements of the m by r matrix B.
%Assume matricies A and B are compatible for matrix multiplication. 
%Since the matrixmultiply function calls the dotproduct function,
%the dotproduct function should be implemented first.
%Do not use any built in functions or operators that automatically
%compute the product (multiplication) of matricies or the dot product.  
function [P] = matrixmultiply(arg1, arg2)

  A = readmatrix(arg1); %initialize A from file
  B = readmatrix(arg2); %initialize B from file

  %initialize n to the number of rows in A
  n = size(A,1);
  %initialize m to the number of columns in A 
  m = size(A,2);
  %initialize r to the number of columns in B 
  r = size(B,2);

  if( m ~= size(B, 1) )
    fprintf("Error: Multiplication is undefined for A and B.\nGoodbye.\n");
    return;
  end
  
  % use Matlab's display function to display A as shown in the examples
  disp('A =');
  disp(A);
  % use Matlab's display function to display B as shown in the examples
  disp('B =');
  disp(B);

  % print the following as shown in the examples
  fprintf("Assume AB = P.\n");
  fprintf("Dot product(s) for calculating P:\n");
  
  % initialize P to an n by r matrix filled with zeros 
  % by using Matlab's zeros function
  P = zeros(n,r);
  

  %Pseudocode for computing P.
  % for each row i in P(i, j)
  %  for each column j in P(i, j) 
  %    assign rowA to the ith row in A
  %    assign colB to the jth row in B
  %    using the dotproduct function that you implented, 
  %    assign P(i, j) to the dotproduct of rowA and colB
  %    print the dot product as shown in the examples by using the code below
  %     fprintf("P(%i, %i) = ", i, j);
  %     printvectors(rowA, colB);
  %     fprintf(" = %.4f\n", P(i, j));
  for i = 1:n
      for j = 1:r
          rowA = A(i,:);
          colB = B(:,j);

          P(i,j) = dotproduct(rowA,colB);
          fprintf("P(%i, %i) = ",i,j);
          printvectors(rowA, colB);
          fprintf(" = %.4f\n", P(i,j));
      end
  end
  
  % use Matlab's display function to display P as shown in the examples
  disp('P =');
  disp(P);

end

%Return d, the dot product of vectors x and y.
%Use loop(s), variable(s), and simple arithmetic operator(s) to 
%to implement this function. You may use the size function.
%Do not use any built in functions or operators that calculate 
%the dot product automatically.
function [d] = dotproduct(x, y)
     d = 0;
    for i = 1:numel(x)
        % Add the product of corresponding elements to the sum
        d = d + x(i) * y(i);
    end

end

%Print a row vector u dot column vector v in a manner consistent
%with the provided examples.
%Do not change this function.
function [] = printvectors(u, v)
  %print u
  n = size(u, 2); 
  fprintf("[");
  for i = 1 : n-1
    fprintf("%.4f ", u(i));
  end
  
  %print .
  fprintf("%.4f].", u(n));

  %print v
  fprintf("[");  
  m = size(v, 1); 
  for i = 1 : m-1
    fprintf("%.4f ", v(i));
  end
  fprintf("%.4f]", v(m));
end

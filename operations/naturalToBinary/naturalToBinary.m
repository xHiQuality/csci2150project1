%Your first and last name: Cason Pittman
%Your 810/811 number: 811830205
%Lab 01

%Your task for this lab assignment is to correctly implement
%the naturalToBinry function and reverse function 
%based on the pseudocode comments and the examples provided.
function [] = naturalToBinary(arg1)
  %Convert arg1, which is a string, into an integer
  %and store its integer value in the variable x.
  %This is implemented for you on the next line.
  x = str2num(arg1);
  
  %Assign n to be the smallest number of bits 
  %needed to encode x.
  n = 8;

  %Initialze v to be a vector containing 1 row and n columns
  %of zeros using the zeros function in Matlab.
  v = zeros(1,n);
  
  %Implement an algorithm to convert x, a natural number,
  %to binary.
  %  Initialize q, the quotient, to x.
  q = x;
  %  Initialize i, an index variable, to 1.
  i = 1;
  %  While q is greater than zero:
  %    Store the remainder of q and 2 in v(i) (use mod function).
  %    Print this step using the following Matlab code:
  %      fprintf("%i / 2 = %i r %i\n", q, floor(q / 2), v(i));
  %    Assign q to the floor of q / 2.
  %    Increment i by 1.
  while q > 0
    v(i) = mod(q,2);
    fprintf("%i / 2 - %i r %i\n", q, floor(q/2), v(i));
    q = floor(q/2);
    i = i + 1;
  end
  %Assign v to be the reverse(v). You should implmement
  %the reverse function before doing this step.
  v = reverse(v);
  
  %Print the last line of output by calling the print(x, v) function.
  print(x,v);

end

%Return output, which is a vector
%containing the same values in v but
%in reverse order. v is assumed to be 
%a vector containing 1 row and n columns.
%  Ex: If v = [1 0 1 0 0] (n = 5 in this case), 
%    then reverse(v) should return [0 0 1 0 1].
function [output] = reverse(v)
  s = 1;
  e = length(v);
    while lt(s,e)
        temp = v(s);
        v(s) = v(e);
        v(e) = temp;
        s = s + 1;
        e = e - 1;
    end
  output = v;
end

%Print the last line of output in this program
%in a consistent manner. This function is already
%implemented for you, and it should NOT be modified.
%v is assumed to be a vector containing 1 row and n columns.
function [] = print(x, v)
  fprintf("%i in base-10 is equal to ", x);
  %Assign n to the number of columns in v
  n = size(v, 2); 
  for i = 1 : 1 : n
    fprintf("%i", v(i));
  end
  fprintf(" in binary\n");
end

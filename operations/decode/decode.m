%Your first and last name: Cason Pittman
%Your 810/811 number: 811830205
%Lab 02

%Your task for this lab assignment is to correctly implement
%the decode function based on the comments 
%and the examples provided. Assume b is an input bit string of length
%n, where n > 0, and b represents an integer encoded with n-bit two's complement. 
%The decode function should return x, the decoded base-10 integer of b.
function [] = decode(b)
  %Assign n to the length of b. Use the strlength function.
  n = strlength(b);
  

  %Print the first output statement
  fprintf("Assume %s represents an integer encoded with %i-bit two's complement\n", b, n); 
  
  %Use variables, a loop, and if statements to implement 
  %an algorithm to compute x, the decoded base-10 integer of b.  
  %Do not use any built-in Matlab functions that converts a binary
  %number or bit string to an integer. 
  %Do not use the flip Matlab function.
  
  %Declare variables
  isPositive = true;
  

  %check if positive or negative
  if b(1) == '0'
      isPositive = true;
  else
      isPositive = false;
  end

  a = b;

  %decrement from last index increasing power to 
  % calculate bits, if positive
  if isPositive
   output = toDecimal(b,n,isPositive);
  else
    
    for i = 1:n
        if b(i) == '0'
            b(i) = '1';
        else
            b(i) = '0';
        end
    end

     i = n;
     carry = true;
     while carry
       if b(i) == '0' && carry
            b(i) = '1';
            carry = false;
       elseif b(i) == '1' && carry 
            b(i) = '0';
            carry = true;
       end
     
        i = i - 1;
     end
    %fprintf("%s\n",b) debugging
    output = toDecimal(b,n,isPositive);
   end
 
  
  %After computing x, call the print(b, x) function
  print(a,output);
end

%Print the last line of output in this program
%in a consistent manner. This function is already
%implemented for you, and it should NOT be modified.
%b is assumed to be bit string of length n > 0, and 
%x is the decoded base-10 integer of b.
function [] = print(b, x)
  n = strlength(b);
  fprintf("%s decoded as a base-10 integer is %s \n", b, x);
end


%Converts a string representing a n bit long binary number into a base 10
%number, then concats a '-' sign if negative.
% b is the assumed to be bit string of length n > 0, and
% sign is a boolean value that determines if number is positive or negative
function output = toDecimal(b,n,sign)
    answer = 0;
    for i = n:-1:1
        if b(i) == '1'
           answer = answer + power(2,(n-i));
        end
    end
        if sign
            A = num2str(answer);
        else 
            A = num2str(answer);
            A = strcat('-',A);
        end
    output = A;
end
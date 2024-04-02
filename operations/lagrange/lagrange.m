%Your first and last name: Cason Pittman 
%Your 810/811 number: 811830205
%Lab 10

%Your task for this lab assignment is to correctly implement
%the function called by lagrange: 
%  lagrangecoefficients 
%based on its comments, provided code, and examples. 
%The function lagrange assumes arg1 is the name of the file 
%in the current working directory that contains C's elements,
%where C is a 2 by n matrix of 2D coordinates where n >= 1. 
%All x-coordinates in C are assumed to be distinct.  
%The function lagrange is already implemented for you to have
%consistent I/O with our examples. After you finish implementing
%the function(s) aforementioned, you should not change the source 
%code in lagrange.
function [] = lagrange(arg1)
  

format short;
  C = readmatrix(arg1);
  n = size(C, 2);
  fprintf("Assume p(x) is a polynmial function of degree %i that interpolates the \n2D coordinates in C using Lagrange polynomial interpolation form.\n", (n-1));
  display(C);
  fprintf("The coefficients of p(x) are stored in L below.\n");
  L = lagrangecoefficients(C);
  display(L);
  fprintf("The Lagrange polynomial interpolation form for p(x) is below.\n\n"); 
  print(L, C);

  
end

%Return L, the n by 1 matrix with the coefficients
%for the polyonomial p(x) that interpolates the points in C
%using Lagrange polynomial interpolation form.
%L(i) is shown in the examples for 1 <= i <= n.
%You may use Matlab's size and zeros functions, but no other
%Matlab functions can be used to implement this function.
function [L] = lagrangecoefficients(C)

n = size(C,2);
L = zeros(n,1);
co = 1;
    
        for j = 1:n
             for m = 1:n
                if j ~= m
                    co = co * (C(1,j)- C(1,m));
                   
                end
             end
        L(j,1) = C(2,j) / co;
        co = 1;
        end
       
 
end


%Print p(x) based on inputs L and C
%in a manner consistent with our examples.
%This function assumes the correct coefficients
%for p(x) are stored in L.
%Do not change this function. 
function [] = print(L, C)
  n = size(C, 2);
  fprintf("p(x) = ");
  for i = 1 : 1 : n
    if(i == 1)
      fprintf("%.4f", L(i));
    end
    if(i > 1)
      fprintf("       %.4f", L(i));
    end
    for j = 1 : 1 : n
      xj = C(1, j);
      if( (j ~= i) && (xj >= 0) )
        fprintf("(x-%.4f)", xj);
      end
      if( (j ~= i) && (xj < 0) )
        xj = -xj;
        fprintf("(x+%.4f)", xj);
      end
    end
    if( (n > 1) && (i ~= n) )
      fprintf(" + \n");
    end
  end
  fprintf("\n\n");
end

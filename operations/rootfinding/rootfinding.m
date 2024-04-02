%Your first and last name: Cason Pittman 
%Your 810/811 number: 811830205
%Lab 08

%Your task for this lab assignment is to correctly implement
%the functions called by rootfinding: 
%  newtonsmethod and secantmethod
%based on their comments, provided code, and examples.
%To implement newtonsmethod and secant method, use the algorithms
%discussed in lecture class and use the functions 
%f(x) and derivative(x) (where appropiate) defined in this file.
%The function rootfinding assumes arg1 represents an
%integer n, the number of iterations to run newton's method
%and secant method to find a root of f(x).
%The function rootfinding assumes arg2 represents a floating
%point number x_0, which is the initial guess for newton's method
%and the first initial guess for the secant method. 
%The function rootfinding assumes arg3 represents a floating
%point number x_1 (assume x_1 is not equal to x_0), which is the second 
%initial guess for the secant method.
%The function rootfinding is already implemented for you to have
%consistent I/O with our examples. After you finish implementing
%the functions aforementioned, you should not change the source 
%code in rootfinding.
function [] = rootfinding(arg1, arg2, arg3)
  n = ceil(str2double(arg1));
  x_0 = str2double(arg2);
  x_1 = str2double(arg3);
  fprintf("Assume f(x) = 2*x*cos(x) + 3*x*sin(x) - 9.\n")
  fprintf("Executing %d iterations of Newton's method to approximate a root of f(x)\n", n);
  fprintf("with initial guess %.5f.\n", x_0);
  roots1 = newtonsmethod(n, x_0);
  print(roots1);
  fprintf("\nExecuting %d iterations of the Secant method to approximate a root of f(x)\n", n);
  fprintf("with initial guesses %.5f and %.5f.\n", x_0, x_1);
  roots2 = secantmethod(n, x_0, x_1);
  print(roots2);  
end

%Return roots, a (n+1) by 1 matrix containing
%the results of Newton's method.
%roots(1) should be assigned to x_0. 
%roots(k) should be the root approximation for the kth iteration
%of Newton's method where 2 <= k <= (n+1).  
%You may use Matlab's size and zeros functions, but no other
%Matlab functions can be used to implement this function.
%You should call f(x) and derivative(x) to implement this function. 
function [roots] = newtonsmethod(n, x_0)
  roots = zeros(n+1,1);
  roots(1) = x_0;

  for i = 2:n+1
       roots(i) = roots(i-1) - f(roots(i-1)) / derivative(roots(i-1));
  end

  
end

%Return roots, a (n+2) by 1 matrix containing
%the results of the Secant method.
%roots(1) should be assigned to x_0.
%roots(2) should be assigned to x_1. 
%roots(k) should be the root approximation of the kth iteration
%of the Secant method where 3 <= k <= (n+2).  
%You may use Matlab's size and zeros functions, but no other
%Matlab functions can be used to implement this function.
%You should call f(x) to implement this function.  
function [roots] = secantmethod(n, x_0, x_1)
  roots = zeros(n+2,1);
  roots(1) = x_0;
  roots(2) = x_1;
  
  for i = 3: n+2
    roots(i) = roots(i-1) - f(roots(i-1)) * (roots(i-1) - roots(i-2)) ... 
    / (f(roots(i-1)) - f(roots(i-2)));
  end


end

%Return the value of f(x) (f evaluated at input x), 
%where f(x) = 2*x*cos(x) + 3*x*sin(x) - 9. 
%You should call upon this function, but do not 
%change this function.
function [value] = f(x)
  value = 2*x*cos(x) + 3*x*sin(x) - 9;
end

%Return the value of f'(x) (f' evaluated at input x), 
%where f'(x) = 2*cos(x) + 3*sin(x) + 3*x*cos(x) - 2*x*sin(x). 
%You should call upon this function, but do not 
%change this function.
function [value] = derivative(x)
  value = 2*cos(x) + 3*sin(x) + 3*x*cos(x) - 2*x*sin(x);
end

%Print roots, an n by 1 matrix of root approximations,
%in a manner consistent with our examples.
%Do not change this function. 
function [] = print(roots)
  n = size(roots, 1);
  for i = 1 : 1 : n 
    fprintf("x_%d = %.5f, f(x_%d) = %.5f\n", i-1, roots(i), i-1, f(roots(i)));
  end
end

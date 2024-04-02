%Your first and last name: Cason Pittman
%Your 810/811 number: 811830205
%Lab 03

%The vectors function is already implemented and it contains
%the correct I/O for this lab.
%You should NOT modify the code in the vectors function.
%Your task for this lab assignment is to correctly implement
%all of the following functions (called by the vectors function): 
%  magnitude, dotproduct, angle, radiantodegree, 
%  isperpendicular, and isparallel
%based on their comments and examples.  
%Assume arg1 is the name of an input file in the current working 
%directory that contains the elements of vector x. 
%Assume arg2 is the name of an input file in the current working 
%directory that contains the elements of vector y.
%Assume vectors x and y contain the same number of elements n and n > 0. 
function [] = vectors(arg1, arg2)
  x = readmatrix(arg1);
  y = readmatrix(arg2);
  n = size(x, 2); 
  printvector(x, "x");
  printvector(y, "y");
  if( size(y, 2) ~= n )
    fprintf("Error: vectors x and y must have the same number of elements.\nGoodbye.\n");
    return;
  end
  m1 = magnitude(x);
  fprintf("|x| = %f\n", m1);
  m2 = magnitude(y);
  fprintf("|y| = %f\n", m2);  
  d = dotproduct(x, y);  
  fprintf("x.y = %f\n", d);
  theta = angle(x, y);
  fprintf("theta = %f radians = %f degrees\n", theta, radiantodegree(theta));
  if(isperpendicular(x, y) == 1)
    fprintf("x and y are perpendicular\n");
  else
    fprintf("x and y are NOT perpendicular\n");
  end
  if(isparallel(x, y) == 1)
    fprintf("x and y are parallel\n");
  else
    fprintf("x and y are NOT parallel\n");
  end
end

%Print a vector v with text label.
%Do not change this function.
function [] = printvector(v, label)
  fprintf("%s = [", label);
  n = size(v, 2);
  for i = 1 : n-1
    fprintf("%f, ", v(i));
  end
  fprintf("%f]\n", v(n));
end

%Return m, the magnitude of vector v.
%Use loop(s), variable(s), and simple arithmetic operator(s) to 
%to implement this function. You may use the sqrt and size functions.
%Do not use any built in functions or operators that calculate 
%the magnitude automatically.
function [m] = magnitude(v)
m = sqrt(sum(v.^2));
 
end

%Return d, the dot product of vectors x and y.
%Use loop(s), variable(s), and simple arithmetic operator(s) to 
%to implement this function. You may use the size function.
%Do not use any built in functions or operators that calculate 
%the dot product automatically.
function [d] = dotproduct(x, y)
    d = sum(x .* y);
end

%Return theta, the angle (in radians) between vectors x and y.
%Use the arcos functions and other functions in this lab
%to implement this function.
%Do not use any built in functions or operators that calculate 
%theta automatically.
function [theta] = angle(x, y)
    cosTheta = dotproduct(x,y) / (magnitude(x) * magnitude(y));
    theta = acos(cosTheta);
end

%Return d the value in degrees of r radians.
%Use Matlab's pi for this function.
function [d] = radiantodegree(r)
    d = r * (180 / pi);
end

%Return 1 for p if vectors x and y are perpendicular.
%Otherwise, return 0 for p if vectors x and y are NOT perpendicular.
%Use an epsilon threshold of 2^-23 for this function.
function [p] = isperpendicular(x, y)
    p = abs(dotproduct(x,y)) < 2^-23;
  
end

%Return 1 for p if vectors x and y are parallel.
%Otherwise, return 0 for p if vectors x and y are NOT parallel.
%Use an epsilon threshold of 2^-23 for this function.
function [p] = isparallel(x, y)
    p = all((x / norm(x) == (y / norm(y))));
end

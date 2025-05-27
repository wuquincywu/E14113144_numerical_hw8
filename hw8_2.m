clc;clear;close;
f = @(x) 0.5*cos(x) + 0.25*sin(2*x);
a = -1; b = 1;
A = zeros(3);
B = zeros(3,1);
for i = 1:3
    deg = i-2;
    for j =1:3
        tempf = @(x) x.^(deg+j);
        A(i,j) = integral(tempf,a,b); 
    end
    tempf = @(x) x.^(deg+1).*f(x);
    B(i) = integral(tempf,a,b); 
end
const = A\B;
p = @(x,c) const(3)*x.^2 + const(2)*x + const(1);
errorf = @(x) (p(x) - f(x)).^2;
error = integral(errorf,a,b);

disp("Function: " + const(3) + "x^2 + " + const(2) + "x + " + const(1))
disp("error: " + error)
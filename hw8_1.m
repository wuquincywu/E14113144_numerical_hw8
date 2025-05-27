clc;clear;close;
x = [4, 4.2, 4.5, 4.7, 5.1, 5.5, 5.9, 6.3];
y = [102.6, 113.2, 130.1, 142.1, 167.5, 195.1, 224.9, 256.8];
%%
% (a)  y = a*x^2 + b*x + c
A = zeros(3);
b = zeros(3,1);
for i = 1:3
    deg = i+2;
    b(i,1) = sum(y.*x.^(i-1));
    for j =1:3
        A(i,j) = sum(x.^(deg - j)); 
    end
end
const = A\b;
p_a = @(x,c) c(1)*x.^2 + c(2)*x + c(3);
error_a = sum((p_a(x,const) - y).^2);
disp("Function: " + const(1) + "x^2 + " + const(2) + "x + " + const(3))
disp("error: " + error_a)
%%
% (b) ln(y) = ln(b) + a*x
Y = log(y);
A = zeros(2);
b = zeros(2,1);
for i = 1:2
    deg = i+1;
    b(i,1) = sum(Y.*x.^(i-1));
    for j =1:2
        A(i,j) = sum(x.^(deg - j)); 
    end
end
const = A\b;
p_b = @(x,c) exp(c(2))*exp(c(1)*x);
error_b = sum((p_b(x,const) - y).^2);

disp("Function: " + exp(const(2)) + "*" + "exp(" + const(1) + "x)")
disp("error: " + error_b)

%%
% (c) ln(y) = ln(b) + n*ln(x)
Y = log(y);
X = log(x);
A = zeros(2);
b = zeros(2,1);
for i = 1:2
    deg = i+1;
    b(i,1) = sum(Y.*X.^(i-1));
    for j =1:2
        A(i,j) = sum(X.^(deg - j)); 
    end
end
const = A\b;
p_c = @(x,c) exp(c(2))*x.^c(1);
error_c = sum((p_c(x,const) - y).^2);

disp("Function: " + const(2) + "*" + "x^" + const(1))
disp("error: " + error_c)
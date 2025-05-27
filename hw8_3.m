clc;clear;close;
n = 4; m = 16;
f = @(x) x.^2.*sin(x);
x = zeros(1,2*m);
y = zeros(1,2*m);
a = zeros(1,4);
b = zeros(1,3);
for i =1:2*m
    x(i) = -pi + (i-1)/m*pi;
    y(i) = f(x(i));
end
a0 = 1/m*sum(y);
for i = 1:n
    a(i) = 1/m*sum(y.*cos(i*x));
    if i ~= n
        b(i) = 1/m*sum(y.*sin(i*x));
    end
end

s4 = @(x) a0/2 + a(n)*cos(n*x);
ansb = integral(s4,0,1);
for i = 1:n-1
    s4 = @(x) a(i)*cos(i*x) + b(i)*sin(i*x);
    ansb = ansb + integral(s4,0,1);
end

ansc = integral(f,0,1);
error = 0;
term = 1:3;
for i = 1:2*m
    temp = y(i) - a0/2 - a(n)*cos(n*x(i)) - sum(a(1:3).*cos(term*x(i)) + b(1:3).*sin(term*x(i)));
    error = error + temp^2;
end

disp("function: ")
disp(a0/2 +" + " + a(n) + "*cos(4x) ");
disp( "+ " + a(1) + "*cos(1x) " + ...
      "+ " + a(2) + "*cos(2x) " + ...
      "+ " + a(3) + "*cos(3x) " )
disp("+ " + b(1) + "*sin(1x) " + ...
     "+ " + b(2) + "*sin(2x) " + ...
     "+ " + b(3) + "*sin(3x) " )

disp(ansb)
disp(ansc)
disp("abs error: " + ((ansb - ansc) / ansc)*100 + "%")
disp(error)
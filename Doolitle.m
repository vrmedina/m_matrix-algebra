clear;
clc;
format rat;
syms y1;
syms y2;
syms y3;
A = [4 1 2;1 2 0;2 0 5]
d = A(1,1)
e = A(1,2)
f = A(1,3)
a = A(2,1)/d
g = A(2,2)-a*e
h = A(2,3)-a*f
b = A(3,1)/d
c = (A(3,2)-b*e)/g
i = A(3,3)-(b*f)-(c*h)
L = [1 0 0; a 1 0; b c 1]
U = [d e f; 0 g h; 0 0 i]
R = L*U
y = [y1;y2;y3];
Ly = L*y
valores = [1 2 4]
valores = valores'
y = inv(L)*valores
x = inv(U)*y
for i=1:length(x)
fprintf('Los valores de x%i = %d \n',i,x(i) );
end
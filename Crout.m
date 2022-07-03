clear;
clc;
format rat;
A = [5 4 1;10 9 4;10 13 15]
a = A(1,1)
b = A(2,1)
d = A(3,1)
g = A(1,2)/a
e = A(3,2)-d*g
c = A(2,2)-b*g
h = A(1,3)/a
i = (A(2,3)-b*h)/c
f = A(3,3)-d*h-e*i
L=[a 0 0; b c 0; d e f]
U=[1 g h; 0 1 i; 0 0 1]
R = L*U;
B = [3.4 8.8 19.2]
B = B'
y = inv(L)*B
x = inv(U)*y
for i=1:length(x)
    fprintf('Los valores de x%i = %d \n',i,x(i) );
end
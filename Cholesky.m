clear;
clc;
format short;
A=[4 1 2;1 2 0;2 0 5]
A1=[4];
A2=[4 1; 1 2];
A3=[4 1 2;1 2 0;2 0 5];
det1=det(A1)
det2=det(A2)
det3=det(A3)
if(A==A')
    disp('Es simetrica.');
else
    disp('No es simetrica.');
end
if(det1>0 && det2>0 && det3>0)
    disp('Es definida positiva.')
else
    disp('No es definida positiva.')
end
L11=sqrt(A(1,1))
L21=A(2,1)/L11
L22=sqrt(A(2,2)-(L21^2))
L31=A(3,1)/L11
L32=(A(3,2)-L21*L31)/L22
L33=sqrt(A(3,3)-(L31^2)-(L32^2))
L=[L11 0 0; L21 L22 0; L31 L32 L33]
U=L'
R=L*U
U=chol(A)
L=U'
b=[1 2 4]
b=b'
y=L\b
x=U\y
for i=1:length(x)
fprintf('Los valores de x%i=%d \n',i,x(i) );
end

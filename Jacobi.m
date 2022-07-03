clear;
clc;
format long
syms x
syms y
syms z
%Ecuaciones
fx = (3+5*y+2*z)/10;
fy = (-3-4*x-3*z)/-10;
fz = (-3-x-6*y)/10;
%Matriz
A = [10 -5 -2;4 -10 3;1 6 10];
D1 = abs(A(1,1));
D1A = abs(A(1,2) + A(1,3));
D2 = abs(A(2,2));
D2A = abs(A(2,1) + A(2,3));
D3 = abs(A(3,3));
D3A = abs(A(3,1) + A(3,2));
if (D1 > D1A && D2 > D2A && D3 > D3A)
   disp('La Matriz es diagonalmente dominante');
   %Valores Iniciales
   x0 = 0;
   y0 = 0;
   z0 = 0;
   x_nuevo = double(subs(subs(fx,y0),z0));
   y_nuevo = double(subs(subs(fy,x0),z0));
   z_nuevo = double(subs(subs(fz,x0),y0));
   tolerancia=10^-3;
   eax=100;
   eay=100;
   eaz=100;
   Di=max([eax,eay,eaz]);
   i=0;
   fprintf('i, x0, y0, z0, eax, eay, eaz, Di \n');
   while(Di>tolerancia)
        x_nuevo = double(subs(subs(fx,y0),z0));
        y_nuevo = double(subs(subs(fy,x0),z0));
        z_nuevo = double(subs(subs(fz,x0),y0));
       eax=double(abs(x_nuevo-x0));
       eay=double(abs(y_nuevo-y0));
       eaz=double(abs(z_nuevo-z0));
       Di=max([eax,eay,eaz]);
       x0 = x_nuevo;
       y0 = y_nuevo;
       z0 = z_nuevo;
       i=i+1;
       fprintf('%d / %d / %d / %d / %d / %d / %d / %d \n', i,x0,y0,z0,eax,eay,eaz,Di);
   end
end   

clear
clc
format short
syms x
syms y
syms z
A=[27 6 -1;6 15 -2;1 1 54]
A1=[27];
A2=[27 6;6 15];
A3=A;
d1=det(A1);
d2=det(A2);
d3=det(A3);
if(d1>0 && d2>0 && d3>0)
disp('Es definida positiva.');
else
disp('No es definida positiva.');
end
fx = (85-6*y+z)/27;
fy = (72-6*x+2*z)/15;
fz = (110-x-y)/54;
D1 = abs(A(1,1));
D1A = abs(A(1,2) + A(1,3));
D2 = abs(A(2,2));
D2A = abs(A(2,1) + A(2,3));
D3 = abs(A(3,3));
D3A = abs(A(3,1) + A(3,2));
   x_ant=0;
   y_ant=0;
   z_ant=double(subs(fz, [x,y], [x_ant,y_ant]));
   z_nuevo = z_ant;
   x_nuevo = x_ant;
   y_nuevo = y_ant;
   tolerancia=10^-3;
   eax = 100;
   eay = 100;
   eaz = 100;
   Di = max([eax,eay,eaz]);
   i = 0;
   fprintf('i, x_ant, y_ant, z_ant, eax, eay, eaz, Di \n');
   while(Di>tolerancia)
       x_nuevo = double(subs(fx, [y,z], [y_nuevo,z_nuevo]));
       y_nuevo = double(subs(fy, [x,z], [x_nuevo,z_nuevo]));
       z_nuevo = double(subs(fz, [x,y], [x_nuevo, y_nuevo]));
      
       eax = abs(x_nuevo-x_ant);
       eay = abs(y_nuevo-y_ant);
       eaz = abs(z_nuevo-z_ant);
       Di = max([eax,eay,eaz]);
      
       x_ant=x_nuevo;
       y_ant=y_nuevo;
       z_ant=z_nuevo;
       i=i+1;
       fprintf('%d %d %d %d %d %d %d %d \n',i,x_ant,y_ant,z_ant,eax,eay,eaz,Di);
   end
   x_nuevo
   y_nuevo
   z_nuevo

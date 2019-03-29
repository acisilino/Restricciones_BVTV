function [cuenta] = deinhexahedro(p,vertices,faces); 

%   Entrada:
%   p : The points to be tested represented as an Nx3 matrix of XYZ 
%       coordinates, e.g., [x1 y1 z1; x2 y2 z2; °≠].
%       
%   vertices : The vertices of the polyhedron, in an Mx3 matrix of XYZ
%              coordinates, e.g., [x1 y1 z1; x2 y2 z2; °≠]. 
%          
%   faces : The faces of the polyhedron, in an Mx3 matrix, 
%       e.g., [a1,b1,c1; a2,b2,c2; ...].a b c are the index numbers of the 
%       three vertices forming the triangular faces.

%  Salida:
%  cuenta: numero de puntos fuera del poliedro
%
% ver https://la.mathworks.com/matlabcentral/fileexchange/47909-pointsinpolyhedron-test-if-points-are-in-polyhedron

% -------------------------------------------------------------------------

% Valores de prueba
vertices=[-1 -1 -1; 1,-1,-1; 1, 1,-1;-1,1,-1;...
          -1 -1  1; 1,-1, 1; 1, 1, 1;-1,1, 1];
faces=[1 3 2;1 4 3; ...
       1 2 6;1 6 5; ...
       2 3 7;2 7 6; ...
       3 4 8;3 8 7; ...
       4 1 5;4 5 8; ...
       5 6 7;5 7 8];
   
% Grafica hexaedro
fv.vertices=vertices;
fv.faces=faces;
figure, hold on, view(3)
patch(fv,'FaceColor','g','FaceAlpha',0.2)
   


end




b=[0 0 0;1 0 0;1 1 0;0 1 0;0 0 1;1 0 1;1 1 1;0 1 1];
c=[0 1 3;1 3 2;0 5 4;0 1 5;1 2 6;1 6 5;3 6 2;6 7 3;0 4 7;...
0 7 3;4 5 7;6 5 7];
a=[rand(50,3)*2-0.5;0 0.3 0.4;0.5 0.5 1];
c=c+1;
out=pinpolyhedron(a,b,c);

[m,n]=size(a);
for i=1:m
    if out(i,4)==0
        plot3(out(i,1),out(i,2),out(i,3),'bo','MarkerFaceColor','b')
    elseif out(i,4)==-1
        plot3(out(i,1),out(i,2),out(i,3),'ro','MarkerFaceColor','r')
    else
        plot3(out(i,1),out(i,2),out(i,3),'yo','MarkerFaceColor','y')
    end
end
axis image
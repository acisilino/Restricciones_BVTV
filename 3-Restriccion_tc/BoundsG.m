function [x1,G1,d1] = BoundsG(BVTV0,coefObj)

% BVTV0   : fraccion de volumen de la muestra
% coefObj : coeficientes de la funcion objetivo
% x1      : parametros de la muestra
% G1      : rigidez volumetrica resultante
% d1      : fraccion de volumen resultante

% -------------------------------------------------------------------------
%                                Datos
% -------------------------------------------------------------------------

deltaBVTV=BVTV0*0.005;       % tolerancia en la restriccion del BVTV
nsemillas=30;               % Numero de semillas
LB = [0.1375 0.1375  0.1375 0.6];  % Bounds de los parametros
UB = [0.1375 0.95    0.95   1.4];

% Polinomimos de la interpolacion de C
ordenpol=10;
load('Coeffs.mat',['COEFFS_O',num2str(ordenpol),'_4P']);
eval(['C11 = COEFFS_O',num2str(ordenpol),'_4P.C11;'])
eval(['C22 = COEFFS_O',num2str(ordenpol),'_4P.C22;'])
eval(['C33 = COEFFS_O',num2str(ordenpol),'_4P.C33;'])
eval(['C12 = COEFFS_O',num2str(ordenpol),'_4P.C12;'])
eval(['C13 = COEFFS_O',num2str(ordenpol),'_4P.C13;'])
eval(['C23 = COEFFS_O',num2str(ordenpol),'_4P.C23;'])
eval(['C44 = COEFFS_O',num2str(ordenpol),'_4P.C44;'])
eval(['C55 = COEFFS_O',num2str(ordenpol),'_4P.C55;'])
eval(['C66 = COEFFS_O',num2str(ordenpol),'_4P.C66;'])
eval(['clear COEFFS_O',num2str(ordenpol),'_4P'])

% -------------------------------------------------------------------------
%                              Parametros PS
% -------------------------------------------------------------------------

% Funcion de costo
FitnessFunction = @(x)FuncionObjetivoG(x,C11,C22,C33,C23,C13,C12,C44,...
    C55,C66,coefObj,ordenpol);

% Restricciones
ConstraintFunction = @(x)RestriccionBVTV(x,BVTV0,deltaBVTV);
A = [1 -1 0 0; 1 0 -1 0];
b = [0; 0;];

% -------------------------------------------------------------------------
%                               Llama PS
% -------------------------------------------------------------------------

x1=zeros(nsemillas,4);
G1=zeros(nsemillas,1);
d1=zeros(nsemillas,1);

for i=1:nsemillas
    
    % Semilla
    x0=LB+rand(1,4).*(UB-LB);
    
    
    % options = psoptimset('Display','iter','UseParallel',1,...
    %     'MeshAccelerator','on');
    % options = psoptimset('Display','iter');
    options=[]; 
    
    [x,fval,exitflag,output] = patternsearch(FitnessFunction,x0,A,b,[],[],...
        LB,UB,ConstraintFunction,options);
    
    % -----------------
    %     Resultado
    % -----------------
    
    % Evalua matriz elastica
    C=zeros(6,6);
    C=EMOD_4P([x 0 0 0],C11,C12,C13,C22,C23,C33,C44,C55,C66,ordenpol);
       
    % Almacena resultados
    x1(i,:)=x(:);
    G1(i)=(1/15)*(C(1,1)+C(2,2)+C(3,3)-(C(1,2)+C(2,3)+C(3,1))+3*(C(4,4)+C(5,5)+C(6,6)));
    d1(i)=density([x 0 0 0]);
    
    
end

end



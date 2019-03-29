function [x1,K1,d1] = BoundsK(BVTV0,coefObj)

% BVTV0   : fraccion de volumen de la muestra
% coefObj : coeficientes de la funcion objetivo
% x1      : parametros de la muestra
% G1      : rigidez volumetrica resultante
% d1      : fraccion de volumen resultante

% -------------------------------------------------------------------------
%                                Datos
% -------------------------------------------------------------------------

deltaBVTV=BVTV0*0.005;      % tolerancia en la restriccion del BVTV
nsemillas=20;               % Numero de semillas
LB = [0.06 0.06 0.06 0.6];  % Bounds de los parametros
UB = [0.95 0.95 0.95 1.4];

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

% Funciones de costo
FitnessFunction = @(x)FuncionObjetivoK(x,C11,C22,C33,C23,C13,C12,C44,...
    C55,C66,coefObj,ordenpol);

% Restricciones
ConstraintFunction = @(x)RestriccionBVTV(x,BVTV0,deltaBVTV);

% MaxDen = 0.420; % -> BV/TVmax = 0.50
  MaxDen = 0.390; % -> BV/TVmax = 0.45
% MaxDen = 0.356; % -> BV/TVmax = 0.40
% MaxDen = 0.324; % -> BV/TVmax = 0.35

A = [1 -1 0 0; 1 0 -1 0; 1.032333 0.068316 0.205844 0];
b = [0; 0; MaxDen];

% -------------------------------------------------------------------------
%                               Llama PS
% -------------------------------------------------------------------------

x1=zeros(nsemillas,4);
K1=zeros(nsemillas,1);
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
    K1(i)=(1/9)*(C(1,1)+C(2,2)+C(3,3)+2*(C(1,2)+C(2,3)+C(1,3)));
    d1(i)=density([x 0 0 0]);
    
    
end

end



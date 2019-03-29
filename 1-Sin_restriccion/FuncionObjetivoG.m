function y=FuncionObjetivoG(x,C11,C22,C33,C23,C13,C12,C44,C55,C66,...
    coefObj,ordenpol)

% los Cii son necesarios para definir EMOD_4P

% Evalua matriz elastica
C=zeros(6,6);
C=EMOD_4P([x 0 0 0],C11,C12,C13,C22,C23,C33,C44,C55,C66,ordenpol);

y = (1/15)*(C(1,1)+C(2,2)+C(3,3)-(C(1,2)+C(2,3)+C(3,1))+3*(C(4,4)+C(5,5)+C(6,6)));

y = coefObj*y;

end


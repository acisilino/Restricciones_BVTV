function [c,ceq]=RestriccionBVTV(x,BVTV0,deltaBVTV)

% Evalua fraccion de volumen
BVTV = density([x 0 0 0]);

c=abs(BVTV-BVTV0)-deltaBVTV*BVTV0;
ceq = [];

end


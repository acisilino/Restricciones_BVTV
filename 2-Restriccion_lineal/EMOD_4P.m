
function C = EMOD_4P(MP,C11,C12,C13,C22,C23,C33,C44,C55,C66,N)
n = size(MP,1);
x1 = MP(:,1);
x2 = MP(:,2);
x3 = MP(:,3);
x4 = MP(:,4);
x5 = MP(:,5);
x6 = MP(:,6);
x7 = MP(:,7);
POLYN = @(x1,x2,x3,x4,c) POLY(x1,x2,x3,x4,c,N,4,0);

C(1,1) = POLYN(x1,x2,x3,x4,C11);
C(1,2) = POLYN(x1,x2,x3,x4,C12);
C(1,3) = POLYN(x1,x2,x3,x4,C13);
C(2,1) = C(1,2);
C(2,2) = POLYN(x1,x2,x3,x4,C22);
C(2,3) = POLYN(x1,x2,x3,x4,C23);
C(3,1) = C(1,3);
C(3,2) = C(2,3);
C(3,3) = POLYN(x1,x2,x3,x4,C33);
C(4,4) = POLYN(x1,x2,x3,x4,C44);
C(5,5) = POLYN(x1,x2,x3,x4,C55);
C(6,6) = POLYN(x1,x2,x3,x4,C66);

end

clc

BVTV0=[0.065 0.07 0.08 0.09 0.10 0.11 0.12 0.13 ...
    0.14 0.15 0.16 0.17 0.18 0.19 0.20 0.21 0.22 0.23 ...
    0.24 0.25 0.26 0.27 0.28 0.29 0.30 0.31 0.32 0.33 ...
    0.34 0.35 0.36 0.37 0.38 0.39 0.40 0.41];

nptos=size(BVTV0,2);

E=1;
nu=0.3;
K=E/(3*(1-2*nu));
G=E/(2*(1+nu));

% Minima rigidez volumetrica
coefObj=1;
minK_tc2=ones(nptos,2);
minK_tc2(:,1)=abs(BVTV0(:));

parfor i=1: nptos
    
    if BVTV0(i)>0
        
        fprintf('\n>>>>>>> Min K %3i\n',i);
        
        [x1,P1,d1] = BoundsK(BVTV0(i),coefObj);
        
        [val,ind]=min(P1,[],1);
        
        minK_tc2(i,:)=[d1(ind(1)) P1(ind(1))];

    end
    
end

minK_tc2(:,2)=minK_tc2(:,2)/E


% Maxima rigidez volumetrica
coefObj=-1;
maxK_tc2=-ones(nptos,2);
maxK_tc2(:,1)=abs(BVTV0(:));

parfor i=1: nptos
    
    if BVTV0(i)>0
        
        fprintf('\n>>>>>>> Max K %3i\n',i);
        
        [x1,P1,d1] = BoundsK(BVTV0(i),coefObj);
        
        [val,ind]=max(P1,[],1);
        maxK_tc2(i,:)=[d1(ind(1)) P1(ind(1))];

    end
    
end

maxK_tc2(:,2)=maxK_tc2(:,2)/E

% Minima rigidez de corte
coefObj=1;
minG_tc2=ones(nptos,2);
minG_tc2(:,1)=abs(BVTV0(:));

parfor i=1: nptos
    
    if BVTV0(i)>0
        
        fprintf('\n>>>>>>> Min G %3i\n',i);
        
        [x1,P1,d1] = BoundsG(BVTV0(i),coefObj);
        
        [val,ind]=min(P1,[],1);
        minG_tc2(i,:)=[d1(ind(1)) P1(ind(1))];

    end
    
end

minG_tc2(:,2)=minG_tc2(:,2)/G;

% Maxima rigidez de corte
coefObj=-1;
maxG_tc2=-ones(nptos,2);
maxG_tc2(:,1)=abs(BVTV0(:));

parfor i=1: nptos
    
    if BVTV0(i)>0
        
        fprintf('\n>>>>>>> Max G %3i\n',i);
        
        [x1,P1,d1] = BoundsG(BVTV0(i),coefObj);
        
        [val,ind]=max(P1,[],1);
        maxG_tc2(i,:)=[d1(ind(1)) P1(ind(1))];

    end
    
end

maxG_tc2(:,2)=maxG_tc2(:,2)/G;


save('minmax2.mat','minG_tc2','maxG_tc2','minK_tc2','maxK_tc2');


clc

% BVTV0=[0.04 0.05 0.06 0.07 0.08 0.09 0.10 0.11 0.12 0.13 ...
%     0.14 0.15 0.16 0.17 0.18 0.19 0.20 0.21 0.22 0.23 ...
%     0.24 0.25 0.26 0.27 0.28 0.29 0.30 0.31 0.32 0.33 ...
%     0.34 0.35 0.36 0.37 0.38 0.39 0.40 0.41 0.42 0.43 0.44 0.45];

BVTV0=[0.04 0.05 0.06 0.07 0.08 0.09 0.10 0.11 0.12 0.13 ...
    0.14 0.15 0.16 0.17 0.18 0.19 0.20 -0.21 -0.22 -0.23 ...
    -0.24 -0.25 -0.26 -0.27 -0.28 -0.29 -0.30 -0.31 -0.32 -0.33 ...
    -0.34 -0.35 -0.36 -0.37 -0.38 -0.39 -0.40 -0.41 -0.42 -0.43 -0.44 -0.45];



nptos=size(BVTV0,2);

E=1;
nu=0.3;
K=E/(3*(1-2*nu));
G=E/(2*(1+nu));

% % Minima rigidez volumetrica
% coefObj=1;
% minK_sr2=ones(nptos,2);
% for i=1: nptos
%     
%     if BVTV0(i)>0
%         
%         fprintf('\n>>>>>>> Min K %3i\n',i);
%         
%         [x1,P1,d1] = BoundsK(BVTV0(i),coefObj);
%         
%         [val,ind]=min(P1,[],1);
%         minK_sr2(i,1)=d1(ind(1));
%         minK_sr2(i,2)=P1(ind(1));
%     else
%         
%         minK_sr2(i,1)=abs(BVTV0(i));
%         minK_sr2(i,2)=100;
% 
%     end
%     
% end
% 
% minK_sr2(:,2)=minK_sr2(:,2)/E


% Maxima rigidez volumetrica
coefObj=-1;
maxK_sr2=ones(nptos,2);
for i=1: nptos
    
    if BVTV0(i)>0
        
        fprintf('\n>>>>>>> Max K %3i\n',i);
        
        [x1,P1,d1] = BoundsK(BVTV0(i),coefObj);
        
        [val,ind]=max(P1,[],1);
        maxK_sr2(i,1)=d1(ind(1));
        maxK_sr2(i,2)=P1(ind(1));
    else
        
        maxK_sr2(i,1)=abs(BVTV0(i));
        maxK_sr2(i,2)=0;
        
    end
    
end

maxK_sr2(:,2)=maxK_sr2(:,2)/E

% % Minima rigidez de corte
% coefObj=1;
% minG_sr2=ones(nptos,2);
% for i=1: nptos
%     
%     if BVTV0(i)>0
%         
%         fprintf('\n>>>>>>> Min G %3i\n',i);
%         
%         [x1,P1,d1] = BoundsG(BVTV0(i),coefObj);
%         
%         [val,ind]=min(P1,[],1);
%         minG_sr2(i,1)=d1(ind(1));
%         minG_sr2(i,2)=P1(ind(1));
%     else
%         
%         minG_sr2(i,1)=abs(BVTV0(i));
%         minG_sr2(i,2)=100;
% 
% 
%     end
%     
% end
% 
% minG_sr2(:,2)=minG_sr2(:,2)/G;

% Maxima rigidez de corte
coefObj=-1;
maxG_sr2=ones(nptos,2);
for i=1: nptos
    
    if BVTV0(i)>0
        
        fprintf('\n>>>>>>> Max G %3i\n',i);
        
        [x1,P1,d1] = BoundsG(BVTV0(i),coefObj);
        
        [val,ind]=max(P1,[],1);
        maxG_sr2(i,1)=d1(ind(1));
        maxG_sr2(i,2)=P1(ind(1));
    else
        
        maxG_sr2(i,1)=abs(BVTV0(i));
        maxG_sr2(i,2)=0;

    end
    
end

maxG_sr2(:,2)=maxG_sr2(:,2)/G;



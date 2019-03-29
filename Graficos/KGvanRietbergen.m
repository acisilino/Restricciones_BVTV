
function [hK_VR,hG_VR,hK_G,hG_G,hK_HS,hG_HS]=KGvanrietbergen

% ---------------------- Lee informacion vanRietbergen --------------------
filename = 'vanRietbergen-Completo-Descomposicion.xlsx';
sheet = 1;

% Lee datos
C0 = xlsread(filename,sheet,'D3:X143');
phiVR = xlsread(filename,sheet,'B3:B143');
ntensoresVR=size(C0,1);

% Arma tensores
CVR=zeros(ntensoresVR,6,6);

for i=1: ntensoresVR
    
    CVR(i,1,1)=C0(i,1);
    CVR(i,1,2)=C0(i,2);    
    CVR(i,1,3)=C0(i,3);    
    CVR(i,1,4)=C0(i,4);  
    CVR(i,1,5)=C0(i,5);  
    CVR(i,1,6)=C0(i,6);  
    
    CVR(i,2,1)=C0(i,2);    
    CVR(i,3,1)=C0(i,3);    
    CVR(i,4,1)=C0(i,4);  
    CVR(i,5,1)=C0(i,5);  
    CVR(i,6,1)=C0(i,6);      

    CVR(i,2,2)=C0(i,7);
    CVR(i,2,3)=C0(i,8);    
    CVR(i,2,4)=C0(i,9);    
    CVR(i,2,5)=C0(i,10);  
    CVR(i,2,6)=C0(i,11);  
    
    CVR(i,3,2)=C0(i,8);    
    CVR(i,4,2)=C0(i,9);    
    CVR(i,5,2)=C0(i,10);  
    CVR(i,6,2)=C0(i,11);      
    
    CVR(i,3,3)=C0(i,12);     
    CVR(i,3,4)=C0(i,13);      
    CVR(i,3,5)=C0(i,14);      
    CVR(i,3,6)=C0(i,15); 
    
    CVR(i,4,3)=C0(i,13);      
    CVR(i,5,3)=C0(i,14);      
    CVR(i,6,3)=C0(i,15);     
    
    CVR(i,4,4)=C0(i,16);      
    CVR(i,4,5)=C0(i,17);   
    CVR(i,4,6)=C0(i,18);  
    
    CVR(i,5,4)=C0(i,17);   
    CVR(i,6,4)=C0(i,18);  
    
    CVR(i,5,5)=C0(i,19);        
    CVR(i,5,6)=C0(i,20);     
    
    CVR(i,6,5)=C0(i,20);    
    
    CVR(i,6,6)=C0(i,21);    
    
end

% ------------------------ Lee informacion Guillaume ----------------------

% Lee informacion muetras vanRietbergen
filename = 'Guillaume23-Completo-Descomposicion.xlsx';
sheet = 1;

% Lee datos
C0 = xlsread(filename,sheet,'D3:X25');
phiG = xlsread(filename,sheet,'B3:B25');
ntensoresG=size(C0,1);

% Arma tensores
CG=zeros(ntensoresG,6,6);

for i=1: ntensoresG

    CG(i,1,1)=C0(i,1);
    CG(i,1,2)=C0(i,2);    
    CG(i,1,3)=C0(i,3);    
    CG(i,1,4)=C0(i,4);  
    CG(i,1,5)=C0(i,5);  
    CG(i,1,6)=C0(i,6);  
    
    CG(i,2,1)=C0(i,2);    
    CG(i,3,1)=C0(i,3);    
    CG(i,4,1)=C0(i,4);  
    CG(i,5,1)=C0(i,5);  
    CG(i,6,1)=C0(i,6);      

    CG(i,2,2)=C0(i,7);
    CG(i,2,3)=C0(i,8);    
    CG(i,2,4)=C0(i,9);    
    CG(i,2,5)=C0(i,10);  
    CG(i,2,6)=C0(i,11);  
    
    CG(i,3,2)=C0(i,8);    
    CG(i,4,2)=C0(i,9);    
    CG(i,5,2)=C0(i,10);  
    CG(i,6,2)=C0(i,11);      
    
    CG(i,3,3)=C0(i,12);     
    CG(i,3,4)=C0(i,13);      
    CG(i,3,5)=C0(i,14);      
    CG(i,3,6)=C0(i,15); 
    
    CG(i,4,3)=C0(i,13);      
    CG(i,5,3)=C0(i,14);      
    CG(i,6,3)=C0(i,15);     
    
    CG(i,4,4)=C0(i,16);      
    CG(i,4,5)=C0(i,17);   
    CG(i,4,6)=C0(i,18);  
    
    CG(i,5,4)=C0(i,17);   
    CG(i,6,4)=C0(i,18);  
    
    CG(i,5,5)=C0(i,19);        
    CG(i,5,6)=C0(i,20);     
    
    CG(i,6,5)=C0(i,20);    
    
    CG(i,6,6)=C0(i,21);    
    
end

% ----------------------- K y G para muestras naturales -------------------


% Calcula Voigt's upper bounds en 
% Hill, R. The elastic behaviour of a crystalline aggregate. 
% Proceedings of the Physical Society. Section A 65, 349 (1952).

E=1000;
nu=0.3;
K=E/(3*(1-2*nu));
G=E/(2*(1+nu));

% vanRietbergen
for i=1: ntensoresVR
    KvVR(i)= (1/9)*(CVR(i,1,1)+CVR(i,2,2)+CVR(i,3,3)+2*(CVR(i,1,2)+...
        CVR(i,2,3)+CVR(i,3,1)));
    GvVR(i)=(1/15)*(CVR(i,1,1)+CVR(i,2,2)-(CVR(i,1,2)+CVR(i,2,3)+CVR(i,3,1))+...
        3*(CVR(i,4,4)+CVR(i,5,5)+CVR(i,6,6)));
end

KvVR=KvVR/E;
GvVR=GvVR/G;

% Guillaume
for i=1: ntensoresG
    KvG(i)= (1/9)*(CG(i,1,1)+CG(i,2,2)+CG(i,3,3)+2*(CG(i,1,2)+...
        CG(i,2,3)+CG(i,3,1)));
    GvG(i)=(1/15)*(CG(i,1,1)+CG(i,2,2)-(CG(i,1,2)+CG(i,2,3)+CG(i,3,1))+...
        3*(CG(i,4,4)+CG(i,5,5)+CG(i,6,6)));
end

KvG=KvG/E;
GvG=GvG/G;

% ------------------------------- Bounds HS -------------------------------

E=1;
nu=0.3;
K=E/(3*(1-2*nu));
G=E/(2*(1+nu));


for i=1:101
    phi3D(i)=(i-1)/100;
    f=1-phi3D(i);
    
    % Formula en Sigmund (2016) - Verificada numericamente la equivalencia
    % con formula en http://subsurfwiki.org/wiki/Hashin–Shtrikman_bounds
    % K3D(i)=2*phi3D(i)*E/(3*(3*(1-nu)-phi3D(i)*(1+nu)));
    
    % Formulas en HS (1963)
    K3D(i)=K+f/(-K^-1+3*phi3D(i)/(3*K+4*G));
    G3D(i)=G+f/(-G^-1+(6*phi3D(i)*(K+2*G))/(5*G*(3*K+4*G)));

end

K3D=K3D/E;
G3D=G3D/G;

% ------------------------------- Graficos --------------------------------

% Bulk modulus
subplot(2,1,1);
hold on;
hK_VR=scatter(phiVR(:),KvVR(:),'ok','MarkerFaceColor','k','DisplayName','Human specimens [ref]'); 
hK_VR=scatter(phiG(:),KvG(:),'or','MarkerFaceColor','k','DisplayName','Bovine specimens [ref]'); 
hK_HS=plot(phi3D(:),K3D(:),'--k','MarkerSize',5); 


% Shear modulus
subplot(2,1,2);
hold on;
plot(phiVR(:),GvVR(:),'+b','MarkerSize',5); 
plot(phiG(:),GvG(:),'+r','MarkerSize',5); 
plot(phi3D(:),G3D(:),'--k','MarkerSize',5); 
hold on;
xlim([0 0.45]);
ylim([0 0.4]);
xlabel('Solid volume fraction  \phi') ; 
ylabel('Normalized shear modulus  \mu/G');
grid on ;
legend({'van Rietbergen','Guillaume','Hashin-Strikhman bound'},...
    'Location','northwest');








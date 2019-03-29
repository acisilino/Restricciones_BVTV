
clear

% Bounds
load('BoundsKG_sr.mat');
load('BoundsKG_pol.mat');
load('BoundsKG_tc.mat');

% Especimenes y HS
[KvVR,GvVR,phiVR,KvG,GvG,phiG,K3D,G3D,phi3D]=KG_data;


% Ajusta valor muestra 16
phiG(16,1)=0.448; % 0.45

% -------------------------------------------------------------------------
%                         Determina escalado optimo
% -------------------------------------------------------------------------

% El escalado optimo es
esc=0.58;
% y resulta en 224 puntos dentro de los rangos de K y G de
% la microestructura artificial con la restriccion no-lineal

% Especimenes
Kv=horzcat(KvVR,KvG)';
Gv=horzcat(GvVR,GvG)';
phi=vertcat(phiVR,phiG);

% Elimina phi>0.45
indx=find(phi>0.45);
Kv(indx)=[];
Gv(indx)=[];
phi(indx)=[];

% Poligonos
K_sr=vertcat(maxK_sr,flip(minK_sr));
K_pol=vertcat(maxK_pol,flip(minK_pol));
K_tc=vertcat(maxK_tc,flip(minK_tc));
G_sr=vertcat(maxG_sr,flip(minG_sr));
G_pol=vertcat(maxG_pol,flip(minG_pol));
G_tc=vertcat(maxG_tc,flip(minG_tc));

% % Determina el escalado optimo
% 
% for i=1:200
%        
%     % Escala
%     escala(i)=1/(1+0.01*i);
%     
%     % Dentro/fuera
%     % sr
%     [Kin_sr,Kon_sr] = inpolygon(phi,Kv,K_sr(:,1),K_sr(:,2)*escala(i));
%     nK_sr(i)=numel(phi(Kin_sr))+numel(phi(Kon_sr));
%     [Gin_sr,Gon_sr] = inpolygon(phi,Gv,G_sr(:,1),G_sr(:,2)*escala(i));
%     nG_sr(i)=numel(phi(Gin_sr))+numel(phi(Gon_sr));
%     nKG_sr(i)=nK_sr(i)+nG_sr(i);
% 
%     % pol
%     [Kin_pol,Kon_pol] = inpolygon(phi,Kv,K_pol(:,1),K_pol(:,2)*escala(i));
%     nK_pol(i)=numel(phi(Kin_pol))+numel(phi(Kon_pol));
%     [Gin_pol,Gon_pol] = inpolygon(phi,Gv,G_pol(:,1),G_pol(:,2)*escala(i));
%     nG_pol(i)=numel(phi(Gin_pol))+numel(phi(Gon_pol));
%     nKG_pol(i)=nK_pol(i)+nG_pol(i);
%     close all
% 
%     figure('Position',[400 200 400 800]);
% 
% %     % Graficos
% %     subplot(2,1,1);
% %     hold on
% %     plot(K_sr(:,1),K_sr(:,2)*escala(i));
% %     plot(K_pol(:,1),K_pol(:,2)*escala(i));
% %     xlim([0 0.45]);
% %     ylim([0 0.2]);
% % 
% %     plot(phi(Kin_sr),Kv(Kin_sr),'r+')  % puntos adentro
% %     plot(phi(~Kin_sr),Kv(~Kin_sr),'bo') % puntos afuera
% %     plot(phi(Kin_pol),Kv(Kin_pol),'r+')  % puntos adentro
% %     plot(phi(~Kin_pol),Kv(~Kin_pol),'bo') % puntos afuera
% %     
% %     subplot(2,1,2);
% %     hold on  
% %     plot(G_sr(:,1),G_sr(:,2)*escala(i));   
% %     plot(G_pol(:,1),G_pol(:,2)*escala(i));
% %     xlim([0 0.45]);
% %     ylim([0 0.3]);
% %     plot(phi(Gin_sr),Gv(Gin_sr),'r+')  % puntos adentro
% %     plot(phi(~Gin_sr),Gv(~Gin_sr),'bo') % puntos afuera
% %     plot(phi(Gin_pol),Gv(Gin_pol),'r+')  % puntos adentro
% %     plot(phi(~Gin_pol),Gv(~Gin_pol),'bo') % puntos afuera
%     
%     
% end
% 
% % Plot
% close all;
% figure(1)
% hold on
% 
% % sr
% % scatter(escala,nK_sr);
% % scatter(escala,nG_sr);
% % scatter(escala,nKG_sr);
% 
% % pol
% scatter(escala,nK_pol);
% scatter(escala,nG_pol);
% scatter(escala,nKG_pol);
% legend('nK','nG','nKG');
% 
% % Mejor valor de la escala
% % [nKGmax,ind]=max(nKG_sr)
% [nKGmax,ind]=max(nKG_pol)
% esc=escala(ind)
% 
% % Dentro/fuera
% % % sr
% % [Kin_sr,Kon_sr] = inpolygon(phi,Kv,K_sr(:,1),K_sr(:,2)*esc));
% % nK_sr(i)=numel(phi(Kin_sr))+numel(phi(Kon_sr));
% % [Gin_sr,Gon_sr] = inpolygon(phi,Gv,G_sr(:,1),G_sr(:,2)*esc));
% % nG_sr(i)=numel(phi(Gin_sr))+numel(phi(Gon_sr));
% % nKG_sr(i)=nK_sr(i)+nG_sr(i);
% 
% % pol
% [Kin_pol,Kon_pol] = inpolygon(phi,Kv,K_pol(:,1),K_pol(:,2)*esc);
% nK_pol(i)=numel(phi(Kin_pol))+numel(phi(Kon_pol));
% [Gin_pol,Gon_pol] = inpolygon(phi,Gv,G_pol(:,1),G_pol(:,2)*esc);
% nG_pol(i)=numel(phi(Gin_pol))+numel(phi(Gon_pol));
% nKG_pol(i)=nK_pol(i)+nG_pol(i);
% 
% 
% % Graficos
% % % sr
% % figure('Position',[400 200 400 800]);
% % subplot(2,1,1);
% % plot(K_sr(:,1),K_sr(:,2)*esc.*sqrt(K_sr(:,1)));
% % xlim([0 0.45]);
% % ylim([0 0.2]);
% % hold on
% % plot(phi(Kin_sr),Kv(Kin_sr),'r+')  % puntos adentro
% % plot(phi(~Kin_sr),Kv(~Kin_sr),'bo') % puntos afuera
% % 
% % subplot(2,1,2);
% % plot(G_sr(:,1),G_sr(:,2)*esc));
% % xlim([0 0.45]);
% % ylim([0 0.3]);
% % hold on
% % plot(phi(Gin_sr),Gv(Gin_sr),'r+')  % puntos adentro
% % plot(phi(~Gin_sr),Gv(~Gin_sr),'bo') % puntos afuera
% 
% % pol
% figure('Position',[400 200 400 800]);
% subplot(2,1,1);
% plot(K_pol(:,1),K_pol(:,2)*esc);
% xlim([0 0.45]);
% ylim([0 0.2]);
% hold on
% plot(phi(Kin_pol),Kv(Kin_pol),'r+')  % puntos adentro
% plot(phi(~Kin_pol),Kv(~Kin_pol),'bo') % puntos afuera
% 
% subplot(2,1,2);
% plot(G_pol(:,1),G_pol(:,2)*esc);
% xlim([0 0.45]);
% ylim([0 0.3]);
% hold on
% plot(phi(Gin_pol),Gv(Gin_pol),'r+')  % puntos adentro
% plot(phi(~Gin_pol),Gv(~Gin_pol),'bo') % puntos afuera


% -------------------------------------------------------------------------
%                       Escala valores para el grafico
% -------------------------------------------------------------------------

% Poligonos escalados
K_sr=vertcat(maxK_sr,flip(minK_sr));
K_pol=vertcat(maxK_pol,flip(minK_pol));
K_tc=vertcat(maxK_tc,flip(minK_tc));
K_sr(:,2)=K_sr(:,2)*esc;
K_pol(:,2)=K_pol(:,2)*esc;
K_tc(:,2)=K_tc(:,2)*esc;

G_sr=vertcat(maxG_sr,flip(minG_sr));
G_pol=vertcat(maxG_pol,flip(minG_pol));
G_tc=vertcat(maxG_tc,flip(minG_tc));
G_sr(:,2)=G_sr(:,2)*esc;
G_pol(:,2)=G_pol(:,2)*esc;
G_tc(:,2)=G_tc(:,2)*esc;

% Identifica puntos dentro y fuera
% sr
[KvVRin_sr,KvVRon_sr] = inpolygon(phiVR,KvVR,K_sr(:,1),K_sr(:,2));
[KvGin_sr,KvGon_sr] = inpolygon(phiG,KvG,K_sr(:,1),K_sr(:,2));
nK_sr=numel(phiVR(KvVRin_sr))+numel(phiG(KvGin_sr))

[GvVRin_sr,GvVRon_sr] = inpolygon(phiVR,GvVR,G_sr(:,1),G_sr(:,2));
[GvGin_sr,GvGon_sr] = inpolygon(phiG,GvG,G_sr(:,1),G_sr(:,2));
nG_sr=numel(phiVR(GvVRin_sr))+numel(phiG(GvGin_sr))

% pol
[KvVRin_pol,KvVRon_pol] = inpolygon(phiVR,KvVR,K_pol(:,1),K_pol(:,2));
[KvGin_pol,KvGon_pol] = inpolygon(phiG,KvG,K_pol(:,1),K_pol(:,2));
nK_pol=numel(phiVR(KvVRin_pol))+numel(phiG(KvGin_pol))

[GvVRin_pol,GvVRon_pol] = inpolygon(phiVR,GvVR,G_pol(:,1),G_pol(:,2));
[GvGin_pol,GvGon_pol] = inpolygon(phiG,GvG,G_pol(:,1),G_pol(:,2));
nG_pol=numel(phiVR(GvVRin_pol))+numel(phiG(GvGin_pol))

% -------------------------------------------------------------------------
%                                  K
% -------------------------------------------------------------------------

BVTVmin=0.05;
BVTVmax=0.45;

close all;

figure('Position',[400 200 400 800]);

subplot(2,1,1);

% Sin restriccion
hold on;
hK_sr=patch(K_sr(:,1),K_sr(:,2),[0.80 0.80 0.80]);
hK_sr.LineStyle=':';

% Lineal
hold on;
hK_pol=patch(K_pol(:,1),K_pol(:,2),[0.80 0.80 0.80]);
hK_pol.LineStyle=':';
hpatch = findobj(hK_pol,'type','patch');
hhatchK_pol=hatchfill2(hpatch(1),'single','HatchAngle',66,...
    'HatchDensity',60,'FaceColor',[0.80 0.80 0.80]);

% tc
hold on;
hK_tc=patch(K_tc(:,1),K_tc(:,2),[0.80 0.80 0.80]);
hK_tc.LineStyle=':';
hpatch = findobj(hK_tc,'type','patch');
hhatchK_pol=hatchfill2(hpatch(1),'single','HatchAngle',66,...
    'HatchDensity',60,'FaceColor',[0.80 0.80 0.80]);
hhatchK_tc1=hatchfill2(hpatch(1),'single','HatchAngle',66,...
     'HatchDensity',60,'FaceColor',[0.80 0.80 0.80]);
hhatchK_tc2=hatchfill2(hpatch(1),'single','HatchAngle',-66,...
     'HatchDensity',60,'FaceColor',[0.80 0.80 0.80]);

% Especimenes
% % sr
% hK_VR_out=scatter(phiVR(~KvVRin_sr),KvVR(~KvVRin_sr),'or','MarkerFaceColor','r'); 
% hK_VR_in=scatter(phiVR(KvVRin_sr),KvVR(KvVRin_sr),'ok','MarkerFaceColor','k'); 
% hK_G_out=scatter(phiG(~KvGin_sr),KvG(~KvGin_sr),'or'); 
% hK_G_in=scatter(phiG(KvGin_sr),KvG(KvGin_sr),'ok'); 

% pol
% hK_VR_out=scatter(phiVR(~KvVRin_pol),KvVR(~KvVRin_pol),'or','MarkerFaceColor','r'); 
hK_VR_out=scatter(phiVR(~KvVRin_pol),KvVR(~KvVRin_pol),'ok','MarkerFaceColor','k'); 
hK_VR_in=scatter(phiVR(KvVRin_pol),KvVR(KvVRin_pol),'ok','MarkerFaceColor','k'); 
 %hK_G_out=scatter(phiG(~KvGin_pol),KvG(~KvGin_pol),'or'); 
hK_G_out=scatter(phiG(~KvGin_pol),KvG(~KvGin_pol),'ok'); 
hK_G_in=scatter(phiG(KvGin_pol),KvG(KvGin_pol),'ok'); 

% HS
hold on;
hK_HS=plot(phi3D(:),K3D(:),'--k','MarkerSize',5); 

% Ejes
xlim([BVTVmin BVTVmax]);
ylim([0 0.2]);
xlabel('Solid volume fraction \phi') ; 
xticks([0.05 0.10 0.15 0.20 0.25 0.30 0.35 0.40 0.45])
xticklabels({'0.05','0.10','0.15','0.20','0.25','0.30','0.35','0.40','0.45'})
ylabel('Normalized bulk modulus  \kappa/E');
grid on ;
set(gca,'Layer','top');

box on


% -------------------------------------------------------------------------
%                                  G
% -------------------------------------------------------------------------

subplot(2,1,2);

% Sin restriccion
hold on;
hG_sr=patch(G_sr(:,1),G_sr(:,2),[0.80 0.80 0.80]);
hG_sr.LineStyle=':';

% Lineal
hold on;
hG_pol=patch(G_pol(:,1),G_pol(:,2),[0.80 0.80 0.80]);
hG_pol.LineStyle=':';
hpatch = findobj(hG_pol,'type','patch');
hhatchG_pol=hatchfill2(hpatch(1),'single','HatchAngle',66,...
    'HatchDensity',60,'FaceColor',[0.80 0.80 0.80]);

% tc
hold on;
hG_tc=patch(G_tc(:,1),G_tc(:,2),[0.80 0.80 0.80]);
hG_tc.LineStyle=':';
hpatch = findobj(hG_tc,'type','patch');
hhatchG_pol=hatchfill2(hpatch(1),'single','HatchAngle',66,...
    'HatchDensity',60,'FaceColor',[0.80 0.80 0.80]);
hhatchG_tc1=hatchfill2(hpatch(1),'single','HatchAngle',66,...
     'HatchDensity',60,'FaceColor',[0.80 0.80 0.80]);
hhatchG_tc2=hatchfill2(hpatch(1),'single','HatchAngle',-66,...
     'HatchDensity',60,'FaceColor',[0.80 0.80 0.80]);

% Especimenes
% % sr
% hG_VR_out=scatter(phiVR(~GvVRin_sr),GvVR(~GvVRin_sr),'or','MarkerFaceColor','r'); 
% hG_VR_in=scatter(phiVR(GvVRin_sr),GvVR(GvVRin_sr),'ok','MarkerFaceColor','k'); 
% hG_G_out=scatter(phiG(~GvGin_sr),GvG(~GvGin_sr),'or'); 
% hG_G_in=scatter(phiG(GvGin_sr),GvG(GvGin_sr),'ok'); 

% pol
% hG_VR_out=scatter(phiVR(~GvVRin_pol),GvVR(~GvVRin_pol),'or','MarkerFaceColor','r'); 
hG_VR_out=scatter(phiVR(~GvVRin_pol),GvVR(~GvVRin_pol),'ok','MarkerFaceColor','k'); 
hG_VR_in=scatter(phiVR(GvVRin_pol),GvVR(GvVRin_pol),'ok','MarkerFaceColor','k'); 
% hG_G_out=scatter(phiG(~GvGin_pol),GvG(~GvGin_pol),'or'); 
hG_G_out=scatter(phiG(~GvGin_pol),GvG(~GvGin_pol),'ok'); 
hG_G_in=scatter(phiG(GvGin_pol),GvG(GvGin_pol),'ok'); 

% HS
hold on;
hG_HS=plot(phi3D(:),G3D(:),'--k','MarkerSize',5); 

% Ejes
xlim([BVTVmin BVTVmax]);
ylim([0 0.3]);
xlabel('Solid volume fraction \phi') ; 
xticks([0.05 0.10 0.15 0.20 0.25 0.30 0.35 0.40 0.45])
xticklabels({'0.05','0.10','0.15','0.20','0.25','0.30','0.35','0.40','0.45'}) 
ylabel('Normalized shear modulus  \mu/G');
grid on ;
set(gca,'Layer','top');

box on


% -------------------------------------------------------------------------
%                                  Leyendas
% -------------------------------------------------------------------------
subplot(2,1,1);
hold on;

[~,legend_K,~,~]=legendflex([hK_sr hK_pol hK_tc hK_HS hK_VR_in hK_G_in],...
    {'Non-linear constraint','Linear constraint','t_{c}=0.1375','Hashin-Strikhman bound','Human specimens','Bovine specimens'},...
    'ref', gca, 'anchor', [1 1], 'buffer', [10 -10]);
hatchfill2(legend_K(8),'single','HatchAngle',66,...
    'HatchDensity',15,'FaceColor',[1 1 1]);
hatchfill2(legend_K(9),'single','HatchAngle',-66,...
    'HatchDensity',15,'FaceColor',[1 1 1]);
box on


subplot(2,1,2);
hold on;

[~,legend_G,~,~]=legendflex([hG_sr hG_pol hG_tc hG_HS hG_VR_in hG_G_in],...
    {'Non-linear constraint','Linear constraint','t_{c}=0.1375','Hashin-Strikhman bound','Human specimens','Bovine specimens'},...
    'ref', gca, 'anchor', [1 1], 'buffer', [10 -10]);
hatchfill2(legend_G(8),'single','HatchAngle',66,...
    'HatchDensity',15,'FaceColor',[1 1 1]);
hatchfill2(legend_G(9),'single','HatchAngle',-66,...
    'HatchDensity',15,'FaceColor',[1 1 1]);
box on



BVTVmin=0.05;
BVTVmax=0.45;

% Lee base de datos 
load('BoundsKG_sr.mat');
load('BoundsKG_pol.mat');
load('BoundsKG_tc.mat');

close all;

figure('Position',[400 200 400 800]);

% -------------------------------------------------------------------------
%                                  K
% -------------------------------------------------------------------------

subplot(2,1,1);

% Sin restriccion
hold on;
K_sr=vertcat(maxK_sr,flip(minK_sr));
hK_sr=patch(K_sr(:,1),K_sr(:,2),[0.80 0.80 0.80]);
hK_sr.LineStyle=':';

% Lineal
hold on;
K_pol=vertcat(maxK_pol,flip(minK_pol));
hK_pol=patch(K_pol(:,1),K_pol(:,2),[0.80 0.80 0.80]);
hK_pol.LineStyle=':';
hpatch = findobj(hK_pol,'type','patch');
hhatchK_pol=hatchfill2(hpatch(1),'single','HatchAngle',66,...
    'HatchDensity',60,'FaceColor',[0.80 0.80 0.80]);

% tc
hold on;
K_tc=vertcat(maxK_tc,flip(minK_tc));
hK_tc=patch(K_tc(:,1),K_tc(:,2),[0.80 0.80 0.80]);
hK_tc.LineStyle=':';
hpatch = findobj(hK_tc,'type','patch');
hhatchK_pol=hatchfill2(hpatch(1),'single','HatchAngle',66,...
    'HatchDensity',60,'FaceColor',[0.80 0.80 0.80]);
hhatchK_tc1=hatchfill2(hpatch(1),'single','HatchAngle',66,...
     'HatchDensity',60,'FaceColor',[0.80 0.80 0.80]);
hhatchK_tc2=hatchfill2(hpatch(1),'single','HatchAngle',-66,...
     'HatchDensity',60,'FaceColor',[0.80 0.80 0.80]);


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
G_sr=vertcat(maxG_sr,flip(minG_sr));
hG_sr=patch(G_sr(:,1),G_sr(:,2),[0.80 0.80 0.80]);
hG_sr.LineStyle=':';

% Lineal
hold on;
G_pol=vertcat(maxG_pol,flip(minG_pol));
hG_pol=patch(G_pol(:,1),G_pol(:,2),[0.80 0.80 0.80]);
hG_pol.LineStyle=':';
hpatch = findobj(hG_pol,'type','patch');
hhatchG_pol=hatchfill2(hpatch(1),'single','HatchAngle',66,...
    'HatchDensity',60,'FaceColor',[0.80 0.80 0.80]);

% tc
hold on;
G_tc=vertcat(maxG_tc,flip(minG_tc));
hG_tc=patch(G_tc(:,1),G_tc(:,2),[0.80 0.80 0.80]);
hG_tc.LineStyle=':';
hpatch = findobj(hG_tc,'type','patch');
hhatchG_pol=hatchfill2(hpatch(1),'single','HatchAngle',66,...
    'HatchDensity',60,'FaceColor',[0.80 0.80 0.80]);
hhatchG_tc1=hatchfill2(hpatch(1),'single','HatchAngle',66,...
     'HatchDensity',60,'FaceColor',[0.80 0.80 0.80]);
hhatchG_tc2=hatchfill2(hpatch(1),'single','HatchAngle',-66,...
     'HatchDensity',60,'FaceColor',[0.80 0.80 0.80]);

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
%                              Specimens & bounds
% -------------------------------------------------------------------------
[hK_VR,hG_VR,hK_G,hG_G,hK_HS,hG_HS]=KG_Specimens_HS



% -------------------------------------------------------------------------
%                                  Leyendas
% -------------------------------------------------------------------------
subplot(2,1,1);
hold on;

% Con muestras
% [~,legend_K,~,~]=legendflex([hK_sr hK_pol hK_tc hK_HS hK_VR hK_G],...
%     {'Non-linear constraint','Linear constraint','t_{c}=0.1375','Human specimens','Bovine specimens'},...
%     'ref', gca, 'anchor', [1 1], 'buffer', [10 -10]);
% hatchfill2(legend_K(7),'single','HatchAngle',66,...
%     'HatchDensity',15,'FaceColor',[1 1 1]);
% hatchfill2(legend_K(8),'single','HatchAngle',-66,...
%     'HatchDensity',15,'FaceColor',[1 1 1]);
% box on

% Sin muestras
[~,legend_K,~,~]=legendflex([hK_sr hK_pol hK_tc hK_HS],...
    {'Non-linear constraint','Linear constraint','t_{c}=0.1375','Hashin-Strikhman bound'},...
    'ref', gca, 'anchor', [1 1], 'buffer', [10 -10]);
hatchfill2(legend_K(6),'single','HatchAngle',66,...
    'HatchDensity',15,'FaceColor',[1 1 1]);
hatchfill2(legend_K(7),'single','HatchAngle',-66,...
    'HatchDensity',15,'FaceColor',[1 1 1]);
box on



subplot(2,1,2);
hold on;

% Con muestras
% [~,legend_G,~,~]=legendflex([hG_sr hG_pol hG_tc hG_VR hG_G],...
%     {'Non-linear constraint','Linear constraint','t_{c}=0.1375','Human specimens','Bovine specimens'},...
%     'ref', gca, 'anchor', [1 1], 'buffer', [10 -10]);
% hatchfill2(legend_G(7),'single','HatchAngle',66,...
%     'HatchDensity',15,'FaceColor',[1 1 1]);
% hatchfill2(legend_G(8),'single','HatchAngle',-66,...
%     'HatchDensity',15,'FaceColor',[1 1 1]);
% box on

% SIn muestras
[~,legend_G,~,~]=legendflex([hG_sr hG_pol hG_tc hG_HS],...
    {'Non-linear constraint','Linear constraint','t_{c}=0.1375','Hashin-Strikhman bound'},... 
    'ref', gca, 'anchor', [1 1], 'buffer', [10 -10]);
hatchfill2(legend_G(6),'single','HatchAngle',66,...
    'HatchDensity',15,'FaceColor',[1 1 1]);
hatchfill2(legend_G(7),'single','HatchAngle',-66,...
    'HatchDensity',15,'FaceColor',[1 1 1]);
box on



BVTVmin=0.05;
BVTVmax=0.45;

% -------------------------------------------------------------------------
%                                    HS
% -------------------------------------------------------------------------


% -------------------------------------------------------------------------
%                             Sin restriccion
% -------------------------------------------------------------------------
% Lee base de datos 
load('BoundsKG_sr.mat');

% K
subplot(2,1,1);
plot(minK_sr(:,1),minK_sr(:,2),'k--o','MarkerSize',5); 
hold on
plot(maxK_sr(:,1),maxK_sr(:,2),'k--o','MarkerSize',5); 
xlim([BVTVmin BVTVmax]);
ylim([0 0.3]);
xlabel('Solid volume fraction  \phi') ; 
ylabel('Normalized bulk modulus  \kappa/E');
grid on;

% G
subplot(2,1,2);
hold on;
plot(minG_sr(:,1),minG_sr(:,2),'k--o','MarkerSize',5);  
hold on;
plot(maxG_sr(:,1),maxG_sr(:,2),'k--o','MarkerSize',5); 
xlim([BVTVmin BVTVmax]);
ylim([0 0.3]);
xlabel('Solid volume fraction  \phi') ; 
ylabel('Normalized shear modulus  \mu/G');
grid on ;


% -------------------------------------------------------------------------
%                             Restriccion tc
% -------------------------------------------------------------------------
% Lee base de datos 
% load('BoundsKG_tc.mat');


% -------------------------------------------------------------------------
%                            Restriccion polinomio
% -------------------------------------------------------------------------
% Lee base de datos 
% load('BoundsKG_pol.mat');


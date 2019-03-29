% for i=1:42
%     if maxK_pol2(i,2)>maxK_pol(i,2)
%         maxK_pol(i,2)=maxK_pol2(i,2);
%         maxK_pol(i,1)=maxK_pol2(i,1);
%     end
% end
% 
% for i=1:42
%     if minK_pol2(i,2)<minK_pol(i,2)
%         minK_pol(i,2)=minK_pol2(i,2);
%         minK_pol(i,1)=minK_pol2(i,1);
%     end
% end

for i=1:42
    if maxG_pol2(i,2)>maxG_pol(i,2)
        maxG_pol(i,2)=maxG_pol2(i,2);
        maxG_pol(i,1)=maxG_pol2(i,1);
    end
end

% for i=1:42
%     if minG_pol2(i,2)<minG_pol(i,2)
%         minG_pol(i,2)=minG_pol2(i,2);
%         minG_pol(i,1)=minG_pol2(i,1);
%     end
% end

plot(minK_pol(:,1),minK_pol(:,2),'s');
hold on
plot(maxK_pol(:,1),maxK_pol(:,2),'s');
plot(minG_pol(:,1),minG_pol(:,2),'+');
hold on
plot(maxG_pol(:,1),maxG_pol(:,2),'+');
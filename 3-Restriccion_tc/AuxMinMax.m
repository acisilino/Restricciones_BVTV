for i=1:36
    if maxK_tc2(i,2)>maxK_tc(i,2)
        maxK_tc(i,2)=maxK_tc2(i,2);
        maxK_tc(i,1)=maxK_tc2(i,1);
    end
end

% for i=1:36
%     if minK_tc2(i,2)<minK_tc(i,2)
%         minK_tc(i,2)=minK_tc2(i,2);
%         minK_tc(i,1)=minK_tc2(i,1);
%     end
% end

for i=1:36
    if maxG_tc2(i,2)>maxG_tc(i,2)
        maxG_tc(i,2)=maxG_tc2(i,2);
        maxG_tc(i,1)=maxG_tc2(i,1);
    end
end

% for i=1:36
%     if minG_tc2(i,2)<minG_tc(i,2)
%         minG_tc(i,2)=minG_tc2(i,2);
%         minG_tc(i,1)=minG_tc2(i,1);
%     end
% end

plot(minK_tc(:,1),minK_tc(:,2),'s');
hold on
plot(maxK_tc(:,1),maxK_tc(:,2),'s');
plot(minG_tc(:,1),minG_tc(:,2),'+');
hold on
plot(maxG_tc(:,1),maxG_tc(:,2),'+');
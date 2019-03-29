for i=1:42
    if maxK_sr2(i,2)>maxK_sr(i,2)
        maxK_sr(i,2)=maxK_sr2(i,2);
        maxK_sr(i,1)=maxK_sr2(i,1);
    end
end

% for i=1:42
%     if minK_sr2(i,2)<minK_sr(i,2)
%         minK_sr(i,2)=minK_sr2(i,2);
%         minK_sr(i,1)=minK_sr2(i,1);
%     end
% end

for i=1:42
    if maxG_sr2(i,2)>maxG_sr(i,2)
        maxG_sr(i,2)=maxG_sr2(i,2);
        maxG_sr(i,1)=maxG_sr2(i,1);
    end
end

% for i=1:42
%     if minG_sr2(i,2)<minG_sr(i,2)
%         minG_sr(i,2)=minG_sr2(i,2);
%         minG_sr(i,1)=minG_sr2(i,1);
%     end
% end
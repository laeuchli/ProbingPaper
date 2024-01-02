function [y] = createR(n,m)


z=randraw('Rademacher',[],n,m)/sqrt(n);
% H=randi(2,n,m);
% 
% for i=1:size(H,1)
%     for j =1:size(H,2)
%       if(H(i,j)==2)
%         H(i,j)=-1/sqrt(n);
%       else
%         H(i,j)=1/sqrt(n);
%       end
%     end
% end

y = z;
function [y] = CreateProbingVecs(A,c)

numcs = max(c);

%p=CreatePermFromColoring(c);
pvecsc=[];
for(i=1:numcs)

  %  cp = c(p);
    index = find(c==i);
    pvec = zeros(size(A,1),1);
    pvec(index) = 1;
    pvecsc=[pvecsc pvec];
   % pvec = pvec.*z;
%    perm=speye(size(A,1),size(A,2));
 %   perm = perm(:,p);
 

end

y = pvecsc;

end
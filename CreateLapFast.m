function [y] = CreateLapFast(A)
A=A-diag(diag(A));
newA=-A;

% for(i=1:size(A,1))
%     
%     newA(i,i)=0;
%     
% end

% for(i=1:size(A,1))
% 
%     newA(i,i)=-sum(newA(:,i));
% 
% end

newA = -diag(sum(newA)) - A;

y = newA;

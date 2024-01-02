function [y] = CreateInc(A)

A=A-diag(diag(A));

B = sparse(nnz(A)/2,size(A,1));

A=tril(A);

index = 1;
for(i=1:size(A,1))

  for( j = 1: nnz(A(:,i) ))
      
      idx = find(A(:,i));
      B(index,i ) = sqrt(A(idx(j),i));
      B(index,idx(j) ) = -sqrt(A(idx(j),i)) ;
      index = index + 1;
      
   %   if(index > nnz(A)/2)
    %    break
  end

end
y = B;


% A=A-diag(diag(A));
% 
% B = sparse(size(A,1),nnz(A)/2);
% 
% A=triu(A);
% 
% index = 1;
% for(i=1:size(A,1))
% 
%   for( j = 1: nnz(A(i,:) ))
%       
%       idx = find(A(i,:));
%       B(i, index) = sqrt(A(i,idx(j)));
%       B(idx(j), index) = -sqrt(A(i,idx(j))) ;
%       index = index + 1;
%       
%    %   if(index > nnz(A)/2)
%     %    break
%   end
% 
% end
% y = B';
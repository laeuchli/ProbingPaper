function [y] = RecursivePartition(A,k,iterc,acc, flag)

% perm=[1 3 1];
% 
% function [y] = matveceigembed(x)
% %global z2;
%     y = z*(z'*x);
% end



if(flag==1)
    A=A-diag(diag(A));
    A=CreateLap(A);
end
%A=-CreateLap((A));
%opts.maxit = 100000;
v=0;
e =0;
if(size(A,1)>1)
%OPTS.maxit = 1000;    
%[v e]= eigs(A,1,'lm');p

% [v e]= eigs(A,2,'sm');%%%CHANGEEEEE to 'sm'
% v=v(:,1);
 rng(1)
 bv=rand(size(A,1),2);
 %bv(1,1)=1;
 %bv(2,2)=1;
 
 %[nbv, lam]=lobpcg(bv,@matveceigembed,acc);
 [nbv, lam]=lobpcg(bv,A,acc);
 v=nbv(:,1);

 global eigplots
 eigplots(k)=eigplots(k)+lam(1);
 
else
    [v e]=eig(full(A));
    %v=v(:,size(A,1));
    %v = fliplr(v);
    v=v(:,2);
end

[sorti sortp]=sort(v);

c2=zeros(size(A,1),1);
c2(sortp(1:ceil(size(A,1)/2)))=1;
c2(sortp((ceil(size(A,1)/2)+1):size(A,1)))=2;
%c2=kmeans(abs(v),2,'MaxIter',1000);

p=CreatePermFromColoring(c2);


newA = A(p,p);

n=max(size(A));
newp=[];
    inversep(CreatePermFromColoring(c2))=1:n;
if(k<iterc)
    
    newA1=newA(1:ceil(size(A,1)/2),1:ceil(size(A,1)/2));
    newA2=newA(ceil(size(A,1)/2)+1:size(A,1),ceil(size(A,1)/2)+1:size(A,1));
    
   
   % B1=newA(1:ceil(size(A,1)/2),ceil(size(A,1)/2)+1:size(A,1));
   % B2=newA(ceil(size(A,1)/2)+1:size(A,1),1:ceil(size(A,1)/2));
   % newA1=RemoveWeight(newA1,B1);
   % newA2=RemoveWeight(newA2,B2);
    
    cc1=RecursivePartition(newA1,k+1,iterc,acc, flag);
    cc2=RecursivePartition(newA2,k+1,iterc,acc, flag)+max(cc1);
    newc=[cc1;cc2];

    y = newc(inversep);
    return;
    
else
    
    y = c2;
    return ;

end

end
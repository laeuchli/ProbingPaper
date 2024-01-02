function [y] = varest(c,Ap)
varest = 0;

p=CreatePermFromColoring(c);
Ap=Ap(p,p);
for(i=1:max(c))

    Sm=ExtractMatrix(i,c,Ap);
    smd = diag(Sm).^2;
    varest = varest + 2*(norm(Sm,'fro')^2-sum(smd));
end
y = varest;
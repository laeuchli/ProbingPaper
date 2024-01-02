function [y] = lsolveFast1(DLD,tt,tol,v)

%nLstar2=(DLD+tt*tt')^-1-tt*tt';
%global DLD
%global tt

function [y] = matvecfast(x)
    y = (DLD)*x+tt*(tt'*x);%%L*x+n*(n'*x)/(max(size(L)));
end



l =[];
for( i =1 :size(v,1))
    temp = pcg(@matvecfast,v(i,:)',tol,1000);

    y1=temp-tt*(tt'*v(i,:)');%-tt2*tt2'*v(i,:)'
    l =[l y1];

end

y= l;

end
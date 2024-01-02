function [y] = ExtractMatrix(whichc,c,A)
totaloffset=1;
for(i=1:whichc-1)

    totaloffset = totaloffset + sum(c==i);
    
end

colorsize = sum(c==whichc);

y=A(totaloffset:totaloffset+colorsize-1,totaloffset:totaloffset+colorsize-1);
function [perm] = CreatePermFromColoring(colors)

perm =[];
for(i=1:max(colors))  
    
    for(j=1:max(size(colors)))
        if(colors(j)==(i)) 
        perm = [perm j];
        end
    end  
    
end

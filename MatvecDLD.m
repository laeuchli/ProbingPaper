function [T] = MatvecDLD(DLD,v,tt)

    J = DLD+tt*(tt'*v);
    
T = J;

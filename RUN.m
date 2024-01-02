load('Adata.mat');
%LJsize=500;
LJsize=500;

global eigplots
eigplots =zeros(1024,1);

L=CreateLap(A);
z=size(L,1);
nLstar=(L+(1/z)*ones(z,1)*ones(z,1)')^-1-(1/z)*ones(z,1)*ones(z,1)';

vars = varest(ones(size(nLstar,1),1),nLstar);
varZ= [vars/32 vars/64 vars/128 vars/256 vars/512 vars/1024];

z=size(A,1);
d=(diag(L));
d=d.^(-1/2);
D=diag(d);
DLD=D*L*D;
B=CreateInc(L);
B=B*D;

d=(diag(L));
deig=d.^(1/2);
%tt=DLD*t;
tt=deig/norm(deig);
%nLstar2=(full(DLD)+tt*tt')^-1-tt*tt';

R=CreateR(LJsize,size(B,1));
OPTS.tol=10^-8;

I=speye(size(DLD));


z2=lsolveFast1(DLD,tt,10^-2,R*B);%z2=lsolve(DLD,tt,10^-2,R*B,0);
nLstar2=z2*z2';
ds4=[RecursivePartition(nLstar2,1,log2(32),1e-8,0) RecursivePartition(nLstar2,1,log2(64),1e-8,0) RecursivePartition(nLstar2,1,log2(128),1e-8,0) RecursivePartition(nLstar2,1,log2(256),1e-8,0) RecursivePartition(nLstar2,1,log2(512),1e-8,0) RecursivePartition(nLstar2,1,log2(1024),1e-8,0)];
vardssolvere2 = [ varest(ds4(:,1),nLstar) varest(ds4(:,2),nLstar) varest(ds4(:,3),nLstar) varest(ds4(:,4),nLstar) varest(ds4(:,5),nLstar) varest(ds4(:,6),nLstar)];

z1=lsolveFast1(DLD,tt,10^-1,R*B);
nLstar2=z1*z1';
ds4=[RecursivePartition(nLstar2,1,log2(32),1e-8,0) RecursivePartition(nLstar2,1,log2(64),1e-8,0) RecursivePartition(nLstar2,1,log2(128),1e-8,0) RecursivePartition(nLstar2,1,log2(256),1e-8,0) RecursivePartition(nLstar2,1,log2(512),1e-8,0) RecursivePartition(nLstar2,1,log2(1024),1e-8,0)];
vardssolvere1 = [ varest(ds4(:,1),nLstar) varest(ds4(:,2),nLstar) varest(ds4(:,3),nLstar) varest(ds4(:,4),nLstar) varest(ds4(:,5),nLstar) varest(ds4(:,6),nLstar)];

FIREGRAPH
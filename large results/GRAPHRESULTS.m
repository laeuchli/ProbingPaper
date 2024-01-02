load guessescolora.mat
load guessesrandom.mat
load resultsvarprobing1500.mat
truetrace = 6.453206873295880e+04
%totalruns =  totalruns(1:60,:);
%trrel= mean(totalruns);%
trrel=abs((mean(totalruns)-truetrace))/truetrace
trstd= sqrt(var(totalruns))


normfactor = 50;
relrand =[];
relvar = [];
for(i=1:min(size(ds4a)))
    
cls= max(ds4a);
ri=randi(99990,cls(i)+normfactor,1);
smallr = guessr(ri);
%load goodindex.mat
%smallr = guessr(1:(cls(i)+normfactor));
relrand = [ relrand abs((mean(smallr)-truetrace)/truetrace) ];
%relrand=[ relrand mean(smallr)];
relvar = [ relvar 2*sqrt(var(smallr)/(cls(i)+normfactor))];


end

figure(1)
plot(trrel,'r')
hold all
plot(relrand, 'b')

figure(2)
loglog(max(ds4a),trrel, 'r')
hold all
loglog(max(ds4a),relrand, 'b')

figure(3)

plot(trstd,'r')
hold all
plot(relvar,'b')

figure(4)

loglog(max(ds4a),trstd, 'r')
hold all
loglog(max(ds4a),relvar, 'b')

figure(5)
plot(max(ds4a),ones(6,1)*6.453206873295880e+04,'g')
hold all
errorbar(max(ds4a),relrand,relvar,'r')
errorbar(max(ds4a),trrel,trstd,'b')
legend('Actual Trace','Stochastic Estimator','Our Algorithm')
xlabel('Vectors used to Estimate Trace')
ylabel('Trace')

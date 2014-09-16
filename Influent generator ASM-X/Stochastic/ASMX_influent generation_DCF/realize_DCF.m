% File to generate the influent file for random occurrence of pharmaceutical. One file
% is created: inDCF. The file is attached with time stamps and can be used directly in the model
% for generating the influent data for BSM1_LT.
% C. Rosen, July 2008.
% Updated by Xavier Flores-Alsina and Laura J.P. Snip, DTU, Denmark


% Generation of the probability matrix with three different states

 P=[5824/17472 5824/17472 5824/17472
     2912/17472 11648/17472 2912/17472 
     2912/17472 2912/17472 11648/17472];

cs=1;
j=0;

rand('twister',5489)

for i=1:728*96
    y=find(rand >cumsum(P(cs,:)));
    cs=size(y,2)+1;
    x(i)=cs  ;
end

DCF=[[1/96:1/96:728]' x'-1];
inDCF (:,1) = DCF(:,1);
inDCF (:,2) = abs(DCF(:,2)-0.5);

for j=1:1:length(DCF)
if DCF(j,2) == 0;
   inDCF(j,2)= 0.5;
elseif DCF(j,2) == 1
    inDCF(j,2)= 1;
else
    inDCF(j,2)= 1.5;
end
end

% Plot and save
% figure
% plot(inDCF(:,2),'r')
% ylim ([0 4])


savefile=input('Do you want to save these values? [y/n] ','s');
if savefile=='y'
    save inDCF inDCF
    
end



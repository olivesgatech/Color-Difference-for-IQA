%Configuration selection
%Initialize s1 and s2

%s1 and s2 configures the elements of the objective quality vector.
% This vector will be used with the DMOS vector to caclulate estimation accuracy.

%s1=0,s2=0: no difference, no normalization

s1=0;
s2=0;



       if (s1==0)
           difVal=0; mult=1;
       elseif (s1==1)
           difVal=1; mult=-1;          
       end



len=size(img,2);
nChan=3;


%%%%%%%%%%%%%%%%%%   Jpeg    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

for i=1:len  
        
lenJpeg=size(img(i).ParamJpeg,2);
[param, paramOrder]=sort(img(i).ParamJpeg);

dmosInd=4;
        for j=1:lenJpeg 
        tempJpegDmos{i}(j)=img(i).Dmos(dmosInd,paramOrder(j));
        JpegDmosFlag{i}(j)=img(i).DmosFlag(dmosInd,paramOrder(j));
        n=1;
        tempJpegColDist{i}(j,n)=img(i). ColDistJpeg(paramOrder(j));

        end      

                tempJpegColDist{i}(:,n)=difVal+mult*tempJpegColDist{i}(:,n);

        
end

JpegColDistFull=zeros(1,1);
n=1;
for p=1:len
JpegColDistFull=horzcat(JpegColDistFull,tempJpegColDist{p}(:,n)');
end


       if (s2==1)
            JpegColDistFull=JpegColDistFull/max(JpegColDistFull);           
       end



JpegColDistFull=JpegColDistFull(2:end);




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%  Jp2k    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

for i=1:len  
        
lenJp2k=size(img(i).ParamJp2k,2);
[param, paramOrder]=sort(img(i).ParamJp2k);

dmosInd=3;
        for j=1:lenJp2k 
        tempJp2kDmos{i}(j)=img(i).Dmos(dmosInd,paramOrder(j));
        Jp2kDmosFlag{i}(j)=img(i).DmosFlag(dmosInd,paramOrder(j));
        n=1;

        tempJp2kColDist{i}(j,n)=img(i). ColDistJp2k(paramOrder(j));

             
        
        end      
       

   
                tempJp2kColDist{i}(:,n)=difVal+mult*tempJp2kColDist{i}(:,n);

        
end



Jp2kColDistFull=zeros(1,1);
n=1;
for p=1:len

Jp2kColDistFull=horzcat(Jp2kColDistFull,tempJp2kColDist{p}(:,n)');
end


       if (s2==1)

Jp2kColDistFull=Jp2kColDistFull/max(Jp2kColDistFull);
       end



Jp2kColDistFull=Jp2kColDistFull(2:end);



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%   Wn    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

for i=1:len  
        
lenWn=size(img(i).ParamWn,2);
[param, paramOrder]=sort(img(i).ParamWn);

dmosInd=5;
        for j=1:lenWn 
        tempWnDmos{i}(j)=img(i).Dmos(dmosInd,paramOrder(j));
        WnDmosFlag{i}(j)=img(i).DmosFlag(dmosInd,paramOrder(j));
        n=1;
        tempWnColDist{i}(j,n)=img(i). ColDistWn(paramOrder(j));
             
        
        end      
       

                tempWnColDist{i}(:,n)=difVal+mult*tempWnColDist{i}(:,n);

        
end


WnColDistFull=zeros(1,1);
n=1;
for p=1:len
WnColDistFull=horzcat(WnColDistFull,tempWnColDist{p}(:,n)');
end

       if (s2==1)
WnColDistFull=WnColDistFull/max(WnColDistFull);
       end


WnColDistFull=WnColDistFull(2:end);







%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%   Fastfading    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%




for i=1:len  
        
lenFastfading=size(img(i).ParamFastfading,2);
[param, paramOrder]=sort(img(i).ParamFastfading);

dmosInd=1;
        for j=1:lenFastfading 
        tempFastfadingDmos{i}(j)=img(i).Dmos(dmosInd,paramOrder(j));
        FastfadingDmosFlag{i}(j)=img(i).DmosFlag(dmosInd,paramOrder(j));
        n=1;

        tempFastfadingColDist{i}(j,n)=img(i). ColDistFastfading(paramOrder(j));

        
        end      
       

                tempFastfadingColDist{i}(:,n)=difVal+mult*tempFastfadingColDist{i}(:,n);

        
end



FastfadingColDistFull=zeros(1,1);
n=1;
for p=1:len
FastfadingColDistFull=horzcat(FastfadingColDistFull,tempFastfadingColDist{p}(:,n)');
end


       if (s2==1)

FastfadingColDistFull=FastfadingColDistFull/max(FastfadingColDistFull);
       end

FastfadingColDistFull=FastfadingColDistFull(2:end);



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%  Gblur    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%





for i=1:len  
        
lenGblur=size(img(i).ParamGblur,2);
[param, paramOrder]=sort(img(i).ParamGblur);

dmosInd=2;
         for j=1:lenGblur 
        tempGblurDmos{i}(j)=img(i).Dmos(dmosInd,paramOrder(j));
        GblurDmosFlag{i}(j)=img(i).DmosFlag(dmosInd,paramOrder(j));
        n=1;
        tempGblurColDist{i}(j,n)=img(i). ColDistGblur(paramOrder(j));

             
        
        end      
       
                tempGblurColDist{i}(:,n)=difVal+mult*tempGblurColDist{i}(:,n);

        
end



GblurColDistFull=zeros(1,1);
n=1;
for p=1:len
GblurColDistFull=horzcat(GblurColDistFull,tempGblurColDist{p}(:,n)');
end



       if (s2==1)
GblurColDistFull=GblurColDistFull/max(GblurColDistFull);
       end




GblurColDistFull=GblurColDistFull(2:end);


%%






JpegDmos=zeros(1,1);
Jp2kDmos=zeros(1,1);
WnDmos=zeros(1,1);
GblurDmos=zeros(1,1);
FastfadingDmos=zeros(1,1);
%%%% DMOS %%%%
for p=1:len
JpegDmos=vertcat(JpegDmos,tempJpegDmos{p}(:));
Jp2kDmos=vertcat(Jp2kDmos,tempJp2kDmos{p}(:));
WnDmos=vertcat(WnDmos,tempWnDmos{p}(:));
GblurDmos=vertcat(GblurDmos,tempGblurDmos{p}(:));
FastfadingDmos=vertcat(FastfadingDmos,tempFastfadingDmos{p}(:));
end
JpegDmos=JpegDmos(2:end)';
Jp2kDmos=Jp2kDmos(2:end)';
WnDmos=WnDmos(2:end)';
GblurDmos=GblurDmos(2:end)';
FastfadingDmos=FastfadingDmos(2:end)';

%DMOS
DmosScore=horzcat(FastfadingDmos,GblurDmos,Jp2kDmos,JpegDmos,WnDmos);



%       %ColDist
 ColDistFull=horzcat(FastfadingColDistFull,GblurColDistFull,Jp2kColDistFull,JpegColDistFull,WnColDistFull);
%%
nDist=6;
nMetric=1;
corrMat=zeros(nMetric,nDist);
rmseMat=zeros(nMetric,nDist);
rmseMatOrg=zeros(nMetric,nDist);
corrType='Pearson';
orderDist=char('Jp2k','Jpeg','Wn','Gblur','Fastfading','All');
rInd=1;
%% ALL
cInd=6;
y=DmosScore';
len=size(y,1);
linX=1:len; linX=(linX/max(linX))*100;
linY=linX;
modelFun=@(b,x) b(1).*((1/2)-1./(1+exp(b(2).*(x-b(3)))))+b(4).*x+b(5);

%ColDist



x=ColDistFull';
x(isnan(x))=0;

start=[0.0,10.0,0.0,0.0,0.0]';
nlmColDist=fitnlm(x,y,modelFun,start)
temp=predict(nlmColDist,x);
corrMat(rInd,cInd)=corr(temp,y,'Type',corrType);
rmseMat(rInd,cInd)=sqrt(mean((temp-y).^2));
corrMatOrg(rInd,cInd)=corr(x,y,'Type',corrType);




subplot(1,2,1)
plot(x,y,'bo');
xlabel('x'); ylabel('y');
xx=linspace(min(x),max(x))';
line(xx,predict(nlmColDist,xx),'linestyle','-','color','r','LineWidth',2);
dmosDev=std(y);
line(xx,predict(nlmColDist,xx)+dmosDev,'linestyle','--','color','r','LineWidth',2);
line(xx,predict(nlmColDist,xx)-dmosDev,'linestyle','--','color','r','LineWidth',2);
line(xx,predict(nlmColDist,xx)+2*dmosDev,'linestyle',':','color','r','LineWidth',2);
line(xx,predict(nlmColDist,xx)-2*dmosDev,'linestyle',':','color','r','LineWidth',2);
corrMatOrg(rInd,cInd)=corr(x,y,'Type',corrType);
 title(['BEFORE: cqa ','CC: ',num2str(corrMatOrg(rInd,cInd))]);





subplot(1,2,2)
scatter(temp,y); title(['AFTER: cqa ','CC: ',num2str(corrMat(rInd,cInd)),' Rmse: ',num2str(rmseMat(rInd,cInd))]);
hold on, plot(linX,linY,'linestyle','-','color','r','LineWidth',2);
hold on, plot(linX,linY+std(y),'linestyle','--','color','r','LineWidth',2);
hold on, plot(linX,linY-std(y),'linestyle','--','color','r','LineWidth',2);
hold on, plot(linX,linY+2*std(y),'linestyle',':','color','r','LineWidth',2);
hold on, plot(linX,linY-2*std(y),'linestyle',':','color','r','LineWidth',2);






%% JPEG
cInd=2;
y=JpegDmos';
%ColDist
x=JpegColDistFull';
x(isnan(x))=0;
temp=predict(nlmColDist,x);
corrMat(rInd,cInd)=corr(temp,y,'Type',corrType);
rmseMat(rInd,cInd)=sqrt(mean((temp-y).^2));
corrMatOrg(rInd,cInd)=corr(x,y,'Type',corrType);
%% JP2K
cInd=1;
y=Jp2kDmos';
x=Jp2kColDistFull';
x(isnan(x))=0;
temp=predict(nlmColDist,x);
corrMat(rInd,cInd)=corr(temp,y,'Type',corrType);
rmseMat(rInd,cInd)=sqrt(mean((temp-y).^2));
corrMatOrg(rInd,cInd)=corr(x,y,'Type',corrType);
%% Wn
cInd=3;
y=WnDmos';
%ColDist
x=WnColDistFull';
x(isnan(x))=0;
temp=predict(nlmColDist,x);
corrMat(rInd,cInd)=corr(temp,y,'Type',corrType);
rmseMat(rInd,cInd)=sqrt(mean((temp-y).^2));
corrMatOrg(rInd,cInd)=corr(x,y,'Type',corrType);
%% Gblur
cInd=4;
y=GblurDmos';
%ColDist
x=GblurColDistFull';
x(isnan(x))=0;
temp=predict(nlmColDist,x);
corrMat(rInd,cInd)=corr(temp,y,'Type',corrType);
rmseMat(rInd,cInd)=sqrt(mean((temp-y).^2));
corrMatOrg(rInd,cInd)=corr(x,y,'Type',corrType);
%% Fastfading
cInd=5;
y=FastfadingDmos';
%ColDist
x=FastfadingColDistFull';
x(isnan(x))=0;
temp=predict(nlmColDist,x);
corrMat(rInd,cInd)=corr(temp,y,'Type',corrType);
rmseMat(rInd,cInd)=sqrt(mean((temp-y).^2));
corrMatOrg(rInd,cInd)=corr(x,y,'Type',corrType);
%%

orderDist
corrMatOrg
corrMat
rmseMat
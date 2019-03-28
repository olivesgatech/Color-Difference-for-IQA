scSize=300;
scType='png';

%% 
nRoot=2;
nDist=6;
nMetric=11;
corrMat=zeros(nMetric,nDist);
rmseMat=zeros(nMetric,nDist);
rmseMatOrg=zeros(nMetric,nDist);
corrType='Pearson';
orderIQA=char('Ssim','Mse','Psnr','Cwssim','Msssim','Iwssim','Iwpsnr','ColDist','ColDistSc','Iwssim-sqrt(ColDist)','Ssim-sqrt(ColDist)');
orderDist=char('Jp2k','Jpeg','Wn','Gblur','Fastfading','All');

%% ALL
cInd=6;
y=DmosScore';

len=size(y,1);
linX=1:len; linX=(linX/max(linX))*100;
linY=linX;


modelFun=@(b,x) b(1).*((1/2)-1./(1+exp(b(2).*(x-b(3)))))+b(4).*x+b(5);

rInd=8;
x=ColDistFull';
start=[0.0,60.0,0.0,0.0,0.0]';
nlmColDist=fitnlm(x,y,modelFun,start);
temp=predict(nlmColDist,x);
corrMat(rInd,cInd)=corr(temp,y,'Type',corrType);
rmseMat(rInd,cInd)=sqrt(mean((temp-y).^2));
corrMatOrg(rInd,cInd)=corr(x,y,'Type',corrType);
figure;
label1=num2str(corrMat(rInd,cInd));
label2=num2str(rmseMat(rInd,cInd));
scatter(temp,y,scSize,'*'); title(['CC: ',label1(1:5),' RMSE: ',label2(1:4)],'fontsize',42,'fontweight','bold');
set(gca,'fontsize',30);

hold on, plot(linX,linY,'linestyle','-','color','r','LineWidth',6);
hold on, plot(linX,linY+std(y),'linestyle','--','color','r','LineWidth',6);
hold on, plot(linX,linY-std(y),'linestyle','--','color','r','LineWidth',6);
hold on, plot(linX,linY+2*std(y),'linestyle',':','color','r','LineWidth',6);
hold on, plot(linX,linY-2*std(y),'linestyle',':','color','r','LineWidth',6);
xlabel('PCDM','fontsize',30,'fontweight','bold'); ylabel('DMOS','fontsize',30,'fontweight','bold');


saveas(gcf,'all',scType)








%% Jpeg
cInd=2;
y=JpegDmos';

rInd=8;
x=JpegColDistFull';
temp=predict(nlmColDist,x);
corrMat(rInd,cInd)=corr(temp,y,'Type',corrType);
rmseMat(rInd,cInd)=sqrt(mean((temp-y).^2));
corrMatOrg(rInd,cInd)=corr(x,y,'Type',corrType);

figure;
label1=num2str(corrMat(rInd,cInd));
label2=num2str(rmseMat(rInd,cInd));
scatter(temp,y,scSize,'*'); title(['CC: ',label1(1:5),' RMSE: ',label2(1:4)],'fontsize',42,'fontweight','bold');
set(gca,'fontsize',30);

hold on, plot(linX,linY,'linestyle','-','color','r','LineWidth',6);
hold on, plot(linX,linY+std(y),'linestyle','--','color','r','LineWidth',6);
hold on, plot(linX,linY-std(y),'linestyle','--','color','r','LineWidth',6);
hold on, plot(linX,linY+2*std(y),'linestyle',':','color','r','LineWidth',6);
hold on, plot(linX,linY-2*std(y),'linestyle',':','color','r','LineWidth',6);
xlabel('PCDM','fontsize',30,'fontweight','bold'); ylabel('DMOS','fontsize',30,'fontweight','bold');


saveas(gcf,'jpeg',scType)





%% Jp2k
cInd=1;
y=Jp2kDmos';

rInd=8;
x=Jp2kColDistFull';
temp=predict(nlmColDist,x);
corrMat(rInd,cInd)=corr(temp,y,'Type',corrType);
rmseMat(rInd,cInd)=sqrt(mean((temp-y).^2));
corrMatOrg(rInd,cInd)=corr(x,y,'Type',corrType);


figure;
label1=num2str(corrMat(rInd,cInd));
label2=num2str(rmseMat(rInd,cInd));
scatter(temp,y,scSize,'*'); title(['CC: ',label1(1:5),' RMSE: ',label2(1:4)],'fontsize',42,'fontweight','bold');
set(gca,'fontsize',30);

hold on, plot(linX,linY,'linestyle','-','color','r','LineWidth',6);
hold on, plot(linX,linY+std(y),'linestyle','--','color','r','LineWidth',6);
hold on, plot(linX,linY-std(y),'linestyle','--','color','r','LineWidth',6);
hold on, plot(linX,linY+2*std(y),'linestyle',':','color','r','LineWidth',6);
hold on, plot(linX,linY-2*std(y),'linestyle',':','color','r','LineWidth',6);
xlabel('PCDM','fontsize',30,'fontweight','bold'); ylabel('DMOS','fontsize',30,'fontweight','bold');

saveas(gcf,'jp2k',scType)

%% Wn
cInd=3;
y=WnDmos';

rInd=8;
x=WnColDistFull';
temp=predict(nlmColDist,x);
corrMat(rInd,cInd)=corr(temp,y,'Type',corrType);
rmseMat(rInd,cInd)=sqrt(mean((temp-y).^2));
corrMatOrg(rInd,cInd)=corr(x,y,'Type',corrType);


figure;
label1=num2str(corrMat(rInd,cInd));
label2=num2str(rmseMat(rInd,cInd));
scatter(temp,y,scSize,'*'); title(['CC: ',label1(1:5),' RMSE: ',label2(1:4)],'fontsize',42,'fontweight','bold');
set(gca,'fontsize',30);

hold on, plot(linX,linY,'linestyle','-','color','r','LineWidth',6);
hold on, plot(linX,linY+std(y),'linestyle','--','color','r','LineWidth',6);
hold on, plot(linX,linY-std(y),'linestyle','--','color','r','LineWidth',6);
hold on, plot(linX,linY+2*std(y),'linestyle',':','color','r','LineWidth',6);
hold on, plot(linX,linY-2*std(y),'linestyle',':','color','r','LineWidth',6);
xlabel('PCDM','fontsize',30,'fontweight','bold'); ylabel('DMOS','fontsize',30,'fontweight','bold');
saveas(gcf,'wn',scType)


%% Gblur
cInd=4;
y=GblurDmos';

rInd=8;
x=GblurColDistFull';
temp=predict(nlmColDist,x);
corrMat(rInd,cInd)=corr(temp,y,'Type',corrType);
rmseMat(rInd,cInd)=sqrt(mean((temp-y).^2));
corrMatOrg(rInd,cInd)=corr(x,y,'Type',corrType);




figure;
label1=num2str(corrMat(rInd,cInd));
label2=num2str(rmseMat(rInd,cInd));
scatter(temp,y,scSize,'*'); title(['CC: ',label1(1:5),' RMSE: ',label2(1:4)],'fontsize',42,'fontweight','bold');
set(gca,'fontsize',30);

hold on, plot(linX,linY,'linestyle','-','color','r','LineWidth',6);
hold on, plot(linX,linY+std(y),'linestyle','--','color','r','LineWidth',6);
hold on, plot(linX,linY-std(y),'linestyle','--','color','r','LineWidth',6);
hold on, plot(linX,linY+2*std(y),'linestyle',':','color','r','LineWidth',6);
hold on, plot(linX,linY-2*std(y),'linestyle',':','color','r','LineWidth',6);
xlabel('PCDM','fontsize',30,'fontweight','bold'); ylabel('DMOS','fontsize',30,'fontweight','bold');
saveas(gcf,'gblur',scType)

%% Fastfading

cInd=5;
y=FastfadingDmos';

rInd=8;
x=FastfadingColDistFull';
temp=predict(nlmColDist,x);
corrMat(rInd,cInd)=corr(temp,y,'Type',corrType);
rmseMat(rInd,cInd)=sqrt(mean((temp-y).^2));
corrMatOrg(rInd,cInd)=corr(x,y,'Type',corrType);


figure;
label1=num2str(corrMat(rInd,cInd));
label2=num2str(rmseMat(rInd,cInd));
scatter(temp,y,scSize,'*'); title(['CC: ',label1(1:5),' RMSE: ',label2(1:4)],'fontsize',42,'fontweight','bold');
set(gca,'fontsize',30);

hold on, plot(linX,linY,'linestyle','-','color','r','LineWidth',6);
hold on, plot(linX,linY+std(y),'linestyle','--','color','r','LineWidth',6);
hold on, plot(linX,linY-std(y),'linestyle','--','color','r','LineWidth',6);
hold on, plot(linX,linY+2*std(y),'linestyle',':','color','r','LineWidth',6);
hold on, plot(linX,linY-2*std(y),'linestyle',':','color','r','LineWidth',6);
xlabel('PCDM','fontsize',30,'fontweight','bold'); ylabel('DMOS','fontsize',30,'fontweight','bold');
saveas(gcf,'fastfading',scType)






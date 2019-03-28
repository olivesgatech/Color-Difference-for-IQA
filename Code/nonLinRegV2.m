
%% 
nRoot=2;
nDist=6;
nMetric=5;
corrMat=zeros(nMetric,nDist);
rmseMat=zeros(nMetric,nDist);
rmseMatOrg=zeros(nMetric,nDist);
corrType='Pearson';
orderIQA=char('PSNR','SSIM','MSSSIM','CWSSIM','PCDM');
orderDist=char('Jp2k','Jpeg','Wn','Gblur','Fastfading','All');

%% ALL
cInd=6;
y=DmosScore';

len=size(y,1);
linX=1:len; linX=(linX/max(linX))*100;
linY=linX;


modelFun=@(b,x) b(1).*((1/2)-1./(1+exp(b(2).*(x-b(3)))))+b(4).*x+b(5);

%Ssim
rInd=2;
x=SsimFull';
start=[0.0,0.8,0.0,0.0,0.0]';
nlmSsim=fitnlm(x,y,modelFun,start);
temp=predict(nlmSsim,x);
corrMat(rInd,cInd)=corr(temp,y,'Type',corrType);
rmseMat(rInd,cInd)=sqrt(mean((temp-y).^2));
corrMatOrg(rInd,cInd)=corr(x,y,'Type',corrType);

%Psnr
rInd=1;
x=20.*log10(255./sqrt(MseFull+0.001))';
start=[0.0,2.0,0.0,0.0,0.0];
nlmPsnr=fitnlm(x,y,modelFun,start);
temp=predict(nlmPsnr,x);
corrMat(rInd,cInd)=corr(temp,y,'Type',corrType);
rmseMat(rInd,cInd)=sqrt(mean((temp-y).^2));
corrMatOrg(rInd,cInd)=corr(x,y,'Type',corrType);




%Msssim
rInd=3;
x=MsssimFull';
start=[0.0,0.8,0.0,0.0,0.0]';
nlmMsssim=fitnlm(x,y,modelFun,start);
temp=predict(nlmMsssim,x);
corrMat(rInd,cInd)=corr(temp,y,'Type',corrType);
rmseMat(rInd,cInd)=sqrt(mean((temp-y).^2));
corrMatOrg(rInd,cInd)=corr(x,y,'Type',corrType);


%Cwssim
rInd=4;
x=CwssimFull';
start=[0.0,0.8,0.0,0.0,0.0]';
nlmCwssim=fitnlm(x,y,modelFun,start);
temp=predict(nlmCwssim,x);
corrMat(rInd,cInd)=corr(temp,y,'Type',corrType);
rmseMat(rInd,cInd)=sqrt(mean((temp-y).^2));
corrMatOrg(rInd,cInd)=corr(x,y,'Type',corrType);


rInd=5;
x=ColDistFull';
start=[0.0,60.0,0.0,0.0,0.0]';
nlmColDist=fitnlm(x,y,modelFun,start);
temp=predict(nlmColDist,x);
corrMat(rInd,cInd)=corr(temp,y,'Type',corrType);
rmseMat(rInd,cInd)=sqrt(mean((temp-y).^2));
corrMatOrg(rInd,cInd)=corr(x,y,'Type',corrType);








%% Jpeg
cInd=2;
y=JpegDmos';
%Ssim
rInd=2;
x=JpegSsimFull';
% start=[0.0,0.8,0.0,0.0,0.0]';
% nlm=fitnlm(x,y,modelFun,start);
temp=predict(nlmSsim,x);
corrMat(rInd,cInd)=corr(temp,y,'Type',corrType);
rmseMat(rInd,cInd)=sqrt(mean((temp-y).^2));
corrMatOrg(rInd,cInd)=corr(x,y,'Type',corrType);
%Psnr
rInd=1;
x=20.*log10(255./sqrt(JpegMseFull+0.001))';
% start=[1.0,0.0,0.0,0.0,0.0];
% nlm=fitnlm(x,y,modelFun,start);
temp=predict(nlmPsnr,x);
corrMat(rInd,cInd)=corr(temp,y,'Type',corrType);
rmseMat(rInd,cInd)=sqrt(mean((temp-y).^2));
corrMatOrg(rInd,cInd)=corr(x,y,'Type',corrType);
%Cwssim
rInd=4;
x=JpegCwssimFull';
% start=[0.0,0.8,0.0,0.0,0.0]';
% nlm=fitnlm(x,y,modelFun,start);
temp=predict(nlmCwssim,x);
corrMat(rInd,cInd)=corr(temp,y,'Type',corrType);
rmseMat(rInd,cInd)=sqrt(mean((temp-y).^2));
corrMatOrg(rInd,cInd)=corr(x,y,'Type',corrType);
%Msssim
rInd=3;
x=JpegMsssimFull';
% start=[0.0,0.8,0.0,0.0,0.0]';
% nlm=fitnlm(x,y,modelFun,start);
temp=predict(nlmMsssim,x);
corrMat(rInd,cInd)=corr(temp,y,'Type',corrType);
rmseMat(rInd,cInd)=sqrt(mean((temp-y).^2));
corrMatOrg(rInd,cInd)=corr(x,y,'Type',corrType);
%ColDist
rInd=5;
x=JpegColDistFull';
% start=[0.0,60.0,0.0,0.0,0.0]';
% nlm=fitnlm(x,y,modelFun,start);
temp=predict(nlmColDist,x);
corrMat(rInd,cInd)=corr(temp,y,'Type',corrType);
rmseMat(rInd,cInd)=sqrt(mean((temp-y).^2));
corrMatOrg(rInd,cInd)=corr(x,y,'Type',corrType);


%% Jp2k
cInd=1;
y=Jp2kDmos';
%Ssim
rInd=2;
x=Jp2kSsimFull';
temp=predict(nlmSsim,x);
corrMat(rInd,cInd)=corr(temp,y,'Type',corrType);
rmseMat(rInd,cInd)=sqrt(mean((temp-y).^2));
corrMatOrg(rInd,cInd)=corr(x,y,'Type',corrType);
%Psnr
rInd=1;
x=20.*log10(255./sqrt(Jp2kMseFull+0.001))';
temp=predict(nlmPsnr,x);
corrMat(rInd,cInd)=corr(temp,y,'Type',corrType);
rmseMat(rInd,cInd)=sqrt(mean((temp-y).^2));
corrMatOrg(rInd,cInd)=corr(x,y,'Type',corrType);
%Cwssim
rInd=4;
x=Jp2kCwssimFull';
temp=predict(nlmCwssim,x);
corrMat(rInd,cInd)=corr(temp,y,'Type',corrType);
rmseMat(rInd,cInd)=sqrt(mean((temp-y).^2));
corrMatOrg(rInd,cInd)=corr(x,y,'Type',corrType);
%Msssim
rInd=3;
x=Jp2kMsssimFull';
temp=predict(nlmMsssim,x);
corrMat(rInd,cInd)=corr(temp,y,'Type',corrType);
rmseMat(rInd,cInd)=sqrt(mean((temp-y).^2));
corrMatOrg(rInd,cInd)=corr(x,y,'Type',corrType);
%ColDist
rInd=5;
x=Jp2kColDistFull';
temp=predict(nlmColDist,x);
corrMat(rInd,cInd)=corr(temp,y,'Type',corrType);
rmseMat(rInd,cInd)=sqrt(mean((temp-y).^2));
corrMatOrg(rInd,cInd)=corr(x,y,'Type',corrType);


%% Wn
cInd=3;
y=WnDmos';
%Ssim
rInd=2;
x=WnSsimFull';
temp=predict(nlmSsim,x);
corrMat(rInd,cInd)=corr(temp,y,'Type',corrType);
rmseMat(rInd,cInd)=sqrt(mean((temp-y).^2));
corrMatOrg(rInd,cInd)=corr(x,y,'Type',corrType);
rInd=1;
x=20.*log10(255./sqrt(WnMseFull+0.001))';
temp=predict(nlmPsnr,x);
corrMat(rInd,cInd)=corr(temp,y,'Type',corrType);
rmseMat(rInd,cInd)=sqrt(mean((temp-y).^2));
corrMatOrg(rInd,cInd)=corr(x,y,'Type',corrType);
%Cwssim
rInd=4;
x=WnCwssimFull';
temp=predict(nlmCwssim,x);
corrMat(rInd,cInd)=corr(temp,y,'Type',corrType);
rmseMat(rInd,cInd)=sqrt(mean((temp-y).^2));
corrMatOrg(rInd,cInd)=corr(x,y,'Type',corrType);
%Msssim
rInd=3;
x=WnMsssimFull';
temp=predict(nlmMsssim,x);
corrMat(rInd,cInd)=corr(temp,y,'Type',corrType);
rmseMat(rInd,cInd)=sqrt(mean((temp-y).^2));
corrMatOrg(rInd,cInd)=corr(x,y,'Type',corrType);
%ColDist
rInd=5;
x=WnColDistFull';
temp=predict(nlmColDist,x);
corrMat(rInd,cInd)=corr(temp,y,'Type',corrType);
rmseMat(rInd,cInd)=sqrt(mean((temp-y).^2));
corrMatOrg(rInd,cInd)=corr(x,y,'Type',corrType);


%% Gblur
cInd=4;
y=GblurDmos';
%Ssim
rInd=2;
x=GblurSsimFull';
temp=predict(nlmSsim,x);
corrMat(rInd,cInd)=corr(temp,y,'Type',corrType);
rmseMat(rInd,cInd)=sqrt(mean((temp-y).^2));
corrMatOrg(rInd,cInd)=corr(x,y,'Type',corrType);
%Psnr
rInd=1;
x=20.*log10(255./sqrt(GblurMseFull+0.001))';
temp=predict(nlmPsnr,x);
corrMat(rInd,cInd)=corr(temp,y,'Type',corrType);
rmseMat(rInd,cInd)=sqrt(mean((temp-y).^2));
corrMatOrg(rInd,cInd)=corr(x,y,'Type',corrType);
%Cwssim
rInd=4;
x=GblurCwssimFull';
temp=predict(nlmCwssim,x);
corrMat(rInd,cInd)=corr(temp,y,'Type',corrType);
rmseMat(rInd,cInd)=sqrt(mean((temp-y).^2));
corrMatOrg(rInd,cInd)=corr(x,y,'Type',corrType);
%Msssim
rInd=3;
x=GblurMsssimFull';
temp=predict(nlmMsssim,x);
corrMat(rInd,cInd)=corr(temp,y,'Type',corrType);
rmseMat(rInd,cInd)=sqrt(mean((temp-y).^2));
corrMatOrg(rInd,cInd)=corr(x,y,'Type',corrType);
rInd=5;
x=GblurColDistFull';
temp=predict(nlmColDist,x);
corrMat(rInd,cInd)=corr(temp,y,'Type',corrType);
rmseMat(rInd,cInd)=sqrt(mean((temp-y).^2));
corrMatOrg(rInd,cInd)=corr(x,y,'Type',corrType);

%% Fastfading

cInd=5;
y=FastfadingDmos';
%Ssim
rInd=2;
x=FastfadingSsimFull';
temp=predict(nlmSsim,x);
corrMat(rInd,cInd)=corr(temp,y,'Type',corrType);
rmseMat(rInd,cInd)=sqrt(mean((temp-y).^2));
corrMatOrg(rInd,cInd)=corr(x,y,'Type',corrType);
%Psnr
rInd=1;
x=20.*log10(255./sqrt(FastfadingMseFull+0.001))';
temp=predict(nlmPsnr,x);
corrMat(rInd,cInd)=corr(temp,y,'Type',corrType);
rmseMat(rInd,cInd)=sqrt(mean((temp-y).^2));
corrMatOrg(rInd,cInd)=corr(x,y,'Type',corrType);
%Cwssim
rInd=4;
x=FastfadingCwssimFull';
temp=predict(nlmCwssim,x);
corrMat(rInd,cInd)=corr(temp,y,'Type',corrType);
rmseMat(rInd,cInd)=sqrt(mean((temp-y).^2));
corrMatOrg(rInd,cInd)=corr(x,y,'Type',corrType);
%Msssim
rInd=3;
x=FastfadingMsssimFull';
temp=predict(nlmMsssim,x);
corrMat(rInd,cInd)=corr(temp,y,'Type',corrType);
rmseMat(rInd,cInd)=sqrt(mean((temp-y).^2));
corrMatOrg(rInd,cInd)=corr(x,y,'Type',corrType);
%ColDist
rInd=5;
x=FastfadingColDistFull';
temp=predict(nlmColDist,x);
corrMat(rInd,cInd)=corr(temp,y,'Type',corrType);
rmseMat(rInd,cInd)=sqrt(mean((temp-y).^2));
corrMatOrg(rInd,cInd)=corr(x,y,'Type',corrType);


%%
orderDist
orderIQA
corrMatOrg
corrMat
rmseMat
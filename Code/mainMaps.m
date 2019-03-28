clear all
close all
clc
nl=0;
tic
sc=0.5;
scType='pdf';
%%
%1
imgDir1=[cd,'\images\bikes.bmp'];
imgDir2=[cd,'\images\bikes.bmp_1.307261.bmp'];
%%
%2
% imgDir1=[cd,'\images\bikes.bmp'];
% imgDir2=[cd,'\images\color_bikes.bmp_0.20876.bmp'];
%%
%3
% imgDir1=[cd,'\images\bikes.bmp'];
% imgDir2=[cd,'\images\intensity_bikes.bmp_0.20876.bmp'];
%%







img1FullINT=imread(imgDir1);
img2FullINT=imread(imgDir2);

figure,imshow(img1FullINT);
saveas(gcf,'original',scType)
figure,imshow(img2FullINT);
saveas(gcf,'distorted',scType)
%black, blue, brown, grey, green, orange, pink, purple, red, white, yellow

D= [0 1 0.9497 0.76544 1 1 1 1 1 1 1;...
	  1 0 1 1 1 1 1 1 1 1 1;...
	  0.9497 1 0 0.93538 1 1 1 1 1 1 1;...
	  0.76544 1 0.93538 0 1 1 1 1 1 0.68809 1;...
	  1 1 1 1 0 1 1 1 1 1 1;...
	  1 1 1 1 1 0 1 1 0.92114 1 1;...
	  1 1 1 1 1 1 0 1 1 1 1;...
	  1 1 1 1 1 1 1 0 1 1 1;...
	  1 1 1 1 1 0.92114 1 1 0 1 1;...
	  1 1 1 0.68809 1 1 1 1 1 0 1;...
	  1 1 1 1 1 1 1 1 1 1 0];

% D=ones(11,11);

  T=20;
  alpha=0.5;
  Z=10;
  
 [ssimMap,pcdmMap]=mapsV1(img1FullINT,img2FullINT,sc,T,D,alpha,Z); 
 
 
 
figure,imagesc(ssimMap);
set(gca,'Visible','off')
colorbar;
set(gca,'fontsize',24);

saveas(gcf,'ssimMap',scType)

figure,imagesc(1-pcdmMap);
set(gca,'Visible','off')
colorbar;
set(gca,'fontsize',24);
saveas(gcf,'pcdmMap',scType)

 
mean2(1-pcdmMap)
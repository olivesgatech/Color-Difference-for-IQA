  function [perColDist] =ColMet10(img1FullINT, img2FullINT,sc,T,D,alpha,Z)


 %%INPUT IMAGE SET
 % %Grayscale Images
img1=rgb2gray(uint8(img1FullINT)); 
img2=rgb2gray(uint8(img2FullINT));
 
 
 
%Downsampled Images
img1Full=imresize(double(img1FullINT),sc);
img2Full=imresize(double(img2FullINT),sc);


%% SSIM
%Initialization 
   K(1) = 0.01;				
   K(2) = 0.03;					
   L = 255;  
   window = fspecial('gaussian', 11, 1.5);	
   [M, N] = size(img1);
   
img1 = double(img1);
img2 = double(img2);



% automatic downsampling
f = max(1,round(min(M,N)/256));
%downsampling by f
%use a simple low-pass filter 
if(f>1)
    lpf = ones(f,f);
    lpf = lpf/sum(lpf(:));

    
    img1 = imfilter(img1,lpf,'symmetric','same');
    img2 = imfilter(img2,lpf,'symmetric','same');

    img1 = img1(1:f:end,1:f:end);
    img2 = img2(1:f:end,1:f:end);
end
%Calulcation of constants at steps II and IV

C1 = (K(1)*L)^2;
C2 = (K(2)*L)^2;
window = window/sum(sum(window));

%Calculation of statistics at step I, III and VI
mu1   = filter2(window, img1, 'valid');
mu2   = filter2(window, img2, 'valid');
mu1_sq = mu1.*mu1;
mu2_sq = mu2.*mu2;
mu1_mu2 = mu1.*mu2;
sigma1_sq = filter2(window, img1.*img1, 'valid') - mu1_sq;
sigma2_sq = filter2(window, img2.*img2, 'valid') - mu2_sq;
sigma12 = filter2(window, img1.*img2, 'valid') - mu1_mu2;



%Step V, VII, VIII and IX

if (C1 > 0 && C2 > 0)
   ssim_map = ((2*mu1_mu2 + C1).*(2*sigma12 + C2))./((mu1_sq + mu2_sq + C1).*(sigma1_sq + sigma2_sq + C2));
else
   numerator1 = 2*mu1_mu2 + C1;
   numerator2 = 2*sigma12 + C2;
	denominator1 = mu1_sq + mu2_sq + C1;
   denominator2 = sigma1_sq + sigma2_sq + C2;
   ssim_map = ones(size(mu1));
   index = (denominator1.*denominator2 > 0);
   ssim_map(index) = (numerator1(index).*numerator2(index))./(denominator1(index).*denominator2(index));
   index = (denominator1 ~= 0) & (denominator2 == 0);
   ssim_map(index) = numerator1(index)./denominator1(index);
end
% Step X 
mssim = mean2(ssim_map);
%% PercColDist
[s1,s2,s3]=size(img1Full);
tempMat=zeros(s1,s2);
for i=1:s1
    for j=1:s2
        
        if (min(img1Full(i,j,:))<0)
             img1Full(i,j,:)=img1Full(i,j,:)+abs(min(img1Full(i,j,:)))+0.001;
             t1=img1Full(i,j,:)
        end
        if (min(img2Full(i,j,:))<0)
             img2Full(i,j,:)=img2Full(i,j,:)+abs(min(img2Full(i,j,:)))+0.001;
             t2=img2Full(i,j,:)   
        end     
             
        if (max(img1Full(i,j,:))>=255)
             img1Full(i,j,:)=img1Full(i,j,:).*(254/max(img1Full(i,j,:)));
             t3=img1Full(i,j,:)
        end
        if (max(img2Full(i,j,:))>=255)
             img2Full(i,j,:)=img2Full(i,j,:).*(254/max(img2Full(i,j,:)));
             t4=img2Full(i,j,:)
        end     
             
          


      
   tempMat(i,j)=COL_DIST2(squeeze(img1Full(i,j,:))',squeeze(img2Full(i,j,:))',T,D,alpha,Z);
    end    
end


perColDist=mean2(tempMat);



  return
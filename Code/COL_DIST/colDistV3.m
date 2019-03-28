function [colDifVal] = colDistV3(img1,img2,sc,T,D,alpha,Z)

%COL_DIST(RGB1, RGB2,  T, D, alpha, Z)

%   D= [0 1 0.9497 0.76544 1 1 1 1 1 1 1;...
% 	  1 0 1 1 1 1 1 1 1 1 1;...
% 	  0.9497 1 0 0.93538 1 1 1 1 1 1 1;...
% 	  0.76544 1 0.93538 0 1 1 1 1 1 0.68809 1;...
% 	  1 1 1 1 0 1 1 1 1 1 1;...
% 	  1 1 1 1 1 0 1 1 0.92114 1 1;...
% 	  1 1 1 1 1 1 0 1 1 1 1;...
% 	  1 1 1 1 1 1 1 0 1 1 1;...
% 	  1 1 1 1 1 0.92114 1 1 0 1 1;...
% 	  1 1 1 0.68809 1 1 1 1 1 0 1;...
% 	  1 1 1 1 1 1 1 1 1 1 0];
% 
%   T=20;
%   alpha=0.5;
%   Z=10;






I1=imresize(img1,sc);
I2=imresize(img2,sc);
[s1,s2,s3]=size(I1);
sum=0;
for i=1:s1
    for j=1:s2
   sum=sum+COL_DIST(squeeze(I1(i,j,:))',squeeze(I2(i,j,:))',T,D,alpha,Z);
    end    
end
colDifVal=sum/(s1*s2);
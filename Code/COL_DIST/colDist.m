function [colDifVal] = colDist(img1,img2)

I1=imresize(img1,0.05);
I2=imresize(img2,0.05);
[s1,s2,s3]=size(I1);
sum=0;
for i=1:s1
    for j=1:s2
   sum=sum+COL_DIST(squeeze(I1(i,j,:))',squeeze(I2(i,j,:))');
    end    
end
colDifVal=sum/(s1*s2);
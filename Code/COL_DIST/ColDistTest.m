I1=imresize(bikes,0.1);
I2=imresize(bikes0x2Ebmp_10x2E4875,0.1);
[s1,s2,s3]=size(I1);
sum=0;

for i=1:s1
    for j=1:s2
   sum=sum+COL_DIST(squeeze(I1(i,j,:))',squeeze(I2(i,j,:))')
    end    
end

colDist=sum/(s1*s2)
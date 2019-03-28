clear all
close all
clc

% tic

nl=0;
tic
sc=0.05;

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
  alpha=1.0;
  Z=10;






curDir=cd;
dataDir=[curDir,'\databaserelease2'];
load([dataDir,'\dmos.mat']);
load([dataDir,'\refnames_all.mat']);


%Image directories
data='\databaserelease2\';
imgDirRef=[cd,data,'refimgs\'];
imgDirFastfading=[cd,data,'fastfading\'];
imgDirGblur=[cd,data,'gblur\'];
imgDirJp2k=[cd,data,'jp2k\'];
imgDirJpeg=[cd,data,'jpeg\'];
imgDirWn=[cd,data,'wn\'];

refFiles=dir([imgDirRef,'*.bmp']);
fastfadingFiles=dir([imgDirFastfading,'*.bmp']);
gblurFiles=dir([imgDirGblur,'*.bmp']);
jp2kFiles=dir([imgDirJp2k,'*.bmp']);
jpegFiles=dir([imgDirJpeg,'*.bmp']);
wnFiles=dir([imgDirWn,'*.bmp']);


% len=1;
len=length(refFiles);
img(len)=NImgV2;

for i=1:len    
img(i).Img=imread(strcat(imgDirRef,refFiles(i).name));
img(i).ImgYcbcr=rgb2ycbcr(img(i).Img);
temp=uint8(zeros(size(img(i).Img)));
temp2=uint8(zeros(size(img(i).Img)));
temp3=uint8(zeros(size(img(i).Img)));





  %%  1- Extract fastfading data
    z=1;
  offset=808;  
fid=fopen([imgDirFastfading,'info.txt']);
[list, count]=textscan(fid,'%s');
    jLen=length(list{1,1});
    k=1;
    for j=1:jLen 
        if (strcmp(list{1,1}{j,1},refFiles(i).name))
            img(i).ImgFastfading(:,:,:,k)=imread([imgDirFastfading,list{1,1}{j+1,1}]);            img(i).ParamFastfading(k)=str2double(list{1,1}{j+2,1});

            tt=list{1,1}{j+1,1};
           img(i).Dmos(z,k)=dmos(str2double(tt(4:end-4))+offset);
           img(i).DmosFlag(z,k)=orgs(str2double(tt(4:end-4))+offset);        
                      
                         img(i).ColDistFastfading(k)=ColMet10(img(i).Img,uint8(img(i).ImgFastfading(:,:,:,k)),sc,T,D,alpha,Z);                            
            
            k=k+1;
        end        
    end
 fclose(fid);

  %%  2- Extract gblur data
  z=2;
  offset=634;    
fid=fopen([imgDirGblur,'info.txt']);
[list, count]=textscan(fid,'%s');
    jLen=length(list{1,1});
    k=1;
    for j=1:jLen 
        if (strcmp(list{1,1}{j,1},refFiles(i).name))
            img(i).ImgGblur(:,:,:,k)=imread([imgDirGblur,list{1,1}{j+1,1}]);
            img(i).ParamGblur(k)=str2double(list{1,1}{j+2,1});
            
            tt=list{1,1}{j+1,1};
           img(i).Dmos(z,k)=dmos(str2double(tt(4:end-4))+offset);
           img(i).DmosFlag(z,k)=orgs(str2double(tt(4:end-4))+offset);
                    
                         img(i).ColDistGblur(k)=ColMet10(img(i).Img,uint8(img(i).ImgGblur(:,:,:,k)),sc,T,D,alpha,Z);                            
            
            k=k+1;
        end        
    end
 fclose(fid);

  
  
  
  %%  3- Extract jp2k data
  z=3;
  offset=0;    
fid=fopen([imgDirJp2k,'info.txt']);
[list, count]=textscan(fid,'%s');
    jLen=length(list{1,1});
    k=1;
    for j=1:jLen 
        if (strcmp(list{1,1}{j,1},refFiles(i).name))
            img(i).ImgJp2k(:,:,:,k)=imread([imgDirJp2k,list{1,1}{j+1,1}]);
            img(i).ParamJp2k(k)=str2double(list{1,1}{j+2,1});

            tt=list{1,1}{j+1,1};
           img(i).Dmos(z,k)=dmos(str2double(tt(4:end-4))+offset);
           img(i).DmosFlag(z,k)=orgs(str2double(tt(4:end-4))+offset);

                         
                         img(i).ColDistJp2k(k)=ColMet10(img(i).Img,uint8(img(i).ImgJp2k(:,:,:,k)),sc,T,D,alpha,Z);                            
            
            k=k+1;
        end        
    end
 fclose(fid);


  %%  4- Extract jpeg data
    z=4;
  offset=227;    
fid=fopen([imgDirJpeg,'info.txt']);
[list, count]=textscan(fid,'%s');
    jLen=length(list{1,1});
    k=1;
    for j=1:jLen 
        if (strcmp(list{1,1}{j,1},refFiles(i).name))
            img(i).ImgJpeg(:,:,:,k)=imread([imgDirJpeg,list{1,1}{j+1,1}]);
            img(i).ParamJpeg(k)=str2double(list{1,1}{j+2,1}); 
            tt=list{1,1}{j+1,1};
           img(i).Dmos(z,k)=dmos(str2double(tt(4:end-4))+offset);
           img(i).DmosFlag(z,k)=orgs(str2double(tt(4:end-4))+offset);
            
            

                          
                         
                         img(i).SsimJpeg(k)=ssim(double(rgb2gray(img(i).Img)),double(rgb2gray(uint8(img(i).ImgJpeg(:,:,:,k)))));                         
                         img(i).PsnrJpeg(k)=psnr(double(rgb2gray(img(i).Img)),double(rgb2gray(uint8(img(i).ImgJpeg(:,:,:,k)))));                        
                         img(i).MseJpeg(k)=mse(double(rgb2gray(img(i).Img)),double(rgb2gray(uint8(img(i).ImgJpeg(:,:,:,k)))));                         
                         img(i).CwssimJpeg(k)=cwssim_index(double(rgb2gray(img(i).Img)),double(rgb2gray(uint8(img(i).ImgJpeg(:,:,:,k)))),6,16,0,0);
                         img(i).MsssimJpeg(k)=msssim(double(rgb2gray(img(i).Img)),double(rgb2gray(uint8(img(i).ImgJpeg(:,:,:,k)))));                    
                         [img(i).IwssimJpeg(k), img(i).IwpsnrJpeg(k) ]=iwssim(double(rgb2gray(img(i).Img)),double(rgb2gray(uint8(img(i).ImgJpeg(:,:,:,k)))));                          
                         img(i).ColDistJpeg(k)=ColMet10(img(i).Img,uint8(img(i).ImgJpeg(:,:,:,k)),sc,T,D,alpha,Z);                            
            
            k=k+1;
        end        
    end
 fclose(fid);

 
 %%  5- Extract wn data
  z=5;
  offset=460;
fid=fopen([imgDirWn,'info.txt']);
[list, count]=textscan(fid,'%s');
    jLen=length(list{1,1});
    k=1;
    for j=1:jLen 
        if (strcmp(list{1,1}{j,1},refFiles(i).name))
            img(i).ImgWn(:,:,:,k)=imread([imgDirWn,list{1,1}{j+1,1}]);
            img(i).ParamWn(k)=str2double(list{1,1}{j+2,1});
 
            tt=list{1,1}{j+1,1};
           img(i).Dmos(z,k)=dmos(str2double(tt(4:end-4))+offset);
           img(i).DmosFlag(z,k)=orgs(str2double(tt(4:end-4))+offset);          
          
            
                          
                         
                     
                         img(i).ColDistWn(k)=ColMet10(img(i).Img,uint8(img(i).ImgWn(:,:,:,k)),sc,T,D,alpha,Z);                            
            
            k=k+1;
        end        
    end
 fclose(fid);
 
 %%
  
 fprintf(repmat('\b',1,nl)); fprintf('Counter:%d/%d',i,len);nl=length(['Counter:',num2str(i),'/',num2str(len)]);   

end
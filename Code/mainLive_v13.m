clear all
close all
clc
nl=0;
tic
sc=0.001;

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
[list, ~]=textscan(fid,'%s');
    jLen=length(list{1,1});
    k=1;
    for j=1:jLen 
        if (strcmp(list{1,1}{j,1},refFiles(i).name))
            img(i).ImgFastfading(:,:,:,k)=imread([imgDirFastfading,list{1,1}{j+1,1}]);
            img(i).ParamFastfading(k)=str2double(list{1,1}{j+2,1});
            temp=rgb2ycbcr(imread([imgDirFastfading,list{1,1}{j+1,1}]));  
            tt=list{1,1}{j+1,1};
           img(i).Dmos(z,k)=dmos(str2double(tt(4:end-4))+offset);
           img(i).DmosFlag(z,k)=orgs(str2double(tt(4:end-4))+offset);
            
            
            temp2(:,:,1)=img(i).ImgYcbcr(:,:,1);
            temp2(:,:,2)=temp(:,:,2);
            temp2(:,:,3)=temp(:,:,3);                        
            img(i).ImgFastfadingCol(:,:,:,k)=ycbcr2rgb(temp2);
            temp3=img(i).ImgFastfadingCol(:,:,:,k);   
            
                         img(i).SsimFastfadingColor(k)=ssim(double(rgb2gray(img(i).Img)),double(rgb2gray(uint8(temp3))));                         
                         img(i).PsnrFastfadingColor(k)=psnr(double(rgb2gray(img(i).Img)),double(rgb2gray(uint8(temp3))));                         
                         img(i).MseFastfadingColor(k)=mse(double(rgb2gray(img(i).Img)),double(rgb2gray(uint8(temp3))));                         
                         img(i).CwssimFastfadingColor(k)=cwssim_index(double(rgb2gray(img(i).Img)),double(rgb2gray(uint8(temp3))),6,16,0,0);
                         img(i).MsssimFastfadingColor(k)=msssim(double(rgb2gray(img(i).Img)),double(rgb2gray(uint8(temp3))));                    
                         [img(i).IwssimFastfadingColor(k), img(i).IwpsnrFastfadingColor(k) ]=iwssim(double(rgb2gray(img(i).Img)),double(rgb2gray(uint8(temp3))));  
                         img(i).ColDistFastfadingColor(k)=colDistV2(img(i).Img,uint8(temp3),sc);
                           
            temp2(:,:,1)=temp(:,:,1);
            temp2(:,:,2)=img(i).ImgYcbcr(:,:,2);
            temp2(:,:,3)=img(i).ImgYcbcr(:,:,3);                        
            img(i).ImgFastfadingInt(:,:,:,k)=ycbcr2rgb(temp2);
            temp3=img(i).ImgFastfadingInt(:,:,:,k);                                 
                         
            
            
                         img(i).SsimFastfadingInt(k)=ssim(double(rgb2gray(img(i).Img)),double(rgb2gray(uint8(temp3))));                         
                         img(i).PsnrFastfadingInt(k)=psnr(double(rgb2gray(img(i).Img)),double(rgb2gray(uint8(temp3))));                         
                         img(i).MseFastfadingInt(k)=mse(double(rgb2gray(img(i).Img)),double(rgb2gray(uint8(temp3))));                         
                         img(i).CwssimFastfadingInt(k)=cwssim_index(double(rgb2gray(img(i).Img)),double(rgb2gray(uint8(temp3))),6,16,0,0);
                         img(i).MsssimFastfadingInt(k)=msssim(double(rgb2gray(img(i).Img)),double(rgb2gray(uint8(temp3))));                    
                         [img(i).IwssimFastfadingInt(k), img(i).IwpsnrFastfadingInt(k) ]=iwssim(double(rgb2gray(img(i).Img)),double(rgb2gray(uint8(temp3)))); 
                         img(i).ColDistFastfadingInt(k)=colDistV2(img(i).Img,uint8(temp3),sc);            
                          
                         
                         img(i).SsimFastfading(k)=ssim(double(rgb2gray(img(i).Img)),double(rgb2gray(uint8(img(i).ImgFastfading(:,:,:,k)))));                         
                         img(i).PsnrFastfading(k)=psnr(double(rgb2gray(img(i).Img)),double(rgb2gray(uint8(img(i).ImgFastfading(:,:,:,k)))));                        
                         img(i).MseFastfading(k)=mse(double(rgb2gray(img(i).Img)),double(rgb2gray(uint8(img(i).ImgFastfading(:,:,:,k)))));                         
                         img(i).CwssimFastfading(k)=cwssim_index(double(rgb2gray(img(i).Img)),double(rgb2gray(uint8(img(i).ImgFastfading(:,:,:,k)))),6,16,0,0);
                         img(i).MsssimFastfading(k)=msssim(double(rgb2gray(img(i).Img)),double(rgb2gray(uint8(img(i).ImgFastfading(:,:,:,k)))));                    
                         [img(i).IwssimFastfading(k), img(i).IwpsnrFastfading(k) ]=iwssim(double(rgb2gray(img(i).Img)),double(rgb2gray(uint8(img(i).ImgFastfading(:,:,:,k)))));                          
                         img(i).ColDistFastfading(k)=colDistV2(img(i).Img,uint8(img(i).ImgFastfading(:,:,:,k)),sc);                            
            
            k=k+1;
        end        
    end
 fclose(fid);

  %%  2- Extract gblur data
  z=2;
  offset=634;    
fid=fopen([imgDirGblur,'info.txt']);
[list, ~]=textscan(fid,'%s');
    jLen=length(list{1,1});
    k=1;
    for j=1:jLen 
        if (strcmp(list{1,1}{j,1},refFiles(i).name))
            img(i).ImgGblur(:,:,:,k)=imread([imgDirGblur,list{1,1}{j+1,1}]);
            img(i).ParamGblur(k)=str2double(list{1,1}{j+2,1});
            temp=rgb2ycbcr(imread([imgDirGblur,list{1,1}{j+1,1}]));  
            tt=list{1,1}{j+1,1};
           img(i).Dmos(z,k)=dmos(str2double(tt(4:end-4))+offset);
           img(i).DmosFlag(z,k)=orgs(str2double(tt(4:end-4))+offset);
            
            
            temp2(:,:,1)=img(i).ImgYcbcr(:,:,1);
            temp2(:,:,2)=temp(:,:,2);
            temp2(:,:,3)=temp(:,:,3);                        
            img(i).ImgGblurCol(:,:,:,k)=ycbcr2rgb(temp2);
            temp3=img(i).ImgGblurCol(:,:,:,k);   
            
                         img(i).SsimGblurColor(k)=ssim(double(rgb2gray(img(i).Img)),double(rgb2gray(uint8(temp3))));                         
                         img(i).PsnrGblurColor(k)=psnr(double(rgb2gray(img(i).Img)),double(rgb2gray(uint8(temp3))));                         
                         img(i).MseGblurColor(k)=mse(double(rgb2gray(img(i).Img)),double(rgb2gray(uint8(temp3))));                         
                         img(i).CwssimGblurColor(k)=cwssim_index(double(rgb2gray(img(i).Img)),double(rgb2gray(uint8(temp3))),6,16,0,0);
                         img(i).MsssimGblurColor(k)=msssim(double(rgb2gray(img(i).Img)),double(rgb2gray(uint8(temp3))));                    
                         [img(i).IwssimGblurColor(k), img(i).IwpsnrGblurColor(k) ]=iwssim(double(rgb2gray(img(i).Img)),double(rgb2gray(uint8(temp3))));  
                         img(i).ColDistGblurColor(k)=colDistV2(img(i).Img,uint8(temp3),sc);
                           
            temp2(:,:,1)=temp(:,:,1);
            temp2(:,:,2)=img(i).ImgYcbcr(:,:,2);
            temp2(:,:,3)=img(i).ImgYcbcr(:,:,3);                        
            img(i).ImgGblurInt(:,:,:,k)=ycbcr2rgb(temp2);
            temp3=img(i).ImgGblurInt(:,:,:,k);                                 
                         
            
            
                         img(i).SsimGblurInt(k)=ssim(double(rgb2gray(img(i).Img)),double(rgb2gray(uint8(temp3))));                         
                         img(i).PsnrGblurInt(k)=psnr(double(rgb2gray(img(i).Img)),double(rgb2gray(uint8(temp3))));                         
                         img(i).MseGblurInt(k)=mse(double(rgb2gray(img(i).Img)),double(rgb2gray(uint8(temp3))));                         
                         img(i).CwssimGblurInt(k)=cwssim_index(double(rgb2gray(img(i).Img)),double(rgb2gray(uint8(temp3))),6,16,0,0);
                         img(i).MsssimGblurInt(k)=msssim(double(rgb2gray(img(i).Img)),double(rgb2gray(uint8(temp3))));                    
                         [img(i).IwssimGblurInt(k), img(i).IwpsnrGblurInt(k) ]=iwssim(double(rgb2gray(img(i).Img)),double(rgb2gray(uint8(temp3)))); 
                         img(i).ColDistGblurInt(k)=colDistV2(img(i).Img,uint8(temp3),sc);            
                          
                         
                         img(i).SsimGblur(k)=ssim(double(rgb2gray(img(i).Img)),double(rgb2gray(uint8(img(i).ImgGblur(:,:,:,k)))));                         
                         img(i).PsnrGblur(k)=psnr(double(rgb2gray(img(i).Img)),double(rgb2gray(uint8(img(i).ImgGblur(:,:,:,k)))));                        
                         img(i).MseGblur(k)=mse(double(rgb2gray(img(i).Img)),double(rgb2gray(uint8(img(i).ImgGblur(:,:,:,k)))));                         
                         img(i).CwssimGblur(k)=cwssim_index(double(rgb2gray(img(i).Img)),double(rgb2gray(uint8(img(i).ImgGblur(:,:,:,k)))),6,16,0,0);
                         img(i).MsssimGblur(k)=msssim(double(rgb2gray(img(i).Img)),double(rgb2gray(uint8(img(i).ImgGblur(:,:,:,k)))));                    
                         [img(i).IwssimGblur(k), img(i).IwpsnrGblur(k) ]=iwssim(double(rgb2gray(img(i).Img)),double(rgb2gray(uint8(img(i).ImgGblur(:,:,:,k)))));                          
                         img(i).ColDistGblur(k)=colDistV2(img(i).Img,uint8(img(i).ImgGblur(:,:,:,k)),sc);                            
            
            k=k+1;
        end        
    end
 fclose(fid);

  
  
  
  %%  3- Extract jp2k data
  z=3;
  offset=0;    
fid=fopen([imgDirJp2k,'info.txt']);
[list, ~]=textscan(fid,'%s');
    jLen=length(list{1,1});
    k=1;
    for j=1:jLen 
        if (strcmp(list{1,1}{j,1},refFiles(i).name))
            img(i).ImgJp2k(:,:,:,k)=imread([imgDirJp2k,list{1,1}{j+1,1}]);
            img(i).ParamJp2k(k)=str2double(list{1,1}{j+2,1});
            temp=rgb2ycbcr(imread([imgDirJp2k,list{1,1}{j+1,1}]));  
            tt=list{1,1}{j+1,1};
           img(i).Dmos(z,k)=dmos(str2double(tt(4:end-4))+offset);
           img(i).DmosFlag(z,k)=orgs(str2double(tt(4:end-4))+offset);
            
            
            temp2(:,:,1)=img(i).ImgYcbcr(:,:,1);
            temp2(:,:,2)=temp(:,:,2);
            temp2(:,:,3)=temp(:,:,3);                        
            img(i).ImgJp2kCol(:,:,:,k)=ycbcr2rgb(temp2);
            temp3=img(i).ImgJp2kCol(:,:,:,k);   
            
                         img(i).SsimJp2kColor(k)=ssim(double(rgb2gray(img(i).Img)),double(rgb2gray(uint8(temp3))));                         
                         img(i).PsnrJp2kColor(k)=psnr(double(rgb2gray(img(i).Img)),double(rgb2gray(uint8(temp3))));                         
                         img(i).MseJp2kColor(k)=mse(double(rgb2gray(img(i).Img)),double(rgb2gray(uint8(temp3))));                         
                         img(i).CwssimJp2kColor(k)=cwssim_index(double(rgb2gray(img(i).Img)),double(rgb2gray(uint8(temp3))),6,16,0,0);
                         img(i).MsssimJp2kColor(k)=msssim(double(rgb2gray(img(i).Img)),double(rgb2gray(uint8(temp3))));                    
                         [img(i).IwssimJp2kColor(k), img(i).IwpsnrJp2kColor(k) ]=iwssim(double(rgb2gray(img(i).Img)),double(rgb2gray(uint8(temp3))));  
                         img(i).ColDistJp2kColor(k)=colDistV2(img(i).Img,uint8(temp3),sc);
                           
            temp2(:,:,1)=temp(:,:,1);
            temp2(:,:,2)=img(i).ImgYcbcr(:,:,2);
            temp2(:,:,3)=img(i).ImgYcbcr(:,:,3);                        
            img(i).ImgJp2kInt(:,:,:,k)=ycbcr2rgb(temp2);
            temp3=img(i).ImgJp2kInt(:,:,:,k);                                 
                         
            
            
                         img(i).SsimJp2kInt(k)=ssim(double(rgb2gray(img(i).Img)),double(rgb2gray(uint8(temp3))));                         
                         img(i).PsnrJp2kInt(k)=psnr(double(rgb2gray(img(i).Img)),double(rgb2gray(uint8(temp3))));                         
                         img(i).MseJp2kInt(k)=mse(double(rgb2gray(img(i).Img)),double(rgb2gray(uint8(temp3))));                         
                         img(i).CwssimJp2kInt(k)=cwssim_index(double(rgb2gray(img(i).Img)),double(rgb2gray(uint8(temp3))),6,16,0,0);
                         img(i).MsssimJp2kInt(k)=msssim(double(rgb2gray(img(i).Img)),double(rgb2gray(uint8(temp3))));                    
                         [img(i).IwssimJp2kInt(k), img(i).IwpsnrJp2kInt(k) ]=iwssim(double(rgb2gray(img(i).Img)),double(rgb2gray(uint8(temp3)))); 
                         img(i).ColDistJp2kInt(k)=colDistV2(img(i).Img,uint8(temp3),sc);            
                          
                         
                         img(i).SsimJp2k(k)=ssim(double(rgb2gray(img(i).Img)),double(rgb2gray(uint8(img(i).ImgJp2k(:,:,:,k)))));                         
                         img(i).PsnrJp2k(k)=psnr(double(rgb2gray(img(i).Img)),double(rgb2gray(uint8(img(i).ImgJp2k(:,:,:,k)))));                        
                         img(i).MseJp2k(k)=mse(double(rgb2gray(img(i).Img)),double(rgb2gray(uint8(img(i).ImgJp2k(:,:,:,k)))));                         
                         img(i).CwssimJp2k(k)=cwssim_index(double(rgb2gray(img(i).Img)),double(rgb2gray(uint8(img(i).ImgJp2k(:,:,:,k)))),6,16,0,0);
                         img(i).MsssimJp2k(k)=msssim(double(rgb2gray(img(i).Img)),double(rgb2gray(uint8(img(i).ImgJp2k(:,:,:,k)))));                    
                         [img(i).IwssimJp2k(k), img(i).IwpsnrJp2k(k) ]=iwssim(double(rgb2gray(img(i).Img)),double(rgb2gray(uint8(img(i).ImgJp2k(:,:,:,k)))));                          
                         img(i).ColDistJp2k(k)=colDistV2(img(i).Img,uint8(img(i).ImgJp2k(:,:,:,k)),sc);                            
            
            k=k+1;
        end        
    end
 fclose(fid);


  %%  4- Extract jpeg data
    z=4;
  offset=227;    
fid=fopen([imgDirJpeg,'info.txt']);
[list, ~]=textscan(fid,'%s');
    jLen=length(list{1,1});
    k=1;
    for j=1:jLen 
        if (strcmp(list{1,1}{j,1},refFiles(i).name))
            img(i).ImgJpeg(:,:,:,k)=imread([imgDirJpeg,list{1,1}{j+1,1}]);
            img(i).ParamJpeg(k)=str2double(list{1,1}{j+2,1});
            temp=rgb2ycbcr(imread([imgDirJpeg,list{1,1}{j+1,1}]));  
            tt=list{1,1}{j+1,1};
           img(i).Dmos(z,k)=dmos(str2double(tt(4:end-4))+offset);
           img(i).DmosFlag(z,k)=orgs(str2double(tt(4:end-4))+offset);
            
            
            temp2(:,:,1)=img(i).ImgYcbcr(:,:,1);
            temp2(:,:,2)=temp(:,:,2);
            temp2(:,:,3)=temp(:,:,3);                        
            img(i).ImgJpegCol(:,:,:,k)=ycbcr2rgb(temp2);
            temp3=img(i).ImgJpegCol(:,:,:,k);   
            
                         img(i).SsimJpegColor(k)=ssim(double(rgb2gray(img(i).Img)),double(rgb2gray(uint8(temp3))));                         
                         img(i).PsnrJpegColor(k)=psnr(double(rgb2gray(img(i).Img)),double(rgb2gray(uint8(temp3))));                         
                         img(i).MseJpegColor(k)=mse(double(rgb2gray(img(i).Img)),double(rgb2gray(uint8(temp3))));                         
                         img(i).CwssimJpegColor(k)=cwssim_index(double(rgb2gray(img(i).Img)),double(rgb2gray(uint8(temp3))),6,16,0,0);
                         img(i).MsssimJpegColor(k)=msssim(double(rgb2gray(img(i).Img)),double(rgb2gray(uint8(temp3))));                    
                         [img(i).IwssimJpegColor(k), img(i).IwpsnrJpegColor(k) ]=iwssim(double(rgb2gray(img(i).Img)),double(rgb2gray(uint8(temp3))));  
                         img(i).ColDistJpegColor(k)=colDistV2(img(i).Img,uint8(temp3),sc);
                           
            temp2(:,:,1)=temp(:,:,1);
            temp2(:,:,2)=img(i).ImgYcbcr(:,:,2);
            temp2(:,:,3)=img(i).ImgYcbcr(:,:,3);                        
            img(i).ImgJpegInt(:,:,:,k)=ycbcr2rgb(temp2);
            temp3=img(i).ImgJpegInt(:,:,:,k);                                 
                         
            
            
                         img(i).SsimJpegInt(k)=ssim(double(rgb2gray(img(i).Img)),double(rgb2gray(uint8(temp3))));                         
                         img(i).PsnrJpegInt(k)=psnr(double(rgb2gray(img(i).Img)),double(rgb2gray(uint8(temp3))));                         
                         img(i).MseJpegInt(k)=mse(double(rgb2gray(img(i).Img)),double(rgb2gray(uint8(temp3))));                         
                         img(i).CwssimJpegInt(k)=cwssim_index(double(rgb2gray(img(i).Img)),double(rgb2gray(uint8(temp3))),6,16,0,0);
                         img(i).MsssimJpegInt(k)=msssim(double(rgb2gray(img(i).Img)),double(rgb2gray(uint8(temp3))));                    
                         [img(i).IwssimJpegInt(k), img(i).IwpsnrJpegInt(k) ]=iwssim(double(rgb2gray(img(i).Img)),double(rgb2gray(uint8(temp3)))); 
                         img(i).ColDistJpegInt(k)=colDistV2(img(i).Img,uint8(temp3),sc);            
                          
                         
                         img(i).SsimJpeg(k)=ssim(double(rgb2gray(img(i).Img)),double(rgb2gray(uint8(img(i).ImgJpeg(:,:,:,k)))));                         
                         img(i).PsnrJpeg(k)=psnr(double(rgb2gray(img(i).Img)),double(rgb2gray(uint8(img(i).ImgJpeg(:,:,:,k)))));                        
                         img(i).MseJpeg(k)=mse(double(rgb2gray(img(i).Img)),double(rgb2gray(uint8(img(i).ImgJpeg(:,:,:,k)))));                         
                         img(i).CwssimJpeg(k)=cwssim_index(double(rgb2gray(img(i).Img)),double(rgb2gray(uint8(img(i).ImgJpeg(:,:,:,k)))),6,16,0,0);
                         img(i).MsssimJpeg(k)=msssim(double(rgb2gray(img(i).Img)),double(rgb2gray(uint8(img(i).ImgJpeg(:,:,:,k)))));                    
                         [img(i).IwssimJpeg(k), img(i).IwpsnrJpeg(k) ]=iwssim(double(rgb2gray(img(i).Img)),double(rgb2gray(uint8(img(i).ImgJpeg(:,:,:,k)))));                          
                         img(i).ColDistJpeg(k)=colDistV2(img(i).Img,uint8(img(i).ImgJpeg(:,:,:,k)),sc);                            
            
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
            temp=rgb2ycbcr(imread([imgDirWn,list{1,1}{j+1,1}]));  
            tt=list{1,1}{j+1,1};
           img(i).Dmos(z,k)=dmos(str2double(tt(4:end-4))+offset);
           img(i).DmosFlag(z,k)=orgs(str2double(tt(4:end-4))+offset);
            
            
            temp2(:,:,1)=img(i).ImgYcbcr(:,:,1);
            temp2(:,:,2)=temp(:,:,2);
            temp2(:,:,3)=temp(:,:,3);                        
            img(i).ImgWnCol(:,:,:,k)=ycbcr2rgb(temp2);
            temp3=img(i).ImgWnCol(:,:,:,k);   
            
                         img(i).SsimWnColor(k)=ssim(double(rgb2gray(img(i).Img)),double(rgb2gray(uint8(temp3))));                         
                         img(i).PsnrWnColor(k)=psnr(double(rgb2gray(img(i).Img)),double(rgb2gray(uint8(temp3))));                         
                         img(i).MseWnColor(k)=mse(double(rgb2gray(img(i).Img)),double(rgb2gray(uint8(temp3))));                         
                         img(i).CwssimWnColor(k)=cwssim_index(double(rgb2gray(img(i).Img)),double(rgb2gray(uint8(temp3))),6,16,0,0);
                         img(i).MsssimWnColor(k)=msssim(double(rgb2gray(img(i).Img)),double(rgb2gray(uint8(temp3))));                    
                         [img(i).IwssimWnColor(k), img(i).IwpsnrWnColor(k) ]=iwssim(double(rgb2gray(img(i).Img)),double(rgb2gray(uint8(temp3))));  
                         img(i).ColDistWnColor(k)=colDistV2(img(i).Img,uint8(temp3),sc);
                           
            temp2(:,:,1)=temp(:,:,1);
            temp2(:,:,2)=img(i).ImgYcbcr(:,:,2);
            temp2(:,:,3)=img(i).ImgYcbcr(:,:,3);                        
            img(i).ImgWnInt(:,:,:,k)=ycbcr2rgb(temp2);
            temp3=img(i).ImgWnInt(:,:,:,k);                                 
                         
            
            
                         img(i).SsimWnInt(k)=ssim(double(rgb2gray(img(i).Img)),double(rgb2gray(uint8(temp3))));                         
                         img(i).PsnrWnInt(k)=psnr(double(rgb2gray(img(i).Img)),double(rgb2gray(uint8(temp3))));                         
                         img(i).MseWnInt(k)=mse(double(rgb2gray(img(i).Img)),double(rgb2gray(uint8(temp3))));                         
                         img(i).CwssimWnInt(k)=cwssim_index(double(rgb2gray(img(i).Img)),double(rgb2gray(uint8(temp3))),6,16,0,0);
                         img(i).MsssimWnInt(k)=msssim(double(rgb2gray(img(i).Img)),double(rgb2gray(uint8(temp3))));                    
                         [img(i).IwssimWnInt(k), img(i).IwpsnrWnInt(k) ]=iwssim(double(rgb2gray(img(i).Img)),double(rgb2gray(uint8(temp3)))); 
                         img(i).ColDistWnInt(k)=colDistV2(img(i).Img,uint8(temp3),sc);            
                          
                         
                         img(i).SsimWn(k)=ssim(double(rgb2gray(img(i).Img)),double(rgb2gray(uint8(img(i).ImgWn(:,:,:,k)))));                         
                         img(i).PsnrWn(k)=psnr(double(rgb2gray(img(i).Img)),double(rgb2gray(uint8(img(i).ImgWn(:,:,:,k)))));                        
                         img(i).MseWn(k)=mse(double(rgb2gray(img(i).Img)),double(rgb2gray(uint8(img(i).ImgWn(:,:,:,k)))));                         
                         img(i).CwssimWn(k)=cwssim_index(double(rgb2gray(img(i).Img)),double(rgb2gray(uint8(img(i).ImgWn(:,:,:,k)))),6,16,0,0);
                         img(i).MsssimWn(k)=msssim(double(rgb2gray(img(i).Img)),double(rgb2gray(uint8(img(i).ImgWn(:,:,:,k)))));                    
                         [img(i).IwssimWn(k), img(i).IwpsnrWn(k) ]=iwssim(double(rgb2gray(img(i).Img)),double(rgb2gray(uint8(img(i).ImgWn(:,:,:,k)))));                          
                         img(i).ColDistWn(k)=colDistV2(img(i).Img,uint8(img(i).ImgWn(:,:,:,k)),sc);                            
            
            k=k+1;
        end        
    end
 fclose(fid);
 
 %%
  
 fprintf(repmat('\b',1,nl)); fprintf('Counter:%d/%d',i,len);nl=length(['Counter:',num2str(i),'/',num2str(len)]);   

end

toc
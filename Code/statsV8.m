%Configuration selection
%Initialize s1 and s2

%s1 and s2 configures the elements of the objective quality vector.
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
%Output directory
mkdir([cd,'\RESULTS']);
outData=['\RESULTS\',num2str(clock)];
outDataDir=[cd,outData];
mkdir(outDataDir);

for i=1:len  
        
lenJpeg=size(img(i).ParamJpeg,2);
[param, paramOrder]=sort(img(i).ParamJpeg);

dmosInd=4;
        for j=1:lenJpeg 
        tempJpegDmos{i}(j)=img(i).Dmos(dmosInd,paramOrder(j));
        JpegDmosFlag{i}(j)=img(i).DmosFlag(dmosInd,paramOrder(j));
        n=1;
        tempJpegMse{i}(j,n)=img(i). MseJpeg(paramOrder(j));
        tempJpegSsim{i}(j,n)=img(i). SsimJpeg(paramOrder(j));
        tempJpegCwssim{i}(j,n)=img(i). CwssimJpeg(paramOrder(j));
        tempJpegMsssim{i}(j,n)=img(i). MsssimJpeg(paramOrder(j));
        tempJpegIwssim{i}(j,n)=img(i). IwssimJpeg(paramOrder(j));
        tempJpegIwpsnr{i}(j,n)=img(i). IwpsnrJpeg(paramOrder(j));
        tempJpegColDist{i}(j,n)=img(i). ColDistJpeg(paramOrder(j));
        n=2;
        tempJpegMse{i}(j,n)=img(i). MseJpegInt(paramOrder(j));
        tempJpegSsim{i}(j,n)=img(i). SsimJpegInt(paramOrder(j));
        tempJpegCwssim{i}(j,n)=img(i). CwssimJpegInt(paramOrder(j));
        tempJpegMsssim{i}(j,n)=img(i). MsssimJpegInt(paramOrder(j));
        tempJpegIwssim{i}(j,n)=img(i). IwssimJpegInt(paramOrder(j));
        tempJpegIwpsnr{i}(j,n)=img(i). IwpsnrJpegInt(paramOrder(j));   
        tempJpegColDist{i}(j,n)=img(i). ColDistJpegInt(paramOrder(j));
        n=3;
        tempJpegMse{i}(j,n)=img(i). MseJpegColor(paramOrder(j));
        tempJpegSsim{i}(j,n)=img(i). SsimJpegColor(paramOrder(j));
        tempJpegCwssim{i}(j,n)=img(i). CwssimJpegColor(paramOrder(j));
        tempJpegMsssim{i}(j,n)=img(i). MsssimJpegColor(paramOrder(j));
        tempJpegIwssim{i}(j,n)=img(i). IwssimJpegColor(paramOrder(j));
        tempJpegIwpsnr{i}(j,n)=img(i). IwpsnrJpegColor(paramOrder(j));     
        tempJpegColDist{i}(j,n)=img(i). ColDistJpegColor(paramOrder(j));
             
        
        end      

            for n=1:3
                tempJpegSsim{i}(:,n)=difVal+mult*tempJpegSsim{i}(:,n);
                tempJpegCwssim{i}(:,n)=difVal+mult*tempJpegCwssim{i}(:,n);
                tempJpegMsssim{i}(:,n)=difVal+mult*tempJpegMsssim{i}(:,n);
                tempJpegIwssim{i}(:,n)=difVal+mult*tempJpegIwssim{i}(:,n);
                tempJpegIwpsnr{i}(:,n)=difVal+mult*tempJpegIwpsnr{i}(:,n);    
                tempJpegColDist{i}(:,n)=difVal+mult*tempJpegColDist{i}(:,n);
            end
        
end


JpegMseFull=zeros(1,1);
JpegSsimFull=zeros(1,1);
JpegCwssimFull=zeros(1,1);
JpegMsssimFull=zeros(1,1);
JpegIwssimFull=zeros(1,1);
JpegIwpsnrFull=zeros(1,1);
JpegColDistFull=zeros(1,1);
n=1;
for p=1:len
JpegMseFull=horzcat(JpegMseFull,tempJpegMse{p}(:,n)');
JpegSsimFull=horzcat(JpegSsimFull,tempJpegSsim{p}(:,n)');
JpegCwssimFull=horzcat(JpegCwssimFull,tempJpegCwssim{p}(:,n)');
JpegMsssimFull=horzcat(JpegMsssimFull,tempJpegMsssim{p}(:,n)');
JpegIwssimFull=horzcat(JpegIwssimFull,tempJpegIwssim{p}(:,n)');
JpegIwpsnrFull=horzcat(JpegIwpsnrFull,tempJpegIwpsnr{p}(:,n)');
JpegColDistFull=horzcat(JpegColDistFull,tempJpegColDist{p}(:,n)');
end


       if (s2==1)
          JpegMseFull=JpegMseFull/max(JpegMseFull);
            JpegSsimFull=JpegSsimFull/max(JpegSsimFull);
            JpegCwssimFull=JpegCwssimFull/max(JpegCwssimFull);
            JpegMsssimFull=JpegMsssimFull/max(JpegMsssimFull);
            JpegIwssimFull=JpegIwssimFull/max(JpegIwssimFull);
            JpegIwpsnrFull=JpegIwpsnrFull/max(JpegIwpsnrFull);
            JpegColDistFull=JpegColDistFull/max(JpegColDistFull);           
       end





JpegMseFull=JpegMseFull(2:end);
JpegSsimFull=JpegSsimFull(2:end);
JpegCwssimFull=JpegCwssimFull(2:end);
JpegMsssimFull=JpegMsssimFull(2:end);
JpegIwssimFull=JpegIwssimFull(2:end);
JpegIwpsnrFull=JpegIwpsnrFull(2:end);
JpegColDistFull=JpegColDistFull(2:end);




JpegMseInt=zeros(1,1);
JpegSsimInt=zeros(1,1);
JpegCwssimInt=zeros(1,1);
JpegMsssimInt=zeros(1,1);
JpegIwssimInt=zeros(1,1);
JpegIwpsnrInt=zeros(1,1);
JpegColDistInt=zeros(1,1);

n=2;
for p=1:len
JpegMseInt=horzcat(JpegMseInt,tempJpegMse{p}(:,n)');
JpegSsimInt=horzcat(JpegSsimInt,tempJpegSsim{p}(:,n)');
JpegCwssimInt=horzcat(JpegCwssimInt,tempJpegCwssim{p}(:,n)');
JpegMsssimInt=horzcat(JpegMsssimInt,tempJpegMsssim{p}(:,n)');
JpegIwssimInt=horzcat(JpegIwssimInt,tempJpegIwssim{p}(:,n)');
JpegIwpsnrInt=horzcat(JpegIwpsnrInt,tempJpegIwpsnr{p}(:,n)');
JpegColDistInt=horzcat(JpegColDistInt,tempJpegColDist{p}(:,n)');
end

       if (s2==1)
JpegMseInt=JpegMseInt/max(JpegMseInt);
JpegSsimInt=JpegSsimInt/max(JpegSsimInt);
JpegCwssimInt=JpegCwssimInt/max(JpegCwssimInt);
JpegMsssimInt=JpegMsssimInt/max(JpegMsssimInt);
JpegIwssimInt=JpegIwssimInt/max(JpegIwssimInt);
JpegIwpsnrInt=JpegIwpsnrInt/max(JpegIwpsnrInt);
JpegColDistInt=JpegColDistInt/max(JpegColDistInt);
       end


JpegMseInt=JpegMseInt(2:end);
JpegSsimInt=JpegSsimInt(2:end);
JpegCwssimInt=JpegCwssimInt(2:end);
JpegMsssimInt=JpegMsssimInt(2:end);
JpegIwssimInt=JpegIwssimInt(2:end);
JpegIwpsnrInt=JpegIwpsnrInt(2:end);
JpegColDistInt=JpegColDistInt(2:end);



JpegMseColor=zeros(1,1);
JpegSsimColor=zeros(1,1);
JpegCwssimColor=zeros(1,1);
JpegMsssimColor=zeros(1,1);
JpegIwssimColor=zeros(1,1);
JpegIwpsnrColor=zeros(1,1);
JpegColDistColor=zeros(1,1);
n=3;
for p=1:len
JpegMseColor=horzcat(JpegMseColor,tempJpegMse{p}(:,n)');
JpegSsimColor=horzcat(JpegSsimColor,tempJpegSsim{p}(:,n)');
JpegCwssimColor=horzcat(JpegCwssimColor,tempJpegCwssim{p}(:,n)');
JpegMsssimColor=horzcat(JpegMsssimColor,tempJpegMsssim{p}(:,n)');
JpegIwssimColor=horzcat(JpegIwssimColor,tempJpegIwssim{p}(:,n)');
JpegIwpsnrColor=horzcat(JpegIwpsnrColor,tempJpegIwpsnr{p}(:,n)');
JpegColDistColor=horzcat(JpegColDistColor,tempJpegColDist{p}(:,n)');
end

       if (s2==1)
JpegMseColor=JpegMseColor/max(JpegMseColor);
JpegSsimColor=JpegSsimColor/max(JpegSsimColor);
JpegCwssimColor=JpegCwssimColor/max(JpegCwssimColor);
JpegMsssimColor=JpegMsssimColor/max(JpegMsssimColor);
JpegIwssimColor=JpegIwssimColor/max(JpegIwssimColor);
JpegIwpsnrColor=JpegIwpsnrColor/max(JpegIwpsnrColor);
JpegColDistColor=JpegColDistColor/max(JpegColDistColor);
       end


JpegMseColor=JpegMseColor(2:end);
JpegSsimColor=JpegSsimColor(2:end);
JpegCwssimColor=JpegCwssimColor(2:end);
JpegMsssimColor=JpegMsssimColor(2:end);
JpegIwssimColor=JpegIwssimColor(2:end);
JpegIwpsnrColor=JpegIwpsnrColor(2:end);
JpegColDistColor=JpegColDistColor(2:end);


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
        tempJp2kMse{i}(j,n)=img(i). MseJp2k(paramOrder(j));
        tempJp2kSsim{i}(j,n)=img(i). SsimJp2k(paramOrder(j));
        tempJp2kCwssim{i}(j,n)=img(i). CwssimJp2k(paramOrder(j));
        tempJp2kMsssim{i}(j,n)=img(i). MsssimJp2k(paramOrder(j));
        tempJp2kIwssim{i}(j,n)=img(i). IwssimJp2k(paramOrder(j));
        tempJp2kIwpsnr{i}(j,n)=img(i). IwpsnrJp2k(paramOrder(j));
        tempJp2kColDist{i}(j,n)=img(i). ColDistJp2k(paramOrder(j));
        n=2;
        tempJp2kMse{i}(j,n)=img(i). MseJp2kInt(paramOrder(j));
        tempJp2kSsim{i}(j,n)=img(i). SsimJp2kInt(paramOrder(j));
        tempJp2kCwssim{i}(j,n)=img(i). CwssimJp2kInt(paramOrder(j));
        tempJp2kMsssim{i}(j,n)=img(i). MsssimJp2kInt(paramOrder(j));
        tempJp2kIwssim{i}(j,n)=img(i). IwssimJp2kInt(paramOrder(j));
        tempJp2kIwpsnr{i}(j,n)=img(i). IwpsnrJp2kInt(paramOrder(j));   
        tempJp2kColDist{i}(j,n)=img(i). ColDistJp2kInt(paramOrder(j));
        n=3;
        tempJp2kMse{i}(j,n)=img(i). MseJp2kColor(paramOrder(j));
        tempJp2kSsim{i}(j,n)=img(i). SsimJp2kColor(paramOrder(j));
        tempJp2kCwssim{i}(j,n)=img(i). CwssimJp2kColor(paramOrder(j));
        tempJp2kMsssim{i}(j,n)=img(i). MsssimJp2kColor(paramOrder(j));
        tempJp2kIwssim{i}(j,n)=img(i). IwssimJp2kColor(paramOrder(j));
        tempJp2kIwpsnr{i}(j,n)=img(i). IwpsnrJp2kColor(paramOrder(j));     
        tempJp2kColDist{i}(j,n)=img(i). ColDistJp2kColor(paramOrder(j));
             
        
        end      
       
            for n=1:3
                tempJp2kSsim{i}(:,n)=difVal+mult*tempJp2kSsim{i}(:,n);
                tempJp2kCwssim{i}(:,n)=difVal+mult*tempJp2kCwssim{i}(:,n);
                tempJp2kMsssim{i}(:,n)=difVal+mult*tempJp2kMsssim{i}(:,n);
                tempJp2kIwssim{i}(:,n)=difVal+mult*tempJp2kIwssim{i}(:,n);
                tempJp2kIwpsnr{i}(:,n)=difVal+mult*tempJp2kIwpsnr{i}(:,n);    
                tempJp2kColDist{i}(:,n)=difVal+mult*tempJp2kColDist{i}(:,n);
            end
        
end


Jp2kMseFull=zeros(1,1);
Jp2kSsimFull=zeros(1,1);
Jp2kCwssimFull=zeros(1,1);
Jp2kMsssimFull=zeros(1,1);
Jp2kIwssimFull=zeros(1,1);
Jp2kIwpsnrFull=zeros(1,1);
Jp2kColDistFull=zeros(1,1);
n=1;
for p=1:len
Jp2kMseFull=horzcat(Jp2kMseFull,tempJp2kMse{p}(:,n)');
Jp2kSsimFull=horzcat(Jp2kSsimFull,tempJp2kSsim{p}(:,n)');
Jp2kCwssimFull=horzcat(Jp2kCwssimFull,tempJp2kCwssim{p}(:,n)');
Jp2kMsssimFull=horzcat(Jp2kMsssimFull,tempJp2kMsssim{p}(:,n)');
Jp2kIwssimFull=horzcat(Jp2kIwssimFull,tempJp2kIwssim{p}(:,n)');
Jp2kIwpsnrFull=horzcat(Jp2kIwpsnrFull,tempJp2kIwpsnr{p}(:,n)');
Jp2kColDistFull=horzcat(Jp2kColDistFull,tempJp2kColDist{p}(:,n)');
end


       if (s2==1)
Jp2kMseFull=Jp2kMseFull/max(Jp2kMseFull);
Jp2kSsimFull=Jp2kSsimFull/max(Jp2kSsimFull);
Jp2kCwssimFull=Jp2kCwssimFull/max(Jp2kCwssimFull);
Jp2kMsssimFull=Jp2kMsssimFull/max(Jp2kMsssimFull);
Jp2kIwssimFull=Jp2kIwssimFull/max(Jp2kIwssimFull);
Jp2kIwpsnrFull=Jp2kIwpsnrFull/max(Jp2kIwpsnrFull);
Jp2kColDistFull=Jp2kColDistFull/max(Jp2kColDistFull);
       end


Jp2kMseFull=Jp2kMseFull(2:end);
Jp2kSsimFull=Jp2kSsimFull(2:end);
Jp2kCwssimFull=Jp2kCwssimFull(2:end);
Jp2kMsssimFull=Jp2kMsssimFull(2:end);
Jp2kIwssimFull=Jp2kIwssimFull(2:end);
Jp2kIwpsnrFull=Jp2kIwpsnrFull(2:end);
Jp2kColDistFull=Jp2kColDistFull(2:end);


Jp2kMseInt=zeros(1,1);
Jp2kSsimInt=zeros(1,1);
Jp2kCwssimInt=zeros(1,1);
Jp2kMsssimInt=zeros(1,1);
Jp2kIwssimInt=zeros(1,1);
Jp2kIwpsnrInt=zeros(1,1);
Jp2kColDistInt=zeros(1,1);

n=2;
for p=1:len
Jp2kMseInt=horzcat(Jp2kMseInt,tempJp2kMse{p}(:,n)');
Jp2kSsimInt=horzcat(Jp2kSsimInt,tempJp2kSsim{p}(:,n)');
Jp2kCwssimInt=horzcat(Jp2kCwssimInt,tempJp2kCwssim{p}(:,n)');
Jp2kMsssimInt=horzcat(Jp2kMsssimInt,tempJp2kMsssim{p}(:,n)');
Jp2kIwssimInt=horzcat(Jp2kIwssimInt,tempJp2kIwssim{p}(:,n)');
Jp2kIwpsnrInt=horzcat(Jp2kIwpsnrInt,tempJp2kIwpsnr{p}(:,n)');
Jp2kColDistInt=horzcat(Jp2kColDistInt,tempJp2kColDist{p}(:,n)');
end

       if (s2==1)
Jp2kMseInt=Jp2kMseInt/max(Jp2kMseInt);
Jp2kSsimInt=Jp2kSsimInt/max(Jp2kSsimInt);
Jp2kCwssimInt=Jp2kCwssimInt/max(Jp2kCwssimInt);
Jp2kMsssimInt=Jp2kMsssimInt/max(Jp2kMsssimInt);
Jp2kIwssimInt=Jp2kIwssimInt/max(Jp2kIwssimInt);
Jp2kIwpsnrInt=Jp2kIwpsnrInt/max(Jp2kIwpsnrInt);
Jp2kColDistInt=Jp2kColDistInt/max(Jp2kColDistInt);
       end

Jp2kMseInt=Jp2kMseInt(2:end);
Jp2kSsimInt=Jp2kSsimInt(2:end);
Jp2kCwssimInt=Jp2kCwssimInt(2:end);
Jp2kMsssimInt=Jp2kMsssimInt(2:end);
Jp2kIwssimInt=Jp2kIwssimInt(2:end);
Jp2kIwpsnrInt=Jp2kIwpsnrInt(2:end);
Jp2kColDistInt=Jp2kColDistInt(2:end);




Jp2kMseColor=zeros(1,1);
Jp2kSsimColor=zeros(1,1);
Jp2kCwssimColor=zeros(1,1);
Jp2kMsssimColor=zeros(1,1);
Jp2kIwssimColor=zeros(1,1);
Jp2kIwpsnrColor=zeros(1,1);
Jp2kColDistColor=zeros(1,1);
n=3;
for p=1:len
Jp2kMseColor=horzcat(Jp2kMseColor,tempJp2kMse{p}(:,n)');
Jp2kSsimColor=horzcat(Jp2kSsimColor,tempJp2kSsim{p}(:,n)');
Jp2kCwssimColor=horzcat(Jp2kCwssimColor,tempJp2kCwssim{p}(:,n)');
Jp2kMsssimColor=horzcat(Jp2kMsssimColor,tempJp2kMsssim{p}(:,n)');
Jp2kIwssimColor=horzcat(Jp2kIwssimColor,tempJp2kIwssim{p}(:,n)');
Jp2kIwpsnrColor=horzcat(Jp2kIwpsnrColor,tempJp2kIwpsnr{p}(:,n)');
Jp2kColDistColor=horzcat(Jp2kColDistColor,tempJp2kColDist{p}(:,n)');
end


       if (s2==1)
Jp2kMseColor=Jp2kMseColor/max(Jp2kMseColor);
Jp2kSsimColor=Jp2kSsimColor/max(Jp2kSsimColor);
Jp2kCwssimColor=Jp2kCwssimColor/max(Jp2kCwssimColor);
Jp2kMsssimColor=Jp2kMsssimColor/max(Jp2kMsssimColor);
Jp2kIwssimColor=Jp2kIwssimColor/max(Jp2kIwssimColor);
Jp2kIwpsnrColor=Jp2kIwpsnrColor/max(Jp2kIwpsnrColor);
Jp2kColDistColor=Jp2kColDistColor/max(Jp2kColDistColor);
       end


Jp2kMseColor=Jp2kMseColor(2:end);
Jp2kSsimColor=Jp2kSsimColor(2:end);
Jp2kCwssimColor=Jp2kCwssimColor(2:end);
Jp2kMsssimColor=Jp2kMsssimColor(2:end);
Jp2kIwssimColor=Jp2kIwssimColor(2:end);
Jp2kIwpsnrColor=Jp2kIwpsnrColor(2:end);
Jp2kColDistColor=Jp2kColDistColor(2:end);




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
        tempWnMse{i}(j,n)=img(i). MseWn(paramOrder(j));
        tempWnSsim{i}(j,n)=img(i). SsimWn(paramOrder(j));
        tempWnCwssim{i}(j,n)=img(i). CwssimWn(paramOrder(j));
        tempWnMsssim{i}(j,n)=img(i). MsssimWn(paramOrder(j));
        tempWnIwssim{i}(j,n)=img(i). IwssimWn(paramOrder(j));
        tempWnIwpsnr{i}(j,n)=img(i). IwpsnrWn(paramOrder(j));
        tempWnColDist{i}(j,n)=img(i). ColDistWn(paramOrder(j));
        n=2;
        tempWnMse{i}(j,n)=img(i). MseWnInt(paramOrder(j));
        tempWnSsim{i}(j,n)=img(i). SsimWnInt(paramOrder(j));
        tempWnCwssim{i}(j,n)=img(i). CwssimWnInt(paramOrder(j));
        tempWnMsssim{i}(j,n)=img(i). MsssimWnInt(paramOrder(j));
        tempWnIwssim{i}(j,n)=img(i). IwssimWnInt(paramOrder(j));
        tempWnIwpsnr{i}(j,n)=img(i). IwpsnrWnInt(paramOrder(j));   
        tempWnColDist{i}(j,n)=img(i). ColDistWnInt(paramOrder(j));
        n=3;
        tempWnMse{i}(j,n)=img(i). MseWnColor(paramOrder(j));
        tempWnSsim{i}(j,n)=img(i). SsimWnColor(paramOrder(j));
        tempWnCwssim{i}(j,n)=img(i). CwssimWnColor(paramOrder(j));
        tempWnMsssim{i}(j,n)=img(i). MsssimWnColor(paramOrder(j));
        tempWnIwssim{i}(j,n)=img(i). IwssimWnColor(paramOrder(j));
        tempWnIwpsnr{i}(j,n)=img(i). IwpsnrWnColor(paramOrder(j));     
        tempWnColDist{i}(j,n)=img(i). ColDistWnColor(paramOrder(j));
             
        
        end      
       
            for n=1:3
                tempWnSsim{i}(:,n)=difVal+mult*tempWnSsim{i}(:,n);
                tempWnCwssim{i}(:,n)=difVal+mult*tempWnCwssim{i}(:,n);
                tempWnMsssim{i}(:,n)=difVal+mult*tempWnMsssim{i}(:,n);
                tempWnIwssim{i}(:,n)=difVal+mult*tempWnIwssim{i}(:,n);
                tempWnIwpsnr{i}(:,n)=difVal+mult*tempWnIwpsnr{i}(:,n);    
                tempWnColDist{i}(:,n)=difVal+mult*tempWnColDist{i}(:,n);
            end
        
end


WnMseFull=zeros(1,1);
WnSsimFull=zeros(1,1);
WnCwssimFull=zeros(1,1);
WnMsssimFull=zeros(1,1);
WnIwssimFull=zeros(1,1);
WnIwpsnrFull=zeros(1,1);
WnColDistFull=zeros(1,1);
n=1;
for p=1:len
WnMseFull=horzcat(WnMseFull,tempWnMse{p}(:,n)');
WnSsimFull=horzcat(WnSsimFull,tempWnSsim{p}(:,n)');
WnCwssimFull=horzcat(WnCwssimFull,tempWnCwssim{p}(:,n)');
WnMsssimFull=horzcat(WnMsssimFull,tempWnMsssim{p}(:,n)');
WnIwssimFull=horzcat(WnIwssimFull,tempWnIwssim{p}(:,n)');
WnIwpsnrFull=horzcat(WnIwpsnrFull,tempWnIwpsnr{p}(:,n)');
WnColDistFull=horzcat(WnColDistFull,tempWnColDist{p}(:,n)');
end

       if (s2==1)
WnMseFull=WnMseFull/max(WnMseFull);
WnSsimFull=WnSsimFull/max(WnSsimFull);
WnCwssimFull=WnCwssimFull/max(WnCwssimFull);
WnMsssimFull=WnMsssimFull/max(WnMsssimFull);
WnIwssimFull=WnIwssimFull/max(WnIwssimFull);
WnIwpsnrFull=WnIwpsnrFull/max(WnIwpsnrFull);
WnColDistFull=WnColDistFull/max(WnColDistFull);
       end


WnMseFull=WnMseFull(2:end);
WnSsimFull=WnSsimFull(2:end);
WnCwssimFull=WnCwssimFull(2:end);
WnMsssimFull=WnMsssimFull(2:end);
WnIwssimFull=WnIwssimFull(2:end);
WnIwpsnrFull=WnIwpsnrFull(2:end);
WnColDistFull=WnColDistFull(2:end);






WnMseInt=zeros(1,1);
WnSsimInt=zeros(1,1);
WnCwssimInt=zeros(1,1);
WnMsssimInt=zeros(1,1);
WnIwssimInt=zeros(1,1);
WnIwpsnrInt=zeros(1,1);
WnColDistInt=zeros(1,1);

n=2;
for p=1:len
WnMseInt=horzcat(WnMseInt,tempWnMse{p}(:,n)');
WnSsimInt=horzcat(WnSsimInt,tempWnSsim{p}(:,n)');
WnCwssimInt=horzcat(WnCwssimInt,tempWnCwssim{p}(:,n)');
WnMsssimInt=horzcat(WnMsssimInt,tempWnMsssim{p}(:,n)');
WnIwssimInt=horzcat(WnIwssimInt,tempWnIwssim{p}(:,n)');
WnIwpsnrInt=horzcat(WnIwpsnrInt,tempWnIwpsnr{p}(:,n)');
WnColDistInt=horzcat(WnColDistInt,tempWnColDist{p}(:,n)');
end

       if (s2==1)
WnMseInt=WnMseInt/max(WnMseInt);
WnSsimInt=WnSsimInt/max(WnSsimInt);
WnCwssimInt=WnCwssimInt/max(WnCwssimInt);
WnMsssimInt=WnMsssimInt/max(WnMsssimInt);
WnIwssimInt=WnIwssimInt/max(WnIwssimInt);
WnIwpsnrInt=WnIwpsnrInt/max(WnIwpsnrInt);
WnColDistInt=WnColDistInt/max(WnColDistInt);
       end


WnMseInt=WnMseInt(2:end);
WnSsimInt=WnSsimInt(2:end);
WnCwssimInt=WnCwssimInt(2:end);
WnMsssimInt=WnMsssimInt(2:end);
WnIwssimInt=WnIwssimInt(2:end);
WnIwpsnrInt=WnIwpsnrInt(2:end);
WnColDistInt=WnColDistInt(2:end);


WnMseColor=zeros(1,1);
WnSsimColor=zeros(1,1);
WnCwssimColor=zeros(1,1);
WnMsssimColor=zeros(1,1);
WnIwssimColor=zeros(1,1);
WnIwpsnrColor=zeros(1,1);
WnColDistColor=zeros(1,1);
n=3;
for p=1:len
WnMseColor=horzcat(WnMseColor,tempWnMse{p}(:,n)');
WnSsimColor=horzcat(WnSsimColor,tempWnSsim{p}(:,n)');
WnCwssimColor=horzcat(WnCwssimColor,tempWnCwssim{p}(:,n)');
WnMsssimColor=horzcat(WnMsssimColor,tempWnMsssim{p}(:,n)');
WnIwssimColor=horzcat(WnIwssimColor,tempWnIwssim{p}(:,n)');
WnIwpsnrColor=horzcat(WnIwpsnrColor,tempWnIwpsnr{p}(:,n)');
WnColDistColor=horzcat(WnColDistColor,tempWnColDist{p}(:,n)');
end

       if (s2==1)
WnMseColor=WnMseColor/max(WnMseColor);
WnSsimColor=WnSsimColor/max(WnSsimColor);
WnCwssimColor=WnCwssimColor/max(WnCwssimColor);
WnMsssimColor=WnMsssimColor/max(WnMsssimColor);
WnIwssimColor=WnIwssimColor/max(WnIwssimColor);
WnIwpsnrColor=WnIwpsnrColor/max(WnIwpsnrColor);
WnColDistColor=WnColDistColor/max(WnColDistColor);
       end

WnMseColor=WnMseColor(2:end);
WnSsimColor=WnSsimColor(2:end);
WnCwssimColor=WnCwssimColor(2:end);
WnMsssimColor=WnMsssimColor(2:end);
WnIwssimColor=WnIwssimColor(2:end);
WnIwpsnrColor=WnIwpsnrColor(2:end);
WnColDistColor=WnColDistColor(2:end);




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
        tempFastfadingMse{i}(j,n)=img(i). MseFastfading(paramOrder(j));
        tempFastfadingSsim{i}(j,n)=img(i). SsimFastfading(paramOrder(j));
        tempFastfadingCwssim{i}(j,n)=img(i). CwssimFastfading(paramOrder(j));
        tempFastfadingMsssim{i}(j,n)=img(i). MsssimFastfading(paramOrder(j));
        tempFastfadingIwssim{i}(j,n)=img(i). IwssimFastfading(paramOrder(j));
        tempFastfadingIwpsnr{i}(j,n)=img(i). IwpsnrFastfading(paramOrder(j));
        tempFastfadingColDist{i}(j,n)=img(i). ColDistFastfading(paramOrder(j));
        n=2;
        tempFastfadingMse{i}(j,n)=img(i). MseFastfadingInt(paramOrder(j));
        tempFastfadingSsim{i}(j,n)=img(i). SsimFastfadingInt(paramOrder(j));
        tempFastfadingCwssim{i}(j,n)=img(i). CwssimFastfadingInt(paramOrder(j));
        tempFastfadingMsssim{i}(j,n)=img(i). MsssimFastfadingInt(paramOrder(j));
        tempFastfadingIwssim{i}(j,n)=img(i). IwssimFastfadingInt(paramOrder(j));
        tempFastfadingIwpsnr{i}(j,n)=img(i). IwpsnrFastfadingInt(paramOrder(j));   
        tempFastfadingColDist{i}(j,n)=img(i). ColDistFastfadingInt(paramOrder(j));
        n=3;
        tempFastfadingMse{i}(j,n)=img(i). MseFastfadingColor(paramOrder(j));
        tempFastfadingSsim{i}(j,n)=img(i). SsimFastfadingColor(paramOrder(j));
        tempFastfadingCwssim{i}(j,n)=img(i). CwssimFastfadingColor(paramOrder(j));
        tempFastfadingMsssim{i}(j,n)=img(i). MsssimFastfadingColor(paramOrder(j));
        tempFastfadingIwssim{i}(j,n)=img(i). IwssimFastfadingColor(paramOrder(j));
        tempFastfadingIwpsnr{i}(j,n)=img(i). IwpsnrFastfadingColor(paramOrder(j));     
        tempFastfadingColDist{i}(j,n)=img(i). ColDistFastfadingColor(paramOrder(j));
             
        
        end      
       
            for n=1:3
                tempFastfadingSsim{i}(:,n)=difVal+mult*tempFastfadingSsim{i}(:,n);
                tempFastfadingCwssim{i}(:,n)=difVal+mult*tempFastfadingCwssim{i}(:,n);
                tempFastfadingMsssim{i}(:,n)=difVal+mult*tempFastfadingMsssim{i}(:,n);
                tempFastfadingIwssim{i}(:,n)=difVal+mult*tempFastfadingIwssim{i}(:,n);
                tempFastfadingIwpsnr{i}(:,n)=difVal+mult*tempFastfadingIwpsnr{i}(:,n);    
                tempFastfadingColDist{i}(:,n)=difVal+mult*tempFastfadingColDist{i}(:,n);
            end
        
end


FastfadingMseFull=zeros(1,1);
FastfadingSsimFull=zeros(1,1);
FastfadingCwssimFull=zeros(1,1);
FastfadingMsssimFull=zeros(1,1);
FastfadingIwssimFull=zeros(1,1);
FastfadingIwpsnrFull=zeros(1,1);
FastfadingColDistFull=zeros(1,1);
n=1;
for p=1:len
FastfadingMseFull=horzcat(FastfadingMseFull,tempFastfadingMse{p}(:,n)');
FastfadingSsimFull=horzcat(FastfadingSsimFull,tempFastfadingSsim{p}(:,n)');
FastfadingCwssimFull=horzcat(FastfadingCwssimFull,tempFastfadingCwssim{p}(:,n)');
FastfadingMsssimFull=horzcat(FastfadingMsssimFull,tempFastfadingMsssim{p}(:,n)');
FastfadingIwssimFull=horzcat(FastfadingIwssimFull,tempFastfadingIwssim{p}(:,n)');
FastfadingIwpsnrFull=horzcat(FastfadingIwpsnrFull,tempFastfadingIwpsnr{p}(:,n)');
FastfadingColDistFull=horzcat(FastfadingColDistFull,tempFastfadingColDist{p}(:,n)');
end


       if (s2==1)
FastfadingMseFull=FastfadingMseFull/max(FastfadingMseFull);
FastfadingSsimFull=FastfadingSsimFull/max(FastfadingSsimFull);
FastfadingCwssimFull=FastfadingCwssimFull/max(FastfadingCwssimFull);
FastfadingMsssimFull=FastfadingMsssimFull/max(FastfadingMsssimFull);
FastfadingIwssimFull=FastfadingIwssimFull/max(FastfadingIwssimFull);
FastfadingIwpsnrFull=FastfadingIwpsnrFull/max(FastfadingIwpsnrFull);
FastfadingColDistFull=FastfadingColDistFull/max(FastfadingColDistFull);
       end

FastfadingMseFull=FastfadingMseFull(2:end);
FastfadingSsimFull=FastfadingSsimFull(2:end);
FastfadingCwssimFull=FastfadingCwssimFull(2:end);
FastfadingMsssimFull=FastfadingMsssimFull(2:end);
FastfadingIwssimFull=FastfadingIwssimFull(2:end);
FastfadingIwpsnrFull=FastfadingIwpsnrFull(2:end);
FastfadingColDistFull=FastfadingColDistFull(2:end);


FastfadingMseInt=zeros(1,1);
FastfadingSsimInt=zeros(1,1);
FastfadingCwssimInt=zeros(1,1);
FastfadingMsssimInt=zeros(1,1);
FastfadingIwssimInt=zeros(1,1);
FastfadingIwpsnrInt=zeros(1,1);
FastfadingColDistInt=zeros(1,1);

n=2;
for p=1:len
FastfadingMseInt=horzcat(FastfadingMseInt,tempFastfadingMse{p}(:,n)');
FastfadingSsimInt=horzcat(FastfadingSsimInt,tempFastfadingSsim{p}(:,n)');
FastfadingCwssimInt=horzcat(FastfadingCwssimInt,tempFastfadingCwssim{p}(:,n)');
FastfadingMsssimInt=horzcat(FastfadingMsssimInt,tempFastfadingMsssim{p}(:,n)');
FastfadingIwssimInt=horzcat(FastfadingIwssimInt,tempFastfadingIwssim{p}(:,n)');
FastfadingIwpsnrInt=horzcat(FastfadingIwpsnrInt,tempFastfadingIwpsnr{p}(:,n)');
FastfadingColDistInt=horzcat(FastfadingColDistInt,tempFastfadingColDist{p}(:,n)');
end

       if (s2==1)
FastfadingMseInt=FastfadingMseInt/max(FastfadingMseInt);
FastfadingSsimInt=FastfadingSsimInt/max(FastfadingSsimInt);
FastfadingCwssimInt=FastfadingCwssimInt/max(FastfadingCwssimInt);
FastfadingMsssimInt=FastfadingMsssimInt/max(FastfadingMsssimInt);
FastfadingIwssimInt=FastfadingIwssimInt/max(FastfadingIwssimInt);
FastfadingIwpsnrInt=FastfadingIwpsnrInt/max(FastfadingIwpsnrInt);
FastfadingColDistInt=FastfadingColDistInt/max(FastfadingColDistInt);
       end


FastfadingMseInt=FastfadingMseInt(2:end);
FastfadingSsimInt=FastfadingSsimInt(2:end);
FastfadingCwssimInt=FastfadingCwssimInt(2:end);
FastfadingMsssimInt=FastfadingMsssimInt(2:end);
FastfadingIwssimInt=FastfadingIwssimInt(2:end);
FastfadingIwpsnrInt=FastfadingIwpsnrInt(2:end);
FastfadingColDistInt=FastfadingColDistInt(2:end);



FastfadingMseColor=zeros(1,1);
FastfadingSsimColor=zeros(1,1);
FastfadingCwssimColor=zeros(1,1);
FastfadingMsssimColor=zeros(1,1);
FastfadingIwssimColor=zeros(1,1);
FastfadingIwpsnrColor=zeros(1,1);
FastfadingColDistColor=zeros(1,1);
n=3;
for p=1:len
FastfadingMseColor=horzcat(FastfadingMseColor,tempFastfadingMse{p}(:,n)');
FastfadingSsimColor=horzcat(FastfadingSsimColor,tempFastfadingSsim{p}(:,n)');
FastfadingCwssimColor=horzcat(FastfadingCwssimColor,tempFastfadingCwssim{p}(:,n)');
FastfadingMsssimColor=horzcat(FastfadingMsssimColor,tempFastfadingMsssim{p}(:,n)');
FastfadingIwssimColor=horzcat(FastfadingIwssimColor,tempFastfadingIwssim{p}(:,n)');
FastfadingIwpsnrColor=horzcat(FastfadingIwpsnrColor,tempFastfadingIwpsnr{p}(:,n)');
FastfadingColDistColor=horzcat(FastfadingColDistColor,tempFastfadingColDist{p}(:,n)');
end


       if (s2==1)
FastfadingMseColor=FastfadingMseColor/max(FastfadingMseColor);
FastfadingSsimColor=FastfadingSsimColor/max(FastfadingSsimColor);
FastfadingCwssimColor=FastfadingCwssimColor/max(FastfadingCwssimColor);
FastfadingMsssimColor=FastfadingMsssimColor/max(FastfadingMsssimColor);
FastfadingIwssimColor=FastfadingIwssimColor/max(FastfadingIwssimColor);
FastfadingIwpsnrColor=FastfadingIwpsnrColor/max(FastfadingIwpsnrColor);
FastfadingColDistColor=FastfadingColDistColor/max(FastfadingColDistColor);
       end


FastfadingMseColor=FastfadingMseColor(2:end);
FastfadingSsimColor=FastfadingSsimColor(2:end);
FastfadingCwssimColor=FastfadingCwssimColor(2:end);
FastfadingMsssimColor=FastfadingMsssimColor(2:end);
FastfadingIwssimColor=FastfadingIwssimColor(2:end);
FastfadingIwpsnrColor=FastfadingIwpsnrColor(2:end);
FastfadingColDistColor=FastfadingColDistColor(2:end);

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
        tempGblurMse{i}(j,n)=img(i). MseGblur(paramOrder(j));
        tempGblurSsim{i}(j,n)=img(i). SsimGblur(paramOrder(j));
        tempGblurCwssim{i}(j,n)=img(i). CwssimGblur(paramOrder(j));
        tempGblurMsssim{i}(j,n)=img(i). MsssimGblur(paramOrder(j));
        tempGblurIwssim{i}(j,n)=img(i). IwssimGblur(paramOrder(j));
        tempGblurIwpsnr{i}(j,n)=img(i). IwpsnrGblur(paramOrder(j));
        tempGblurColDist{i}(j,n)=img(i). ColDistGblur(paramOrder(j));
        n=2;
        tempGblurMse{i}(j,n)=img(i). MseGblurInt(paramOrder(j));
        tempGblurSsim{i}(j,n)=img(i). SsimGblurInt(paramOrder(j));
        tempGblurCwssim{i}(j,n)=img(i). CwssimGblurInt(paramOrder(j));
        tempGblurMsssim{i}(j,n)=img(i). MsssimGblurInt(paramOrder(j));
        tempGblurIwssim{i}(j,n)=img(i). IwssimGblurInt(paramOrder(j));
        tempGblurIwpsnr{i}(j,n)=img(i). IwpsnrGblurInt(paramOrder(j));   
        tempGblurColDist{i}(j,n)=img(i). ColDistGblurInt(paramOrder(j));
        n=3;
        tempGblurMse{i}(j,n)=img(i). MseGblurColor(paramOrder(j));
        tempGblurSsim{i}(j,n)=img(i). SsimGblurColor(paramOrder(j));
        tempGblurCwssim{i}(j,n)=img(i). CwssimGblurColor(paramOrder(j));
        tempGblurMsssim{i}(j,n)=img(i). MsssimGblurColor(paramOrder(j));
        tempGblurIwssim{i}(j,n)=img(i). IwssimGblurColor(paramOrder(j));
        tempGblurIwpsnr{i}(j,n)=img(i). IwpsnrGblurColor(paramOrder(j));     
        tempGblurColDist{i}(j,n)=img(i). ColDistGblurColor(paramOrder(j));
             
        
        end      
       
            for n=1:3
                tempGblurSsim{i}(:,n)=difVal+mult*tempGblurSsim{i}(:,n);
                tempGblurCwssim{i}(:,n)=difVal+mult*tempGblurCwssim{i}(:,n);
                tempGblurMsssim{i}(:,n)=difVal+mult*tempGblurMsssim{i}(:,n);
                tempGblurIwssim{i}(:,n)=difVal+mult*tempGblurIwssim{i}(:,n);
                tempGblurIwpsnr{i}(:,n)=difVal+mult*tempGblurIwpsnr{i}(:,n);    
                tempGblurColDist{i}(:,n)=difVal+mult*tempGblurColDist{i}(:,n);
            end
        
end


GblurMseFull=zeros(1,1);
GblurSsimFull=zeros(1,1);
GblurCwssimFull=zeros(1,1);
GblurMsssimFull=zeros(1,1);
GblurIwssimFull=zeros(1,1);
GblurIwpsnrFull=zeros(1,1);
GblurColDistFull=zeros(1,1);
n=1;
for p=1:len
GblurMseFull=horzcat(GblurMseFull,tempGblurMse{p}(:,n)');
GblurSsimFull=horzcat(GblurSsimFull,tempGblurSsim{p}(:,n)');
GblurCwssimFull=horzcat(GblurCwssimFull,tempGblurCwssim{p}(:,n)');
GblurMsssimFull=horzcat(GblurMsssimFull,tempGblurMsssim{p}(:,n)');
GblurIwssimFull=horzcat(GblurIwssimFull,tempGblurIwssim{p}(:,n)');
GblurIwpsnrFull=horzcat(GblurIwpsnrFull,tempGblurIwpsnr{p}(:,n)');
GblurColDistFull=horzcat(GblurColDistFull,tempGblurColDist{p}(:,n)');
end



       if (s2==1)
GblurMseFull=GblurMseFull/max(GblurMseFull);
GblurSsimFull=GblurSsimFull/max(GblurSsimFull);
GblurCwssimFull=GblurCwssimFull/max(GblurCwssimFull);
GblurMsssimFull=GblurMsssimFull/max(GblurMsssimFull);
GblurIwssimFull=GblurIwssimFull/max(GblurIwssimFull);
GblurIwpsnrFull=GblurIwpsnrFull/max(GblurIwpsnrFull);
GblurColDistFull=GblurColDistFull/max(GblurColDistFull);
       end



GblurMseFull=GblurMseFull(2:end);
GblurSsimFull=GblurSsimFull(2:end);
GblurCwssimFull=GblurCwssimFull(2:end);
GblurMsssimFull=GblurMsssimFull(2:end);
GblurIwssimFull=GblurIwssimFull(2:end);
GblurIwpsnrFull=GblurIwpsnrFull(2:end);
GblurColDistFull=GblurColDistFull(2:end);




GblurMseInt=zeros(1,1);
GblurSsimInt=zeros(1,1);
GblurCwssimInt=zeros(1,1);
GblurMsssimInt=zeros(1,1);
GblurIwssimInt=zeros(1,1);
GblurIwpsnrInt=zeros(1,1);
GblurColDistInt=zeros(1,1);

n=2;
for p=1:len
GblurMseInt=horzcat(GblurMseInt,tempGblurMse{p}(:,n)');
GblurSsimInt=horzcat(GblurSsimInt,tempGblurSsim{p}(:,n)');
GblurCwssimInt=horzcat(GblurCwssimInt,tempGblurCwssim{p}(:,n)');
GblurMsssimInt=horzcat(GblurMsssimInt,tempGblurMsssim{p}(:,n)');
GblurIwssimInt=horzcat(GblurIwssimInt,tempGblurIwssim{p}(:,n)');
GblurIwpsnrInt=horzcat(GblurIwpsnrInt,tempGblurIwpsnr{p}(:,n)');
GblurColDistInt=horzcat(GblurColDistInt,tempGblurColDist{p}(:,n)');
end

       if (s2==1)
GblurMseInt=GblurMseInt/max(GblurMseInt);
GblurSsimInt=GblurSsimInt/max(GblurSsimInt);
GblurCwssimInt=GblurCwssimInt/max(GblurCwssimInt);
GblurMsssimInt=GblurMsssimInt/max(GblurMsssimInt);
GblurIwssimInt=GblurIwssimInt/max(GblurIwssimInt);
GblurIwpsnrInt=GblurIwpsnrInt/max(GblurIwpsnrInt);
GblurColDistInt=GblurColDistInt/max(GblurColDistInt);
       end

GblurMseInt=GblurMseInt(2:end);
GblurSsimInt=GblurSsimInt(2:end);
GblurCwssimInt=GblurCwssimInt(2:end);
GblurMsssimInt=GblurMsssimInt(2:end);
GblurIwssimInt=GblurIwssimInt(2:end);
GblurIwpsnrInt=GblurIwpsnrInt(2:end);
GblurColDistInt=GblurColDistInt(2:end);


GblurMseColor=zeros(1,1);
GblurSsimColor=zeros(1,1);
GblurCwssimColor=zeros(1,1);
GblurMsssimColor=zeros(1,1);
GblurIwssimColor=zeros(1,1);
GblurIwpsnrColor=zeros(1,1);
GblurColDistColor=zeros(1,1);
n=3;
for p=1:len
GblurMseColor=horzcat(GblurMseColor,tempGblurMse{p}(:,n)');
GblurSsimColor=horzcat(GblurSsimColor,tempGblurSsim{p}(:,n)');
GblurCwssimColor=horzcat(GblurCwssimColor,tempGblurCwssim{p}(:,n)');
GblurMsssimColor=horzcat(GblurMsssimColor,tempGblurMsssim{p}(:,n)');
GblurIwssimColor=horzcat(GblurIwssimColor,tempGblurIwssim{p}(:,n)');
GblurIwpsnrColor=horzcat(GblurIwpsnrColor,tempGblurIwpsnr{p}(:,n)');
GblurColDistColor=horzcat(GblurColDistColor,tempGblurColDist{p}(:,n)');
end

       if (s2==1)
GblurMseColor=GblurMseColor/max(GblurMseColor);
GblurSsimColor=GblurSsimColor/max(GblurSsimColor);
GblurCwssimColor=GblurCwssimColor/max(GblurCwssimColor);
GblurMsssimColor=GblurMsssimColor/max(GblurMsssimColor);
GblurIwssimColor=GblurIwssimColor/max(GblurIwssimColor);
GblurIwpsnrColor=GblurIwpsnrColor/max(GblurIwpsnrColor);
GblurColDistColor=GblurColDistColor/max(GblurColDistColor);
       end



GblurMseColor=GblurMseColor(2:end);
GblurSsimColor=GblurSsimColor(2:end);
GblurCwssimColor=GblurCwssimColor(2:end);
GblurMsssimColor=GblurMsssimColor(2:end);
GblurIwssimColor=GblurIwssimColor(2:end);
GblurIwpsnrColor=GblurIwpsnrColor(2:end);
GblurColDistColor=GblurColDistColor(2:end);







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
%MSE 
 MseFull=horzcat(FastfadingMseFull,GblurMseFull,Jp2kMseFull,JpegMseFull,WnMseFull);
 t1=corrcoef(MseFull,DmosScore); t1=t1(1,2);
 MseInt=horzcat(FastfadingMseInt,GblurMseInt,Jp2kMseInt,JpegMseInt,WnMseInt);
 t2=corrcoef(MseInt,DmosScore); t2=t2(1,2);
 MseColor=horzcat(FastfadingMseColor,GblurMseColor,Jp2kMseColor,JpegMseColor,WnMseColor);
 t3=corrcoef(MseColor,DmosScore); t3=t3(1,2);
 MseCorr=[t1, t2, t3]
 %Ssim 
 SsimFull=horzcat(FastfadingSsimFull,GblurSsimFull,Jp2kSsimFull,JpegSsimFull,WnSsimFull);
 t1=corrcoef(SsimFull,DmosScore); t1=t1(1,2);
 SsimInt=horzcat(FastfadingSsimInt,GblurSsimInt,Jp2kSsimInt,JpegSsimInt,WnSsimInt);
 t2=corrcoef(SsimInt,DmosScore); t2=t2(1,2);
 SsimColor=horzcat(FastfadingSsimColor,GblurSsimColor,Jp2kSsimColor,JpegSsimColor,WnSsimColor);
 t3=corrcoef(SsimColor,DmosScore); t3=t3(1,2);
 SsimCorr=[t1, t2, t3] 
  %Cwssim
 CwssimFull=horzcat(FastfadingCwssimFull,GblurCwssimFull,Jp2kCwssimFull,JpegCwssimFull,WnCwssimFull);
 t1=corrcoef(CwssimFull,DmosScore); t1=t1(1,2);
 CwssimInt=horzcat(FastfadingCwssimInt,GblurCwssimInt,Jp2kCwssimInt,JpegCwssimInt,WnCwssimInt);
 t2=corrcoef(CwssimInt,DmosScore); t2=t2(1,2);
 CwssimColor=horzcat(FastfadingCwssimColor,GblurCwssimColor,Jp2kCwssimColor,JpegCwssimColor,WnCwssimColor);
 t3=corrcoef(CwssimColor,DmosScore); t3=t3(1,2);
 CwssimCorr=[t1, t2, t3]
   %Msssim
 MsssimFull=horzcat(FastfadingMsssimFull,GblurMsssimFull,Jp2kMsssimFull,JpegMsssimFull,WnMsssimFull);
 t1=corrcoef(MsssimFull,DmosScore); t1=t1(1,2);
 MsssimInt=horzcat(FastfadingMsssimInt,GblurMsssimInt,Jp2kMsssimInt,JpegMsssimInt,WnMsssimInt);
 t2=corrcoef(MsssimInt,DmosScore); t2=t2(1,2);
 MsssimColor=horzcat(FastfadingMsssimColor,GblurMsssimColor,Jp2kMsssimColor,JpegMsssimColor,WnMsssimColor);
 t3=corrcoef(MsssimColor,DmosScore); t3=t3(1,2);
 MsssimCorr=[t1, t2, t3]
 
     %Iwssim
 IwssimFull=horzcat(FastfadingIwssimFull,GblurIwssimFull,Jp2kIwssimFull,JpegIwssimFull,WnIwssimFull);
 t1=corrcoef(IwssimFull,DmosScore); t1=t1(1,2);
 IwssimInt=horzcat(FastfadingIwssimInt,GblurIwssimInt,Jp2kIwssimInt,JpegIwssimInt,WnIwssimInt);
 t2=corrcoef(IwssimInt,DmosScore); t2=t2(1,2);
 IwssimColor=horzcat(FastfadingIwssimColor,GblurIwssimColor,Jp2kIwssimColor,JpegIwssimColor,WnIwssimColor);
 t3=corrcoef(IwssimColor,DmosScore); t3=t3(1,2);
 IwssimCorr=[t1, t2, t3]
 
     %Iwpsnr
 IwpsnrFull=horzcat(FastfadingIwpsnrFull,GblurIwpsnrFull,Jp2kIwpsnrFull,JpegIwpsnrFull,WnIwpsnrFull);
 t1=corrcoef(IwpsnrFull,DmosScore); t1=t1(1,2);
 IwpsnrInt=horzcat(FastfadingIwpsnrInt,GblurIwpsnrInt,Jp2kIwpsnrInt,JpegIwpsnrInt,WnIwpsnrInt);
 t2=corrcoef(IwpsnrInt,DmosScore); t2=t2(1,2);
 IwpsnrColor=horzcat(FastfadingIwpsnrColor,GblurIwpsnrColor,Jp2kIwpsnrColor,JpegIwpsnrColor,WnIwpsnrColor);
 t3=corrcoef(IwpsnrColor,DmosScore); t3=t3(1,2);
 IwpsnrCorr=[t1, t2, t3]

      %ColDist
 ColDistFull=horzcat(FastfadingColDistFull,GblurColDistFull,Jp2kColDistFull,JpegColDistFull,WnColDistFull);
 t1=corrcoef(ColDistFull,DmosScore); t1=t1(1,2);
 ColDistInt=horzcat(FastfadingColDistInt,GblurColDistInt,Jp2kColDistInt,JpegColDistInt,WnColDistInt);
 t2=corrcoef(ColDistInt,DmosScore); t2=t2(1,2);
 ColDistColor=horzcat(FastfadingColDistColor,GblurColDistColor,Jp2kColDistColor,JpegColDistColor,WnColDistColor);
 t3=corrcoef(ColDistColor,DmosScore); t3=t3(1,2);
 ColDistCorr=[t1, t2, t3]
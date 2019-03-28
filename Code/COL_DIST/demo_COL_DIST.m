clc; close all; clear all;
cform_srgb2lab= makecform('srgb2lab');

% Each row contains 3 colors where the first is perceptually more similar to the second than to the third
colors= [0  255 255    50 160 210  200 200 200;...
         0    0 255     0 191 255  255 105 180;...
		 0  255   0    50 220 150  210 240 100;...
		 255  0   0   240   0  80  180 100 80];
colors= uint8(colors);
N= 300;
	   
for ci= 1:size(colors,1)
  
  % Computation of the COL_DIST
  COL_DIST_sim=  COL_DIST(colors(ci,1:3), colors(ci,4:6));
  COL_DIST_nsim= COL_DIST(colors(ci,1:3), colors(ci,7:9));
  
  Lab1= applycform(double(colors(ci,1:3))./255, cform_srgb2lab);
  Lab2= applycform(double(colors(ci,4:6))./255, cform_srgb2lab);
  Lab3= applycform(double(colors(ci,7:9))./255, cform_srgb2lab);
  de2000_sim=  deltaE2000(Lab1, Lab2);
  de2000_nsim= deltaE2000(Lab1, Lab3);
    
  %% visaulization
  im1= zeros(N,N,3,'uint8');
  im1(:,:,1)= colors(ci, 1);
  im1(:,:,2)= colors(ci, 2);
  im1(:,:,3)= colors(ci, 3);
  
  im2= zeros(N,N,3,'uint8');
  im2(:,:,1)= colors(ci, 4);
  im2(:,:,2)= colors(ci, 5);
  im2(:,:,3)= colors(ci, 6);
  
  im3= zeros(N,N,3,'uint8');
  im3(:,:,1)= colors(ci, 7);
  im3(:,:,2)= colors(ci, 8);
  im3(:,:,3)= colors(ci, 9);
  
  subplot(1,3,1), imshow(im1);
  xlabel('(a)');
  subplot(1,3,2), imshow(im2);
  xlabel('(b)');
  title(sprintf('COL_{DIST}(a,b)=%2.2f \n de00(a,b)=%2.2f \n', COL_DIST_sim, de2000_sim));
  subplot(1,3,3), imshow(im3);
  xlabel('(c)');
  title(sprintf('COL_{DIST}(a,c)=%2.2f \n de00(a,c)=%2.2f \n', COL_DIST_nsim, de2000_nsim));
  pause; close all;
  
end
  
% Copyright (c) 2013, Ofir Pele
% All rights reserved.

% Redistribution and use in source and binary forms, with or without
% modification, are permitted provided that the following conditions are
% met: 
%    * Redistributions of source code must retain the above copyright
%    notice, this list of conditions and the following disclaimer.
%    * Redistributions in binary form must reproduce the above copyright
%    notice, this list of conditions and the following disclaimer in the
%    documentation and/or other materials provided with the distribution.
%    * Neither the name of the The Hebrew University of Jerusalem nor the
%    names of its contributors may be used to endorse or promote products
%    derived from this software without specific prior written permission.

% THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS
% IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
% THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
% PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR
% CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
% EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
% PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
% PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
% LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
% NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
% SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

%dist = COL_DIST(RGB1, RGB2,  T, D, alpha, Z)
%
% Computes the COL_DIST color distance that was proposed in the paper:
%  Improving Perceptual Color Difference using Basic Color Terms
%  Ofir Pele, Michael Werman
%  ArXiv 2012
% The code also uses algorithms and data from the papers:
%  Learning Color Names for Real-World Applications
%  J. van de Weijer, Cordelia Schmid, Jakob Verbeek, Diane Larlus
%  TIP 2009
%  The development of the CIE 2000 colour-difference formula: CIEDE2000
%  M. R. Luo, G. Cui, B. Rigg
%  CRA 2001
%  The CIEDE2000 color-difference formula: Implementation notes, supplementary test data, and mathematical observations
%  Gaurav Sharma, Wencheng Wu, Edul N. Dalal
%  CRA 2004
%  Fast and Robust Earth Mover's Distances
%  Ofir Pele, Michael Werman
%  ICCV 2009
%
% Output:
%  dist - the COL_DIST distance between the two colors
%
% Required Input:
%  RGB1,RGB2 - The two 3-dimensional vectors of the RGB values of the colors that are compared. 
%              Should be in the range [0,255]
%
% Optional Input:
%  T - The threshold in Eq (1) in the paper.
%      Default: 20
%  D - The ground distance for the EMD between the basic color term probability vectors.
%      Default: see pg 6, description of Eq (2) in the paper.
%  alpha - Importance coefficient of deltaE2000 vs the EMD between basic color term probability vectors
%          in Eq (3) in the paper.
%          Default: 0.5
%  Z - Scaling factor in Eq (4) in the paper.
%      Default: 10
function dist = COL_DIST(RGB1, RGB2,  T, D, alpha, Z)

%% Global inits
global done_COL_DIST_inits;
global cform_srgb2lab;
if (isempty(done_COL_DIST_inits))
  cform_srgb2lab= makecform('srgb2lab');
%   addpath ('FastEMD');
  done_COL_DIST_inits= true;
end

%% Default parameters and checks
if (nargin<6)
  Z= 10;
end
if (nargin<5)
  alpha= 0.5;
end
if (nargin<4)
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
end
if (nargin<3)
  T= 20;
end
if (nargin<2)
  error('COL_DIST requires at least two input parameters');
end
check_RGB(RGB1);
check_RGB(RGB2);
if (size(RGB1,1)~=1)
  RGB1= RGB1';
end
if (size(RGB2,1)~=1)
  RGB2= RGB2';
end

%% Eq (1) in paper
Lab1= applycform(double(RGB1)./255, cform_srgb2lab);
Lab2= applycform(double(RGB2)./255, cform_srgb2lab);
de00= deltaE2000(Lab1, Lab2);
d1= min([de00, T])/T;
%% Eq (2) in paper
eleven1= RGB_to_color_terms(RGB1);
eleven2= RGB_to_color_terms(RGB2);
% d2= emd_hat_gd_metric_mex(eleven1',eleven2',D);
d2=0;
%% Eq (3) in paper
d3= alpha*d1 + (1-alpha)*d2;
%% Eq (4) in paper
% dist= 1.0 / (1.0+exp(-(Z*d3-Z/2.0)));
dist= d3;

% dist=d3;
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

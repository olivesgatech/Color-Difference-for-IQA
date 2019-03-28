%color_names = RGB_to_color_terms(RGB)
%
% Returns the 11 basic color term vector given an RGB vector based on the paper: 
%  Learning Color Names for Real-World Applications
%  J. van de Weijer, Cordelia Schmid, Jakob Verbeek, Diane Larlus
%  TIP 2009
%
% Output:
%  color_terms - The 11-dimensional vector of the basic color terms.
%                The order of the color names is:
%                 black [0 0 0], blue [0 0 255], brown [128 102 64], grey [128 128 128], green [0 255 0], 
%                 orange [255 204 0], pink [255 128 255], purple [255 0 255], red [255 0 0], 
%                 white [255 255 255], yellow [255 255 0]
%
% Required Input:
%  RGB - The 3-dimensional vector of the RGB values of the color. Should be in the range [0,255]
function color_terms = RGB_to_color_terms(RGB)

%% Global inits
global done_RGB_to_color_terms_inits
global w2c;
if (isempty(done_RGB_to_color_terms_inits))
  load w2c;
  done_RGB_to_color_terms_inits= true;
end

%% checks
check_RGB(RGB);

%% Retrieving the vector from the cached matrix 
R= double(RGB(1));
G= double(RGB(2));
B= double(RGB(3));
index= 1 + floor(R/8) + 32*floor(G/8) + 32*32*floor(B/8);
color_terms= w2c(index,:);

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

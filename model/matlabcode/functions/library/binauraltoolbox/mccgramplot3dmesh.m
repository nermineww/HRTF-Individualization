function null = mccgramplot3dmesh(correlogram)
% function null = mccgramplot3dmesh(correlogram)
%
%--------------------------------------------------------------------
% Plots a 3-dimensional binaural correlogram uising 'mesh'
%--------------------------------------------------------------------
%
% Input:
%    correlogram = 'correlogram' structure as defined in mccgramcreate.m
%
% Output parameters:
%    none
%
% Examples:
% to plot a previously-made correlogram cc1, type:
% >> mccgramplot3dmesh(cc1);
%
% See mccgramplot4panel.m for another example.
%
%
% MAA Winter 2001 2i01
%--------------------------------------------------------

%-----------------------------------------------------------
% 
% "Binaural auditory processing toolbox for MATLAB Software"
% 
% **  Licence Agreement **
% 
% The "Binaural auditory processing toolbox for MATLAB" software
% was developed by Michael Akeroyd for supporting research at 
% MRC IHR. It is based on earlier work at the University of 
% Connecticut (funded by the NIH) and the University of Sussex 
% (funded by the MRC).  It is made available to the academic
% community in the hope that it may prove useful.  
% 
% Definitions:
% TOOLBOX means the "Binaural auditory processing toolbox for 
%   MATLAB" software package and any associated documentation,
%   whether electronic or printed.
% USER means any person or organisation that uses the TOOLBOX.
% ACADEMIC means not-for-profit.
% 
% By using the TOOLBOX, the USER hereby agrees to the following conditions:
% 
% Grant:
% The TOOLBOX is copyrighted by MRC from 2001 to 2004, and
% protected by European Copyright Law.  All rights are reserved worldwide.
% MRC grants USER the royalty free right under MRC Copyright and
% MRC intellectual property rights to use TOOLBOX for ACADEMIC
% purposes only.  If USER wishes to use TOOLBOX for commercial
% for-profit purposes then USER will contact MRC for a commercial licence. 
%         
% Contact address:
%   Dr Michael A Akeroyd,
%   MRC Institute of Hearing Research,
%   Glasgow Royal Infirmary,
%   (Queen Elizabeth Building),
%   16 Alexandra Parade,
%   Glasgow, G31 2ER, United Kingdom
% 
%   maa@ihr.gla.ac.uk
%   http://www.ihr.gla.ac.uk  http://www.ihr.mrc.ac.uk
% 
% USER will not pass the TOOLBOX to any other party unless it is
% accompanied by this Licence Agreement.
% 
% Disclaimer:
% MRC makes no representation or warranty with respect to TOOLBOX
% and specifically disclaims any implied warranties of merchantability
% and fitness for a particular purpose or that use of TOOLBOX
% will not infringe any third party rights.
% 
% MRC reserves the right to revise TOOLBOX and to make changes
% therein from time to time without obligation to notify any person
% or organisation of such revision or changes.
% 
% While MRC will make every effort to ensure the accuracy of TOOLBOX,
% neither MRC nor its employees or agents may be held responsible
% for errors, omissions or other inaccuracies or any consequences
% thereof.  The MRC will not be liable in any way for any losses
% howsoever caused by the use of TOOLBOX, such losses to include
% but not be limited to loss of profit, business interruption, 
% loss of business information, or other pecuniary loss, including
% but not limited to special incidental consequential or other damages.
% 
%-----------------------------------------------------------




hold off;


% plot!
mesh(correlogram.delayaxis, correlogram.freqaxiserb, correlogram.data);
shading interp;
view(-10,70);
zlabel('Crossproduct');

switch correlogram.type
case 'binauralcorrelogram' ; 
   title('Binaural correlogram');
case 'autocorrelogram' ; 
   title('Autocorrelogram');
end;

colormap(jet);

% reset freq axes to filterbank limits
oldaxes = axis;
[filter_q, filter_bwmin] = mstandarderbparameters;
xmin = correlogram.mindelay;  
xmax = correlogram.maxdelay;  
ymin = mhztoerb(correlogram.mincf,filter_q, filter_bwmin, 0);
ymax = mhztoerb(correlogram.maxcf,filter_q, filter_bwmin, 0);
axis([xmin xmax ymin ymax oldaxes(5) oldaxes(6)]);
maxislabels_freq('ytick', 'yticklabel');
ylabel('Frequency (Hz)');
maxislabels_delay(correlogram.type);

% the end!
%---------------------------------------------------------------------------
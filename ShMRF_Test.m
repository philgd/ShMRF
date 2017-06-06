% Test data acquired from:
% Ward, Phillip G D; Ferris, Nicholas J.; Raniga, Parnesh; Ng, Amanda C. L.; Dowe, David L.; Barnes, David; F. Egan, Gary (2017): 
%   Combined magnetic susceptibility contrast for vein segmentation from a single MRI acquisition using a vein frequency atlas. figshare.
%   https://doi.org/10.4225/03/57B6AB25DDBDC

addpath('/Users/philward/git/ShMRF/');
addpath(genpath('/Users/philward/git/ShMRF/utility'));

% Load data
load('ShMRF_TestData.mat')

% Run QSM or SWI
runQSM = true; %#ok<*UNRCH>

if runQSM
    params = ShMRF_DefaultParams();
    params.omega1 = 0.2;
    params.omega2 = 0.5;
    params.display = true;
    prediction = ShMRF_Segment(qsm, mask, params);
else
    params = ShMRF_DefaultParams();
    params.labelbright = false;
    params.omega1 = 0.1;
    params.omega2 = 1;
    params.display = true;
    prediction = ShMRF_Segment(swi, mask, params);
end

[ scores ] = ShMRF_Metrics( prediction>0, labels, mask>0 );
disp(scores)

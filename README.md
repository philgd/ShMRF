# ShMRF
Shape-based Markov Random Field

A tool designed to segment blood vessels from MRI images.

Citation for use:

Ward, P.G.D, Ferris, N.F, Raniga, P., Ng, A.C.L., Barnes, D.G., Dowe, D.L., Egan G.F., 2017. Vein segmentatiom using Shape-based Markov Random Fields, in: 2017 IEEE 14th International Symposium on Biomedical Imaging (ISBI). Presented at the 2017 IEEE 14th International Symposium on Biomedical Imaging (ISBI), pp. 1133-1136. doi:10.1109/ISBI.2017.XXXXXXX

Training data taken from: 

*Ward, Phil; Ferris, Nicholas J.; Raniga, Parnesh; Ng, Amanda C. L.; Dowe, David L.; Barnes, David; F. Egan, Gary (2016): Combined magnetic susceptibility contrast for vein segmentation from a single MRI acquisition using a vein frequency atlas (vein priors and frequency atlas).. figshare. https://doi.org/10.4225/03/57B6AB25DDBDC*

## Requirements

Software:
  1. MatLab (https://www.mathworks.com/products/matlab.html)

## Instructions for use

1. Create a working directory (e.g. mkdir ~/ShMRF/)
2. Clone git repository into working directory (git clone https://github.com/philgd/ShMRF.git)
4. Open MatLab
5. Run main script (ShMRF_Test.m)

Output data is a set of predicted labels.

### Main functions

1. ShMRF_Segment.m - Run Shape-based Markov Random Field segmentation method
    * Inputs
        - inData - Input volume for processing
        - inMask - Mask of region to perform segmentation within (must be same dimensions as inData)
        - inParams - Options for processing (See ShMRF_DefaultParams.m for details explanation)
    * Outputs
        - outLabels   - Output volume of labels from ShMRF algorithms

### Code included from other projects:

1. Frangi filter for Hessian code (http://au.mathworks.com/matlabcentral/fileexchange/24409-hessian-based-frangi-vesselness-filter)
2. fspecial3 (https://au.mathworks.com/matlabcentral/fileexchange/21130-dti-and-fiber-tracking/content/fspecial3.m)
3. imagesc3 modifed by A.C.L. Ng (https://au.mathworks.com/matlabcentral/fileexchange/62725-imagesc3)

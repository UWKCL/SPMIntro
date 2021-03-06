% SPMIntro
% Where to put your fMRI files:
% Docs/MATLAB/mri/facePlaceObject

% How to set this directory as your working directory in MATLAB
cd /Docs/MATLAB/mri/facePlaceObject;

% Loading SPM
spm fmri;

% It will produce something that looks like this:

% ___  ____  __  __                                            
% / __)(  _ \(  \/  )                                           
% \__ \ )___/ )    (   Statistical Parametric Mapping           
% (___/(__)  (_/\/\_)  SPM12 - http://www.fil.ion.ucl.ac.uk/spm/
%
%
% SPM12: v6225                                       16:42:52 - 20/02/2015
% ========================================================================
% Initialising SPM                        :                   ........done

% Make separate directories for functional and structural (anatonomical) data:
% <anat,func>/native/nii/{files}
% for example: /Docs/MATLAB/mri/facePlaceObject/anat/native/nii/

% Using MATLAB to uncompress the data 
untar('conds.tgz','condsUntarred')
untar('jlp_nii.tar.gz','jlpUntarred')
untar('runs.tgz','runsUntarred')
untar('jlp_anat.tgz','jlp_anat') 

% setting paths to a given file within the file architecture we've set up
dataDir = fullfile('anat', 'native', 'nii');
dataPath = fullfile(dataDir, 'filename');

% using SPM to load .nii files
headerData = spm_vol(dataPath);
img = spm_read_vols(headerData);
% Show image at a particular dimension
imagesc(img(:,:,10));
% Show all images within a certain range
for i=1:30
  subplot(5,6,i);
  imagesc(img(:,:,i)
end

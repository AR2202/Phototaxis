
%Annika Rings 2020

%USAGE: in matlab command window, type: find_chambers(inputdir)
%inputdir is the absolute or relative path to the input directory

%reads in data from a file called 'calibration.mat' located in
%inputdir

function centroid=find_chambers(inputdir)
startdir=pwd;
cd (inputdir);
calibfile='calibration.mat';

load(calibfile);
centroids=horzcat(calib.centroids,[1;2;3;4;5;6]);
centroid=sortrows(centroids,2);
cd (startdir);

                    

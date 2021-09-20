%Annika Rings 2020

%USAGE: in matlab command window, type: preference_index(inputdir)
%inputdir is the absolute or relative path to the input directory

%reads in data from a file called 'inputdir-trk.mat' located in
%inputdir/inputdir

function [PIs, PImean] = preference_index(inputdir, dur)
startdir = pwd;
centroids = find_chambers(inputdir);
cd(inputdir);
cd(inputdir);
trkfile = strcat(inputdir, '-track.mat');
framerate = 25; %fps
%could be rad from calibrationfile instead.


endframe = round(framerate*dur);

load(trkfile);
totalframes = size(trk.data, 2);
numchambers = size(trk.flies_in_chamber, 2);
%disp(totalframes);
%disp(endframe);
if endframe > totalframes
    endframe = totalframes;
end
chambernum = zeros(6, 1);
PImean = zeros(6, 1);
PIs = {};
for i = 1:numchambers

    chambernum(i) = centroids(i, 3);
    xcentroid = centroids(i, 1);
    flies_in_chamber_i = trk.flies_in_chamber{chambernum(i)};
    x_flies_in_chamber_i = trk.data(flies_in_chamber_i, i:endframe, 1);
    numflies = size(x_flies_in_chamber_i, 1);
    numframes = size(x_flies_in_chamber_i, 2);
    PI = zeros(1, numflies);

    for j = 1:numflies

        framesleft = size(x_flies_in_chamber_i(j, (x_flies_in_chamber_i(j, :) < xcentroid)), 2);
        framesright = numframes - framesleft;
        PI(j) = (framesleft - framesright) / numframes;
    end
    PIs{i} = PI;
    PImean(i) = mean(PIs{i});

end
save(strcat(inputdir, '-preference_index.mat'), 'PIs', 'PImean');
cd(startdir);

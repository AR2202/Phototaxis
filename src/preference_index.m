%Annika Rings 2020

%USAGE: in matlab command window, type: preference_index(inputdir)
%inputdir is the absolute or relative path to the input directory

%reads in data from a file called 'inputdir-trk.mat' located in
%inputdir/inputdir

function PIs=preference_index(inputdir)
startdir=pwd;
centroids=find_chambers(inputdir);
cd (inputdir);
cd (inputdir);
trkfile=strcat(inputdir,'-track.mat');

load(trkfile);
chambernum = zeros(6,1);
PIs={};
for i=1:6
    
    chambernum(i)=centroids(i,3);
    xcentroid=centroids(i,1);
    flies_in_chamber_i=trk.flies_in_chamber{chambernum(i)};
    x_flies_in_chamber_i=trk.data(flies_in_chamber_i,:,1);
    numflies=size(x_flies_in_chamber_i,1);
    numframes = size(x_flies_in_chamber_i,2);
    PI = zeros(1,numflies);
    
    for j=1:numflies
        
        framesleft = size(x_flies_in_chamber_i(j,(x_flies_in_chamber_i(j,:)<xcentroid)),2);
        framesright= numframes - framesleft;
        PI(j)=(framesleft-framesright)/numframes;
    end
    PIs{i}=PI;
        
end
save(strcat(inputdir,'-preference_index.mat'),'PIs');
cd (startdir);


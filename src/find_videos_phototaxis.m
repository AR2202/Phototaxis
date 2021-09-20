%Annika Rings Nov 2020
%FIND_VIDEOS_PHOTOTAXIS(genotypelist,genotype)
%
%averages the phototaxis data for the flies specified in
%genotypelist
%genotype is just the label for the outputdatafile
%both arguments are of type string
function find_videos_phototaxis(genotypelist, genotype)


outputtable = readtable(genotypelist, 'readvariablenames', false);


startdir = pwd;
PImeans = [];
PI = [];
PIsingles = {};
cellPImeans = {};


videos = cellfun(@(list)dir(char(strcat('*', list))), outputtable.Var1, 'UniformOutput', false);


videonames = cellfun(@(struct)arrayfun(@(indiv) indiv.name(indiv.isdir == 1, :), struct, 'UniformOutput', false), videos, 'UniformOutput', false);


if size(videonames, 2) > 0
    for q = 1:size(videonames, 1)
        if exist(videonames{q}{1}, 'dir')
            disp(videonames{q}{1});
            cd(videonames{q}{1});
            cd(videonames{q}{1});

            datafilename = strcat(videonames{q}{1}, '-preference_index.mat');


            load(datafilename);

            PImeans(end+1) = PImean(outputtable.Var2(q));
            cellPImeans{end+1} = PImean(outputtable.Var2(q));
            PI = vertcat(PI, transpose(PIs{outputtable.Var2(q)}));
            PIsingles{end+1} = PIs{outputtable.Var2(q)};
        end
        cd(startdir);
    end


end


meandata = mean(PImeans);

dataSEM = std(PImeans) / sqrt(size(PImeans, 2));
meansingles = mean(PI);
singlesSEM = std(PI) / sqrt(size(PI, 1));

fullfigname = strcat(genotype, '_PImeans_PI');
datafilename = strcat(fullfigname, '.mat');
fignew = figure('Name', fullfigname);

bar([1, 2], [meandata, meansingles], 0.1, 'm');
hold on;
er = errorbar([1, 2], [meandata, meansingles], [dataSEM, singlesSEM], [dataSEM, singlesSEM]);
er.Color = [0, 0, 0];
er.LineStyle = 'none';
hold off;
saveas(fignew, fullfigname, 'epsc');
save(datafilename, 'PImeans', 'PI', 'PIsingles', 'cellPImeans');

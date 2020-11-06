
%Annika Rings Nov 2020
%FIND_VIDEOS_PHOTOTAXIS(genotypelist,genotype)
%
%averages the phototaxis data for the flies specified in
%genotypelist
%genotype is just the label for the outputdatafile
%both arguments are of type string
function find_videos_phototaxis(genotypelist,genotype)

%path = 'distance_travelled';
%structname = 'data';
%expname = 'dist';
outputtable=readtable(genotypelist,'readvariablenames',false);


startdir=pwd;
PImeans=[];



    videos=cellfun(@(list)dir(char(strcat('*',list))),outputtable.Var1,'UniformOutput',false);
    
    
    videonames=cellfun(@(struct)arrayfun(@(indiv) indiv.name(indiv.isdir==1,:),struct,'UniformOutput',false),videos,'UniformOutput',false);
    
    
    
    if size(videonames,2)>0
        for q = 1:size(videonames,1)
            if exist (videonames{q}{1},'dir')
                disp(videonames{q}{1});
                cd(videonames{q}{1});
                cd(videonames{q}{1});
               
                datafilename=strcat(videonames{q}{1},'-preference_index.mat');
                
                    disp(datafilename);
                    
                    load(datafilename);
                    disp(outputtable.Var2(q));
                    disp(PImean(outputtable.Var2(q)));
                    PImeans(end+1) = PImean(outputtable.Var2(q));
                end
                cd(startdir);
            end
            
            
    end
    
    


meandata=mean(PImeans);
dataSEM=std(PImeans)/sqrt(size(PImeans,2));
fullfigname=strcat(genotype,'_PImeans');
datafilename=strcat(fullfigname,'.mat');
fignew=figure('Name',fullfigname);

bar(1,meandata,0.1,'m');
hold on;
errorbar(1,meandata,dataSEM, 'r');
hold off;
saveas(fignew,fullfigname,'epsc');
save(datafilename,'PImeans');

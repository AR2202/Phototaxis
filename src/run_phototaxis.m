%Annika Rings, Nov 2020
%RUN_PHOTOTAXIS()


%runs the preference_index function for all directories 
%optional argument: 
%dur: period of time (in s) to calculate the phototaxis (default 900s)


function run_phototaxis(varargin)

arguments = varargin;
options = struct('dur',900);

options=options_resolver(options,arguments,'run_phototaxis');

dur=options.dur;


    %get all subdirectories of the Courtship directory - these are the
    %video directories
    subdirs=dir();
    for q = 1:numel(subdirs)
        if ~subdirs(q).isdir
            continue;
        end
        subdirname=subdirs(q).name;
        if ismember(subdirname,{'.','..'})
            continue;
        end
        %go into the video directory
        
        disp(['Now calculating preference index for:' subdirname]);
        %go into the second directory level (also named the same as the
        %video directory)
       
        %test which options are set and call the pdfplot_any function with
        %the respective parameters. The function is called wrapped in the
        %error_handling_wrapper, which catches any errors and writes them
        %to a file called 'preference_index_errors.log'
        
        
        error_handling_wrapper('preference_index_errors.log','preference_index',subdirname,dur);
      
        %go back to the courtship directory and continue with the next
        %video
     
    end
 
   



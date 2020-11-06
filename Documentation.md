# Short User Guide

## Phototaxis analysis scripts

This is a collection of MATLAB scripts for the analysis of tracked fly phototaxis videos.
The tracking has to be done with Caltech flytracker. The light is expected to be on the left side of the chamber.


### Requirements


* MATLAB
* some additional Matlab scripts:

* error_handling_wrapper.m 

to be obrained from the repo AnnikasTrackingScripts:

https://github.com/AR2202/AnnikasTrackingScripts/tree/master/src 
* options_Resolver.m 

to be obrained from the repo 2-photon:

https://github.com/AR2202/2-photon/tree/master/touch


### Usage

All of the descriptions below assume you have tracked with Caltech flytracker and that the light was on the left side of the chamber.

#### calculating the light preference index

Calculates the following index: 

(number of frames spent() in light) - (number of frames spent in dark))/total number of frames


from the directory containing the tracking output directories, enter in matlab command line:

`run_phototaxis(varargin)`

optional key-value pair argument: dur

specifies the duration (in s) to calculate the index for. If not given, defaults to 900s or the duration of tracking (whichever is shorter).


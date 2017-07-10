function [ shearRate, viscosity ] = readShearRateAndVisc( xlsFile, sheet)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
xlRange = 'h6:h11';
shearRate = xlsread(xlsFile,sheet,xlRange);

xlRange = 'j6:j11';
viscosity = xlsread(xlsFile,sheet,xlRange);

end


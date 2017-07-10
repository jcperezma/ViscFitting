function [ T, P ] = readTandP( xlsFile, sheet )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
xlRange = 'a2:a2';

[num,txt,raw ] = xlsread(xlsFile,sheet,xlRange);
tokens= strsplit(txt{1}, {'=','°',':',' '},'CollapseDelimiters',true);
T = str2num(tokens{6});
P = str2num(tokens{2});
end


function [ shearRate, viscosity, c ] = readData( filenames, sheets, c )
%Reads shear rate, viscosity, pressure and temperature form excel files
c.numOfSheets = 0;

c.initialIndex=[1];


c.T = [];
c.P = [];
shearRate =[];
viscosity =[];
for file =1 : length(filenames)
    % get info about file
    [finfo, sheetInfo] = xlsfinfo(filenames{file});
    % print all the sheets available in this file
    fprintf('Sheets on file \"%s\":\n',filenames{file})
    for sheet = 1 : length(sheetInfo)
       fprintf('%d %s\n',sheet,sheetInfo{sheet}) 
    end
    
    % get the information from the sheets given by the user
    
    for sheet = 1 : length(sheets{file})
        [ shearRate_loc, viscosity_loc ] = readShearRateAndVisc( filenames{file}, sheets{file}(sheet));
        % Append values read to global shear rate and viscosity arrays
        shearRate = [shearRate shearRate_loc'];
        viscosity = [viscosity viscosity_loc'];
        numPointsInSheet = length(shearRate_loc);
        c.initialIndex= [c.initialIndex numPointsInSheet+c.initialIndex(end)];
        
        [T,P] = readTandP(filenames{file}, sheets{file}(sheet));
        c.T = [ c.T ones(1,numPointsInSheet)*T];
        c.P = [ c.P ones(1,numPointsInSheet)*P];
        c.numOfSheets = c.numOfSheets +1;
        
    end     
 end

end


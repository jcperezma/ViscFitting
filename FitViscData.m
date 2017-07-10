clear variables
close all

%%%%%%%%%%%%%%%%%%%%%%%%% INPUT %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Add the name of the file that contains the data, if there is more than
% one separate name with comas
filenames= {'Viscosity Calculation LEXAN 305%2c 325 & 315 celcius  Repetition.xlsx'...
            };
% Add sheets that contain the data within each file, if there is more than
% one file add another array with the indices of the sheets for that file
sheets = {[ 2  ]...
            };

% Comment out the parameters you want to adjust
%c.n = 0.11378; % [-]
c.tau= 735010; % [Pa]
c.D1= 4.5e15;  % [Pa-s]
c.D2= 375.38;  % [K]
c.A1= 38.64;   % [-]
%c.A2_tilde= 51.6 ; %[K]
%c.D3 = 0;

% Define limits for parameter values
c.n_lims        = [0.3 1];
c.tau_lims      = [0   1000000] ; 
c.D1_lims       = [0   1e20];
c.D2_lims       = [0   10000];
c.A1_lims       = [0   10000];
c.A2_tilde_lims = [0   200];
c.D3_lims       = [0   2];

% Define guesses for parameters to be fitted

c.n_guess        = 0.11378;
c.tau_guess      = 735010 ; 
c.D1_guess       = 4.5e15;
c.D2_guess       = 375.38;
c.A1_guess       = 38.64;
c.A2_tilde_guess = 51.6;
c.D3_guess       = 0;

fittingType =1; % 1: Gauss
                % 2: Genetic Algorithm

% if you want to test the fitting functions change following value to true.
testFitting = false; 
%p_testValue = [ c.n       ... % n            
 %     c.tau     ... % tau          
  %    c.D1      ... % D1           
   %   c.D2      ... % D2           
    %  c.A1      ... % A1           
     % c.A2_tilde... % A2_tilde     
      %c.D3      ... % D3
     %];

% if you want to see the indices of the sheets of the excel file this
% should be true
c.printSheetInfo = true;

%%%%%%%%%%%%%%%%%%%%%%%%% END OF INPUT %%%%%%%%%%%%%%%%%%%%%%%%%%%

% initialize variables
[ p, p_min, p_max, c ] = generateP( c );
dp = ones(1,length(p)) * 0.0001;

c.setsPlotted =0;


[ shearRate, eta_exp, c ] = readData( filenames, sheets, c ) ;
eta_calc  = ModCrossModel3_( shearRate, p, c );

if testFitting 
    eta_exp  = ModCrossModel3( shearRate, p_testValue, c );
end

myFunct = @ModCrossModel3_;
weight = 1;



switch fittingType
    case 1  % Gauss- Levenberg
        [p1 X2] = lm(myFunct,p,shearRate,eta_exp,weight, dp,p_min,p_max,c);
    case 2  % Genetic- Algorithm
        [p1 X2] = OptimizeGA(myFunct,shearRate,p,c,eta_exp,p_min,p_max);
end

eta_calc  = ModCrossModel3_( shearRate, p1, c );
%eta_calc1  = ModCrossModel3_( shearRate, 0, c );
figure
c = graphExpData( shearRate, eta_exp, c );      
c = graphCalcData( shearRate, eta_calc, c );
%c = graphCalcData( shearRate, eta_calc1, c );


p_names = {'n' 'tau' 'D1'  'D2' 'A1' 'A2_tilde' 'D3' };

for i = 1 : length(c.p_index)
    fprintf('The best fitted value for %s is %f\n', p_names{c.p_index(i)},p1(i))
    
end

fprintf( 'The error with the fitted values is; %f  \n',X2)


if testFitting 
    fprintf('The original value of the parameters were:\n')
    p_testValue
end




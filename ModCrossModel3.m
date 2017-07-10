function [ eta ] = ModCrossModel3( gamma_dot, p, c )
% Computes viscosity as a function of shear rate, T and P, is the modified
% cross model 3 as defined in Moldex3D
% gamma_dot : shear rate
% eta : viscosity
% p :  parameter D3
% c
%   c.T : temperature for each shear rate
%   c.P : pressure for each shear rate
%   c.n : power law value
%   c.tau, c.D1, c.D2, c.A1, c.A2_tilde parameters for the  model

T_c = c.D2 + p * c.P; 
A2 = c.A2_tilde + p * c.P;
%parVal1 = -c.A1*(c.T+273-T_c);
%parVal2 = (A2+ c.T +273 - T_c);
eta_knot = c.D1 .* exp ( ( -c.A1*(c.T+273.15-T_c) ) ./ (A2+ c.T +273.15 - T_c));

eta = eta_knot ./ (1 + ( eta_knot .* gamma_dot ./ c.tau).^(1-c.n) ); 
eta = eta';
end


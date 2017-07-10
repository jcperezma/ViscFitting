function [ eta ] = ModCrossModel3_( gamma_dot, p, c )
% Computes viscosity as a function of shear rate, T and P, is the modified
% cross model 3 as defined in Moldex3D
% gamma_dot : shear rate
% eta : viscosity
% p : array
% c.T : temperature for each shear rate
% c.P : pressure for each shear rate
if isfield(c, 'n')
    n = c.n;
else
    n = p(c.p_index==1);  
end

if isfield(c, 'tau')
    tau = c.tau;
else
    tau = p(c.p_index==2);  
end
        
if isfield(c, 'D1')
    D1 = c.D1;
else
    D1 = p(c.p_index==3);  
end

if isfield(c, 'D2')
    D2 = c.D2;
else
    D2 = p(c.p_index==4);  
end
 
if isfield(c, 'A1')
    A1 = c.A1;
else
    A1 = p(c.p_index==5);  
end

if isfield(c, 'A2_tilde')
    A2_tilde = c.A2_tilde;
else
    A2_tilde = p(c.p_index==6);  
end

if isfield(c, 'D3')
    D3 = c.D3;
else
    D3 = p(c.p_index==7);  
end

   


T_c = D2 + D3 * c.P; 
A2 = A2_tilde + D3 * c.P;

eta_knot = D1 .* exp ( ( -A1.*(c.T+273.15-T_c) ) ./ (A2+ c.T +273.15 - T_c));

eta = eta_knot ./ (1 + ( eta_knot .* gamma_dot ./ tau).^(1-n) ); 
eta = eta';
end
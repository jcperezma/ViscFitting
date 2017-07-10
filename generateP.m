function [ p, p_min, p_max, c ] = generateP( c )
%UNTITLED10 Summary of this function goes here
%   Detailed explanation goes here


p = [];
p_min =[];
p_max =[];
c.p_index=[];
if ~isfield(c, 'n')
    p= [p c.n_guess];
    p_min = [p_min c.n_lims(1)];
    p_max = [p_max c.n_lims(2)];
    c.p_index = [c.p_index 1];
    
end

if ~isfield(c, 'tau')
    p= [p c.tau_guess];
    p_min = [p_min c.tau_lims(1)];
    p_max = [p_max c.tau_lims(2)];
    c.p_index = [c.p_index 2];
end

if ~isfield(c, 'D1')
    p= [p c.D1_guess];
    p_min = [p_min c.D1_lims(1)];
    p_max = [p_max c.D1_lims(2)];
    c.p_index = [c.p_index 3];
end

if ~isfield(c, 'D2')
    p= [p c.D2_guess];
    p_min = [p_min c.D2_lims(1)];
    p_max = [p_max c.D2_lims(2)];
    c.p_index = [c.p_index 4];
end

if ~isfield(c, 'A1')
    p= [p c.A1_guess];
    p_min = [p_min c.A1_lims(1)];
    p_max = [p_max c.A1_lims(2)];
    c.p_index = [c.p_index 5];
end

if ~isfield(c, 'A2_tilde')
    p= [p c.A2_tilde_guess];
    p_min = [p_min c.A2_tilde_lims(1)];
    p_max = [p_max c.A2_tilde_lims(2)];
    c.p_index = [c.p_index 6];
end

if ~isfield(c, 'D3')
    p= [p c.D3_guess];
    p_min = [p_min c.D3_lims(1)];
    p_max = [p_max c.D3_lims(2)];
    c.p_index = [c.p_index 7];
end

end


% This code checks some of the paper's calculations with regard to
% warm gas thruster performance.

clear;
close all;
clc;

%tot_dist_moment = 0.04; % tot. disturbance moment (Nm), from Fig. 14

tot_dist_moment = 0.02:0.001:0.08; % tot. disturbance moment (Nm), from Fig. 14

thrust = 0.025; % 25 mN, RCS maximum thrust
lrcs = 0.12; % 12cm, RCS thruster minimum moment arm, given 6u dimensions
moment_rcs = thrust * lrcs;
Isp = 105; % 105s specific impulse, lowest value for warm gas as per RPE
ge = 9.81; % 9.81 m/s^2 gravity

req_time_burn_rcs = tot_dist_moment / moment_rcs;
mprop_rate = thrust / (Isp * ge);
prop_used_rcs_only = req_time_burn_rcs * mprop_rate;

plot(tot_dist_moment, prop_used_rcs_only*1000);

%disp('Propellant needed (g):');
%disp(prop_used_rcs_only * 1000);
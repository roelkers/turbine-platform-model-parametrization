function [params,forces] = setup()

%%% Floating Platform Model
%%% Author: Rufus Oelkers
%%% Chair of Experimental Fluid Dynamics TU Berlin 

%%% Computation of eigenmodes of a
%%% floating platform installed under an offshore wind
%%% turbine

%%% Setup script

%%% For detailed explanation of parameters and model
%%% refer to paper of TU Denmark

%%% DOF 
%%% Vector q contains the 6 DOF of the system
%%% q(1): (x) fore-aft displacement
%%% q(2): (y) side-side displacement
%%% q(3): (z) negative-heave displacement
%%% q(4): (Theta_x) side-side roll
%%% q(5): (Theta_y) fore-aft roll
%%% q(6): (Theta_z) yaw

%%% ||
%%% ||
%%% ||======|-|   N (Nacelle)
%%% ||      | |    
%%% ||      | |
%%%         | |
%%%         | |
%%%         | |
%%%         |-|   I (Interface)
%%%         | |
%%%         |-|   M (Meta-centre point)
%%%         | |
%%% ~~~~~~~~| |~~ W (Water level) ~~~~~
%%%         |-|   G (Grav. centre)
%%%        /| |\  C (Mooring Cable suspension)
%%%       / |-| \ B (Buoyancy centre)
%%%      /  | |  \
%%%     /   |-|   \ E(Mono Pile bottom, ballast)

%%% System parameters 
%%% collected in parameter structure

%%% g  : gravitational acceleration [m/s2]
%%% rho_w: density of water [kg/m3]
%%% rho_t: density of tower [kg/m3]
%%% mn : total mass of rotor/nacelle [kg]
%%% mb : mass of ballast on bottom of monopile [kg]
%%% t  : thickness of tower ring area [m]
%%% lt  : total tower height [m]
%%% leb : distance from point A to B [m]
%%% lbg : distance from point B to G [m]
%%% lgw : distance from point G to W [m]
%%% lwi : distance from point W to I [m]
%%% lin : distance from point I to N [m]
%%% lcg : distance between cable susp C and gravitational center G [m]
%%% dw : water depth  [m]
%%% D  : diameter of turbine tower [m]
%%% m0 : total mass (0th order mass moment) [kg]
%%% m1 : 1st order mass moment [kg m]
%%% m2 : 2nd order mass moment (mass moment of inertia in roll) [kg m2]
%%% It : mass moment of inertia in torsion [kg m2]
%%% Iw : inertia moment at water line [kg m2]
%%% vw : displaced water volume [kg3]
%%% kc : cable pre-stress force [kg m s3]

%%% Tower width assumed constant
params.D = 5;
params.g = 9.81;
params.rho_w = 1100;
params.rho_t = 7850;
params.t = 0.1;
params.lt = 135;
params.fc = 89000;
params.mn = 2.385e005;
params.mb = 7.711e005;
params.mt = mass_tower_of_monopile(params);
params.m0 = mass_whole_turbine(params);
params.m1 = 5.9605e-008; 

params.lew = water_depth_monopile(params);
params.leb = buoyancy_centre(params);
params.leg = gravity_centre(params);

params.m2 = mass_moment_inertia_in_roll(params);

params.lbg = params.leg-params.leb;
params.dw = 300;

params.It = mass_moment_inertia_in_yaw(params);
params.Iw = inertia_moment_at_water_line(params);
params.vw = displaced_water_volume(params);

%%% Forces

%%% kcx : cable horizontal stiffness, x-direction [N/m]
%%% kcy : cable horizontal stiffness, y-direction [N/m]
%%% kcz : cable vertical stiffness, z-direction [N/m]
%%% kbz : vertical stiffness due to buoyancy [N/m]
%%% khsx : water level hydrostatic stiffness due to fore-aft-roll [N/rad]
%%% khsy : water level hydrostatic stiffness due to side-side-roll [N/rad]
%%% ktc : cable stiffness due to torsion [N/rad]

forces.kcx = 1.2606e005;
forces.kcy = 1.2606e005;
forces.kcz = 1.2606e005;
forces.kbz = vertical_stiffness_due_to_buoyancy(params);
forces.khsx = hydrostatic_stiffness_due_to_fore_aft_roll(params);
forces.khsy = hydrostatic_stiffness_due_to_fore_aft_roll(params);
forces.ktc = cable_stiffness_due_to_torsion(params);

end

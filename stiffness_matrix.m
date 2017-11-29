function [ K ] = stiffness_matrix( params,forces )

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

%%% System parameters 

%%% collected in parameter structure
%%% mn : total mass of rotor/nacelle
%%% m0 : total mass (0th order mass moment)
%%% m1 : 1st order mass moment
%%% m2 : 2nd order mass moment (mass moment of inertia in roll)
%%% It : mass moment of inertia in torsion
%%% leb : distance from point A to B
%%% lbg : distance from point B to G
%%% lgw : distance from point G to W
%%% lwi : distance from point W to I
%%% lin : distance from point I to N
%%% dw : water depth

lcg = params.lcg;
lbg = params.lbg;

%%% Forces

%%% kcx : cable horizontal stiffness, x-direction
%%% kcy : cable horizontal stiffness, y-direction
%%% kcz : cable vertical stiffness, z-direction
%%% kbz : vertical stiffness due to buoyancy
%%% khsx : water level hydrostatic stiffness due to fore-aft-roll
%%% khsy : water level hydrostatic stiffness due to side-side-roll
%%% ktc : cable stiffness due to torsion

kcx = forces.kcx;
kcy = forces.kcy;
kcz = forces.kcz;
kbz = forces.kbz;
khsx = forces.khsx;
khsy = forces.khsy;
ktc = forces.ktc;

K = [kcx      ,0       ,0        ,0             ,-lcg*kcx      ,0   ;...
     0        ,kcy     ,0        ,lcg*kcy       ,0             ,0   ;...
     0        ,0       ,kcz+kbz  ,0             ,0             ,0   ;...
     0        ,lcg*kcy ,0        ,khsx+lbg^2*kcy,0             ,0   ;...
     -lcg*kcx ,0       ,0        ,0             ,khsy+lbg^2*kcx,0   ;...
     0        ,0       ,0        ,0             ,0             ,ktc ];

end


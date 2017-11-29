function M = mass_matrix(params)

%%% Floating Platform Model
%%% Author: Rufus Oelkers
%%% Chair of Experimental Fluid Dynamics TU Berlin 

%%% Computation of eigenmodes of a
%%% floating platform installed under an offshore wind
%%% turbine

%%% Main Function

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

m0 = params.m0;
m1 = params.m1;
m2 = params.m2;
It = params.It;

M = [m0 ,0  ,0  ,0  ,m1 ,0 ;...
     0  ,m0 ,0  ,m1 ,0  ,0 ;...
     0  ,0  ,m0 ,0  ,0  ,0 ;...
     0  ,m1 ,0  ,m2 ,0  ,0 ;...
     m1 ,0  ,0  ,0  ,m2 ,0 ;...
     0  ,0  ,0  ,0  ,0  ,It];

end


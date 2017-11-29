function [ freqs,modes,D ] = natural_frequencies()

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
%%%     /   |-|   \ E(Mono Pile bottom,ballast)

%%% Obtain system parameters and forces

[params,forces] = setup();

%%% Construct mass and stiffness matrix

M = mass_matrix(params);
K = stiffness_matrix(params,forces);

%%% Solve eigenvalue problem
[V,D] = eig(K,M);

%%%calculate frequencies as roots of lambda (solution of characteristic
%%%equation)
%%%omega = srqt(lambda)
%%%f = omega/2*Pi
freqs = zeros(6,1);
for i=1:6
    freqs(i) = sqrt(D(i,i))/(2*pi);
end
%%%mode shapes
modes = V;

end


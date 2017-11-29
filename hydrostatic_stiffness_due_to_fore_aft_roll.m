function [ khs ] = hydrostatic_stiffness_due_to_fore_aft_roll( params )

%%% moment equilibrium in point G 

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
%%%     /   |-|   \ E(Mono Pile bottom)

vw = params.vw;
g  = params.g;
rho_w = params.rho_w;
lbg = params.lbg;
Iw = params.Iw;

%%% specific weight of sea water gamma
gamma_w = rho_w * g;

khs = gamma_w * (Iw - lbg * vw);

end


function [ mt ] = mass_tower_of_monopile( params )

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

lt = params.lt;
rho_t = params.rho_t;
t = params.t;
D = params.D;

%%% For starters the density of the tower is assumed uniform
%%% If nonuniform density shall be used the script shall integrate 
%%% the mass instead
%%% rho_tower is defined as mass per volume [kg/m3]
%%% so multiplying by the area of the ring and then by the length will give
%%% the total mass of the tower of the monopile

A_ring = pi/4*(D^2-(D-2*t)^2);
mt = lt*A_ring*rho_t;

end


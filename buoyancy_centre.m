function [ leb ] = buoyancy_centre( params )

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

%%% calculates centre of buoyancy 
%%% centre of buoyancy is the centre of gravity of the displaced water
%%% volume

%%% For now the tower is assumed to be cylindrical which means
%%% the center of buoyancy is exactly in the middle between water level
%%% and bottom of monopile

lew = params.lew;

leb = params.lew/2;

end


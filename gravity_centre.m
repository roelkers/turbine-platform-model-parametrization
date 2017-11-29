function [ leg ] = gravity_centre( params )

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

%%% calculates the centre of gravity for the body
%%% it is obviously located on the x and y axis
%%% the z value can be obtained from the centres of gravities of the
%%% nacelle, tower and ballast

%%% For starters density of tower is here assumed to be uniform

lt = params.lt;
rho_t = params.rho_t;
mn = params.mn;
mb = params.mb;
t = params.t;
D = params.D;

%mass of tower
A_ring = pi/4*(D^2-(D^2-2*t)^2);
mt = lt*A_ring*rho_t;

%centre of gravity for monopile tower
zt = lt/2;
%centre of gravity for nacelle/rotor
zn = lt;
%centre of gravity for ballast attached to monopile bottom
zbal = 0;

leg = 1/(mt+mn+mb)*(zt*mt + zn*mn + zbal*mb);

end


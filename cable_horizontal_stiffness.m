function [ kc ] = cable_horizontal_stiffness( params )

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

w = params.w;
lc = params.lc;
c = params.c;
dw = params.dw;
lew = params.lew;
lcg = params.lcg;
leg = params.leg;

lec  = leg - lcg;
%%%cable height is water depth + distance point W to point C
h = dw + lec - lew;

%%% solves the catenal equation iteratively to determine the wavelength of 
%%% the solution, then calculates the cable force based on the 
%%% weight per unit-length w (should be reduced for buoyancy)

lambda_start = 0.0001;

%wavelength
wl = fzero(@(lambda) sinh(lambda*c)-lambda*lc,lambda_start);

fcable = w/wl;

%%% stiffness
kc = (sinh(wl*c)-1)/(sinh(wl*c)-h/c) * fcable/c;
end
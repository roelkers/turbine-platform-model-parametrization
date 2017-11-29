function [ kbz ] = vertical_stiffness_due_to_buoyancy( params )

%%% An increasse in the water surface level will also change the location
%%% of buoyancy and hence the buoyancy force.

%%% monopile is assumed to have a constant diameter over z

rho_w = params.rho_w;
g = params.g;
D = params.D;

%%% specific weight of sea water
gammaw = rho_w * g;

kbz = gammaw * D;

end


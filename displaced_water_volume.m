function [ vw ] = displaced_water_volume( params )

%%% Total displaced water volume
%%% is equal to total mass of tower divided by water density

m0 = params.m0;
rho_w= params.rho_w;

vw = m0/rho_w;

end


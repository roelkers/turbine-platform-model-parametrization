function [ Iw ] = inertia_moment_at_water_line( params )

D = params.D;

Iw = pi/64 * D^4;

end


function [ It ] = mass_moment_inertia_in_yaw( params )

%%%Calculate mass moment of inertia in roll

%%%Is based on a cylindrical formula where the monopile is rotated around
%%%the z-axis. nacelle and ballast are ignored here, they are for starters
%%%assumed to be point masses on the z axis and have no impact on yaw.

mt = params.mt;
D = params.D;

It = 1/2 * mt * 1/4*D^2;

end


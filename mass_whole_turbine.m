function [ m0 ] = mass_whole_turbine( params )

%%% mass of whole turbine consists of
%%% -mass of nacelle/rotor
%%% -mass of monopile
%%% -mass of ballast

mn = params.mn;
mb = params.mb;
mt = params.mt;

m0 = mn + mb + mt;


end


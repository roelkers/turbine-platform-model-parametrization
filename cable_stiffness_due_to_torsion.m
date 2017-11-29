function [ ktc ] = cable_stiffness_due_to_torsion( params )

%%% The cable pre-tensioning force must be known in order to 
%%% determine the cable torsion stiffness.

D = params.D;
fc = params.fc;

%%% It is assumed that there are three mooring cables

cn = 3;

%%% The lines are attached to the outside of the monopile,
%%% so the lever length is D/2

ktc = cn * fc * D/2;


end


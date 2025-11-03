function fire = fire_step(fire, params)
% fire_step - perform one full simulation step of fire dynamics
%
% [ fire ] = fire_step( fire, params )
%
% INPUTS :
%   fire   - structure containing the current fire intensity grid
%   params - structure containing simulation parameters:
%            . spread_rate : how quickly fire spreads to neighbors (int)
%            . decay_rate  : how fast fire weakens (int)
%
% OUTPUTS :
%   fire   - structure with updated intensity grid after:
%            1) spreading fire to neighbors
%            2) applying decay
%            3) clamping values to [0, 1]

    % spread fire outward
    fire = fire_spread(fire, params);

    % decay everywhere
    fire = fire_decay(fire, params);

    % between 0 to 1
    fire.intensity(fire.intensity > 1) = 1;
    fire.intensity(fire.intensity < 0) = 0;

end
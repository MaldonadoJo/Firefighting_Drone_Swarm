function fire = fire_decay(fire, params)
% fire_decay - apply intensity decay across the entire fire grid
%
% [ fire ] = fire_decay( fire, params )
%
% INPUTS :
%   fire   - structure with field 'intensity', a 2D matrix representing fire intensities
%   params - structure with parameter:
%            • decay_rate : amount subtracted from each cell per step
%
% OUTPUTS :
%   fire   - updated fire structure with decayed intensity values


    fire.intensity = fire.intensity - params.decay_rate;
end
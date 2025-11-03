function fire = fire_intensity(params)
% fire_intensity - initialize the fire intensity grid
%
% [ fire ] = init_fire( params )
%
% INPUTS :
%   params - structure containing the fire setup parameters:
%            • rows, cols        : dimensions of the grid
%            • starting_fires    : N×2 matrix of [row, col] fire start locations
%            • start_intensity   : number value for starting fire intensity (ex, 1)
%
% OUTPUTS :
%   fire   - structure containing the initialized intensity matrix (rows × cols)

 intensity = zeros(params.rows, params.cols); % create 2D grid of zeros

    for kk = 1:size(params.starting_fires, 1) % Place initial fire(s)
        rows = params.starting_fires(kk, 1);
        cols = params.starting_fires(kk, 2);
        intensity(rows, cols) = params.start_intensity;   % typically 1
    end

    fire.intensity = intensity;

end
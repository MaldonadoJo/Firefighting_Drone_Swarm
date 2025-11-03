function fire = fire_spread(fire, params)
% fire_spread - spread fire intensity to neighboring cells
%
% [ fire ] = fire_spread( fire, params )
%
% INPUTS :
%   fire   - structure with field 'intensity', a 2D matrix representing current fire state
%   params - structure with parameter:
%            . spread_rate : cell's intensity added to each neighbor
%
% OUTPUTS :
%   fire   - updated fire structure with new intensity values after spreading


    old = fire.intensity;
    new_intensity = old;  % Copy 

    [Rows, Cols] = size(old);

    for rows = 1:Rows
        for cols = 1:Cols
            if old(rows, cols) > 0
                
                if rows > 1 % spread north
                    new_intensity(rows-1, cols) = new_intensity(rows-1, cols) + params.spread_rate * old(rows, cols);
                end
                
                if rows < Rows % spread south
                    new_intensity(rows+1, cols) = new_intensity(rows+1, cols) + params.spread_rate * old(rows, cols);
                end
                
                if cols > 1 % spread west
                    new_intensity(rows, cols-1) = new_intensity(rows, cols-1) + params.spread_rate * old(rows, cols);
                end
                
                if cols < Cols % spread east
                    new_intensity(rows, cols+1) = new_intensity(rows, cols+1) + params.spread_rate * old(rows, cols);
                end
            end
        end
    end

    fire.intensity = new_intensity;
end
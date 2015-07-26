classdef SPX_Display

methods(Static)

    function matrix(A, options)
        fresh_figure = true;
        % We are choosing our colormap
        color_map = 'copper';
        if nargin == 2
            if isfield(options, 'fresh_figure')
                fresh_figure = options.fresh_figure;
            end
            if isfield(options, 'color_map')
                color_map = options.color_map;
            end
        end
        if fresh_figure
            SPX_Figures.full_screen_figure;
        end
        % The matrix displayed as image
        imagesc(A);
        % Set the color map
        colormap(color_map);
        % Make sure that axis is square.
        axis square;
        % Do not show the axis.
        axis off;
    end


    function [ figH ] = display_gram_matrix( Phi )
        % Displays the Gram matrix of a given matrix
        G = Phi' * Phi;
        absG = abs(G);
        % Let us set all the diagonal elements to zero
        absG(logical(eye(size(absG)))) = 0;
        figH = SPX_Figures.full_screen_figure;
        imagesc(absG);
        colormap(gray);
    end

end

end



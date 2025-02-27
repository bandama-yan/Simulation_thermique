function [best_positions] = optimiser_positions_resistances(Nbpt, Nbtri, Coorneu, Numtri, Topt,T0,n, Theta, alpha, beta)
  
    num_points_x = 20;
    num_points_y = 20;
    x_grid = linspace(min(Coorneu(:,1)), max(Coorneu(:,1)), num_points_x);
    y_grid = linspace(min(Coorneu(:,2)), max(Coorneu(:,2)), num_points_y);

    best_cost = Inf;
    best_positions = [];

    for i = 1:length(x_grid)
        for j = 1:length(y_grid)
            positions = [ones(n,1) * 10000, repmat(x_grid(i), n, 1), repmat(y_grid(j), n, 1)];

            Mmat = matrice_masse(Nbpt, Nbtri, Coorneu, Numtri);

            T = T0 + Theta(:,2:end) * alpha(2:end, :);

            % Calcul de J(αm)
            J_alpha = 0.5 * sum(sum((T - Topt).^2 .* Mmat)) + 0.5 * beta * norm(alpha)^2;
           

            if J_alpha < best_cost
                best_cost = J_alpha;
                best_positions = positions;
            end
        end
    end
end

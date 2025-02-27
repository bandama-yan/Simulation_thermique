function T = tableau_T(Nbpt, Nbtri, Coorneu, Refneu, Numtri, Reftri, val_resistances, ka, kp)

    N = size(val_resistances,1);
    T = zeros(Nbpt, N+1);
    TD = 300;
    K = matrice(Nbpt, Nbtri, Coorneu, Numtri, Reftri, ka, kp);
    
    Td = TD * (Refneu == 3); % Appliquer la température aux bords
    c = -K * Td;
    [Kmod, cmod] = elimination(K,Nbpt, c, Refneu, TD);
    T(:,1) = Kmod \ cmod;
    TD = 0; % pour les résistances
    

    for i = 1:N
        r = val_resistances(i, :);
        f = second_membre1(Nbpt, Nbtri, Coorneu, Numtri, r);
        g = second_membre2(Nbpt, K, Refneu, TD);
        c = f - g;
        [Kmod, cmod] = elimination(K,Nbpt, c, Refneu, TD);

        % Résolution du problème pour la résistane i+1
        T(:, i+1) = Kmod \ cmod;
    end

end

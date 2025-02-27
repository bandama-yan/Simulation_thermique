function Mmat = matrice_masse(Nbpt, Nbtri, Coorneu, Numtri)
    % Initialiser la matrice de masse globale
    Mmat = sparse(Nbpt, Nbpt); % Matrice creuse pour optimiser les calculs

    for l = 1:Nbtri
        % Indices des sommets du triangle
        s1 = Numtri(l, 1);
        s2 = Numtri(l, 2);
        s3 = Numtri(l, 3);

        % Coordonnées des sommets
        x_s = [Coorneu(s1,1), Coorneu(s2,1), Coorneu(s3,1)];
        y_s = [Coorneu(s1,2), Coorneu(s2,2), Coorneu(s3,2)];

        % Calcul de la matrice de masse locale
        Mloc = calcul_Mloc(x_s, y_s);

        % Assemblage dans Mmat
        for k = 1:3
            for m = 1:3
                i = Numtri(l, k);
                j = Numtri(l, m);
                Mmat(i, j) = Mmat(i, j) + Mloc(k, m);
            end
        end
    end
end

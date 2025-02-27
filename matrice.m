function Kmat=matrice(Nbpt,Nbtri,Coorneu,Numtri,Reftri,ka,kp)
    % Initialiser la matrice Kmat
    Kmat = sparse(Nbpt, Nbpt); % On fait ce choix pour optmiser les calculs
    
    for l = 1:Nbtri
        if Reftri(l)==1
            kappa=kp;
        else
            kappa=ka;
        end
        % Indices des sommets du triangle l
        s1 = Numtri(l, 1); % Numéro du sommet 1
        s2 = Numtri(l, 2); %  ....            2
        s3 = Numtri(l, 3); %  ....            3
    
        % Coordonnées des sommets
        x_s = [Coorneu(s1,1), Coorneu(s2,1), Coorneu(s3,1)];
        y_s = [Coorneu(s1,2), Coorneu(s2,2), Coorneu(s3,2)];
        
        % Calcul de la matrice Kloc 
        Kloc = calcul_Kloc(x_s,y_s,kappa);
        
        % Assemblage dans Kmat
        for k = 1:3
            for m = 1:3
                i = Numtri(l,k);
                j = Numtri(l,m);
                Kmat(i, j) = Kmat(i, j) + Kloc(k, m);
            end
        end
    end
end
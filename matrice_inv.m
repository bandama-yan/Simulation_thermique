function A =matrice_inv(Nbtri, Coorneu, Numtri, Reftri,T, beta,n)

    [~,n] = size(T);
    % Initialisation de la matrice
    A = beta * eye(n);

    for l = 1:Nbtri
      if Reftri(l) == 1  % On est sur le pare choc 
         % Indices des sommets du triangle l
        s1 = Numtri(l, 1); % Numéro du sommet 1
        s2 = Numtri(l, 2); %  ....            2
        s3 = Numtri(l, 3); %  ....            3
     
        % Coordonnées des sommets
        x_s = [Coorneu(s1,1), Coorneu(s2,1), Coorneu(s3,1)];
        y_s = [Coorneu(s1,2), Coorneu(s2,2), Coorneu(s3,2)];

        % Calcul de la matrice locale 
        Mloc=calcul_Mloc(x_s,y_s);
      
        Num = Numtri(l,:);
        for r = 1:n
            for s = 1:n
                for i = 1:3
                    for j = 1:3
                        A(r,s) = A(r,s) + Mloc(i,j) * T(Num(i), r) * T(Num(j), s);
                    end
                end
            end
        end
      end
    end

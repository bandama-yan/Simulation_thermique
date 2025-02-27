function f = second_membre1(Nbpt, Nbtri, Coorneu,Numtri, Resistances) 
    % Initialisation du vecteur second membre
    f = zeros(Nbpt, 1);

    for r=1:size(Resistances,1)
        for l = 1:Nbtri
            % Indices des sommets du triangle l
            s1 = Numtri(l, 1);
            s2 = Numtri(l, 2);
            s3 = Numtri(l, 3);
            
            % Coordonnées des sommets
            x_s = [Coorneu(s1,1), Coorneu(s2,1), Coorneu(s3,1)];
            y_s = [Coorneu(s1,2), Coorneu(s2,2), Coorneu(s3,2)];
            
            
            % Vérifier si M(x,y) est dans le triangle (Barycentrique)
            if point_dans_triangle(Resistances(r,2),Resistances(r,3),x_s, y_s) 
                %Calcul des coordonnées barycentriques 
                lambda = coordonnees_barycentriques(Resistances(r,2),Resistances(r,3),x_s, y_s);
    
                % Assemblage du second membre
                f(s1) = f(s1)+ Resistances(r,1) * lambda(1);
                f(s2) = f(s2)+Resistances(r,1) * lambda(2);
                f(s3) = f(s3)+Resistances(r,1) * lambda(3);
            end
        end
    end
  
end
    
  

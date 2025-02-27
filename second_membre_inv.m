function b = second_membre_inv(Nbtri,Coorneu,Numtri,Reftri,T,Topt,n)

%Initialisation
b=zeros(n,1);
for l = 1:Nbtri
    if Reftri(l) ==1  % On est sur le pare choc
     
        % Indices des sommets du triangle l
        s1 = Numtri(l, 1); % Numéro du sommet 1
        s2 = Numtri(l, 2); %  ....            2
        s3 = Numtri(l, 3); %  ....            3
    
        % Coordonnées des sommets
        x_s = [Coorneu(s1,1), Coorneu(s2,1), Coorneu(s3,1)];
        y_s = [Coorneu(s1,2), Coorneu(s2,2), Coorneu(s3,2)];
        x31 = x_s(3) - x_s(1); 
        y31 = y_s(3) - y_s(1);
        x23 = x_s(2) - x_s(3);
        y23 = y_s(2) - y_s(3);
        Delta = x23 * y31 - x31 * y23;

        Mloc= abs(Delta)/6*ones(3,1);
        for r = 1:n
            for i = 1 : 3
                b(r) = b(r) + Mloc(i)*T(Numtri(l,i),r)*(Topt - T(1,r));
            end
        end
    end
end
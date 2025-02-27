function Mloc=calcul_Mloc(x_s,y_s) 
    Mloc=zeros(3);
% Calculs intermédiaires
    x31 = x_s(3) - x_s(1); 
    y31 = y_s(3) - y_s(1);
    x23 = x_s(2) - x_s(3);
    y23 = y_s(2) - y_s(3);
    Delta = x23 * y31 - x31 * y23;

    for i=1:3
            for j=1:3
                if i == j
                    Mloc(i,i) = abs(Delta)/12;
                else
                    Mloc(i,j) = abs(Delta)/24;
                end
            end
    end
end

function lambda = coordonnees_barycentriques(x,y,x_s, y_s)
    
    % Calculs intermédiaires
    x12 = x_s(1) - x_s(2); 
    y12 = y_s(1) - y_s(2);
    x31 = x_s(3) - x_s(1); 
    y31 = y_s(3) - y_s(1);
    x23 = x_s(2) - x_s(3);
    y23 = y_s(2) - y_s(3);
    Delta = x23 * y31 - x31 * y23;
    
    % Calcul des coordonnées barycentriques du point (x, y)
    lbd1 = (y23 * (x - x_s(3)) - x23 * (y - y_s(3))) / Delta;
    lbd2 = (y31 * (x - x_s(1)) - x31 * (y - y_s(1))) / Delta;
    lbd3 = (y12 * (x - x_s(2)) - x12 * (y - y_s(2))) / Delta;
    lambda = [lbd1, lbd2, lbd3];
end

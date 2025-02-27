function Kloc = calcul_Kloc(x_s,y_s,kappa)
    % Calculs intermédiaires
    x12 = x_s(1) - x_s(2); 
    y12 = y_s(1) - y_s(2);
    x31 = x_s(3) - x_s(1); 
    y31 = y_s(3) - y_s(1);
    x23 = x_s(2) - x_s(3);
    y23 = y_s(2) - y_s(3);
    Delta = x23 * y31 - x31 * y23;

   
    % Calcul des gradients
    grad_lbd1 = (1 / Delta) * [y23; -x23];
    grad_lbd2 = (1 / Delta) * [y31; -x31];
    grad_lbd3 = (1 / Delta) * [y12; -x12];
    
    % Construction de la matrice locale
    grad_lbd = [grad_lbd1, grad_lbd2, grad_lbd3] ;
    Kloc = (abs(Delta) / 2) * (grad_lbd' * grad_lbd)*kappa;
 
end
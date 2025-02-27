function inside = point_dans_triangle(x, y, x_s, y_s)
% On utilise les coordonnées barycentriques pour vérifier lappartenance dun
% point au triangle
    lambda = coordonnees_barycentriques(x,y,x_s, y_s);
    inside = (lambda(1,1) >= 0) && (lambda(1,2) >= 0) && (lambda(1,3) >= 0);
end

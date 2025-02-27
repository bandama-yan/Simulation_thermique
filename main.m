%% PROBLEME DIRECT
% Paramètres du problème
ka = 1; % Conductivité dans l'air
kp=10 ; % Conductivité dans le pare-chocs
TD=300; %Température au bord
Resistances=[1e4,3/4,3/4]; % On peut aussi ajouter plusieurs résistances
nom_maillage ='maillagefin'; 

% Charger le maillage et les coordonnées
[Nbpt, Nbtri, Coorneu, Refneu, Numtri, Reftri] = read_amdba(nom_maillage);

% Visualiser le maillage
%affichemaillage(nom_maillage,"Maillage");

% Construction de la matrice Kmat
K = matrice(Nbpt,Nbtri,Coorneu,Numtri,Reftri,ka,kp);

%Calcul du second membre 
f=second_membre1(Nbpt, Nbtri, Coorneu, Numtri,Resistances);
g=second_membre2(Nbpt,K,Refneu,TD);
c=f-g;

% Elimination de la condition de Dirichlet
[Kmod, cmod] = elimination(K,Nbpt, c, Refneu, TD);

% Résolution du système linéaire
t=Kmod\cmod;

% Visualiser la solution
trisurf(Numtri,Coorneu(:,1),Coorneu(:,2),t);

% - - - - - - - - - -- - - - - - - - - - - - - - - - - - - - - - - - - - -
%% PROBLEME INVERSE
% - - - - - - - - - -- - - - - - - - - - - - - - - - - - - - - - - - - - -

%PAramètres
ka = 1; % Conductivité dans l'air
kp=10 ; % Conductivité dans le pare-chocs
TD=300; %Température au bord
Topt=500; 
beta = 1e-4;  
nom_maillage ='maillagefin'; 
val_resistances =[1e4, 0.2, 0.3; 1e4, 0, 0.4; 1e4, -0.4, 0.3; 1e4, 0.2, -0.1; 1e4, 0, -0.1; 1e4, -0.2, -0.3];

% Charger le maillage et les coordonnées
[Nbpt, Nbtri, Coorneu, Refneu, Numtri, Reftri] = read_amdba(nom_maillage);

% Construction du tableau Theta
Theta=tableau_T(Nbpt, Nbtri, Coorneu, Refneu, Numtri, Reftri, val_resistances, ka, kp);
[~,n] = size(Theta);

% Construction de la matrice A
A=matrice_inv(Nbtri, Coorneu, Numtri, Reftri,Theta, beta,n);

% Construction du second membre
b=second_membre_inv(Nbtri,Coorneu,Numtri,Reftri,Theta,Topt,n);

% Resolution du système linéaire
alpha=A\b;

% Calcul de la norme 2 de alpha
norm_alpha = norm(alpha, 2);

% Construction de T
K0 = matrice(Nbpt,Nbtri,Coorneu,Numtri,Reftri,ka,kp);
f0=second_membre1(Nbpt, Nbtri, Coorneu, Numtri,[]);
g0=second_membre2(Nbpt,K,Refneu,TD);
c0=f0-g0;
[Kmod0, cmod0] = elimination(K0,Nbpt, c0, Refneu, TD);
T0=Kmod0\cmod0;
T = T0 + Theta(:,2:end) * alpha(2:end, :);

% Calcul de l'erreur thermique
dT = T - Topt*ones(size(T));
erreur = sqrt(dT' * (Mmat * dT)); 

% Calcul de la norme L2 de Topt
norm_Topt = sqrt((Topt*ones(size(T)))' * (Mmat * Topt*ones(size(T))));

% Calcul de l'erreur relative
erreur_relative = erreur / norm_Topt;
disp('erreur relative: ');
disp(erreur_relative);

% "A améliorer"
% Optimisation de la position des résistances
best_resistances = optimiser_positions_resistances(Nbpt, Nbtri, Coorneu,  Numtri,  Topt,T0, n, Theta, alpha, beta);

%Affichage des résultats
disp('Meilleure position des résistances :');
disp(best_resistances);



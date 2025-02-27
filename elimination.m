function [Kmod, cmod] = elimination(K,Nbpt, c, Refneu, TD)
    D = (Refneu == 3);   % On est sur le bord de température TD
    Kmod = K;
    cmod = c;

    % Appliquer la technique de pseudo-élimination
    Kmod(:,D)=sparse(Nbpt,sum(D));
    Kmod(D,:)=sparse(sum(D),Nbpt);
    Kmod(D,D)=speye(sum(D));
    cmod(D)=TD*ones(sum(D),1);

end

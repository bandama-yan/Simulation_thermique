function g = second_membre2(Nbpt, K,Refneu, TD)
    
    tD = zeros(Nbpt,1);
    for i=1:Nbpt
        if Refneu(i) == 3
            tD(i) = TD; 
        end
    end
    g=K*tD;
end

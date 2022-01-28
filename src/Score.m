function score = Score(Genome, NumberOfBits, NumberOfGaussians, Input)
%SCORE calculates the score of the genome
%   @param Genome
    u1 = Input(1,:);
    u2 = Input(2,:);
    G = zeros(length(u1),1);
    F = zeros(length(u1),1);
    [a, c1, c2, Sigma1, Sigma2] = Decode(Genome, NumberOfBits, NumberOfGaussians);
    for i = 1:length(u1)
        
         F(i) = ObjectiveFunction(u1(i), u2(i));
        for j = 1:NumberOfGaussians
            Gg(j) = Gaussian(u1(i),u2(i), c1(j), c2(j), Sigma1(j), Sigma2(j), a(j));
        end
        G(i) = sum(Gg);
        
        
    end

    score = immse(F, G);
    
end


function score = Score(Genome, NumberOfBits, NumberOfGaussians)
%SCORE calculates the score of the genome
%   @param Genome
    u1 = [-1:0.02:2];
    u2 = [-2:0.02:1];
    Scores = zeros(length(u1),1);
    [a, c1, c2, Sigma1, Sigma2] = Decode(Genome, NumberOfBits, NumberOfGaussians);
    for i = 1:length(u1)
        G = 0;
            
        for j = 1:NumberOfGaussians
            G = G + a(j)*Gaussian(u1(i),u2(i), c1(j), c2(j), Sigma1(j), Sigma2(j));
        end
        
        Scores(i) = (ObjectiveFunction(u1(i), u2(i)) - G)^2;
        
    end

    score = mean(Scores);
    
end


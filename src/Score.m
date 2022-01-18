function score = Score(Genome, NumberOfBits, NumberOfWords)
%SCORE calculates the score of the genome
%   @param Genome
    u1 = [-1:0.025:2];
    u2 = [-2:0.025:1];
    DecodedGenome = Decode(Genome, NumberOfBits, NumberOfWords);
    Scores = zeros(length(u1),1);
    Coefficients = DecodedGenome(:,1);
    c1 = DecodedGenome(:,2);
    Sigma1 = DecodedGenome(:,3);
    c2 = DecodedGenome(:,4);
    Sigma2 = DecodedGenome(:,5);
    if sum(Coefficients) > 15
        score = 1e5;
        return;
    end
    for i = 1:length(u1)
        G = 0;
        for j =1:NumberOfWords
            if Sigma1(j) == 0 || Sigma2(j) == 0
                score = 1e5;
                return
            end
            G = G + Coefficients(j)*Gaussian(u1(i),u2(i), c1(j), c2(j), Sigma1(j), Sigma2(j));
        end
        Scores(i) = ObjectiveFunction(u1(i),u2(i)) - G;
        
    end
    score = abs(mean(Scores));
    
end


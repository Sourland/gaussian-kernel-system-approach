function Answer = Fitness(GenomeScore)
%FITNESS checks if the fitness of the model is sufficient enough using the
%score of best genome for every generation
%   @param score the scores to use to evaluate 
    if GenomeScore == 0
        Answer  = 1e9;
    else
        Answer = 1./GenomeScore;
    end
end


function [TheChosenOnes, Probabilities] = RouletteSelection(Population, PopulationNumber, HowMany, Scores)
%SELECTION selects the best genome for reproducing
%   @param Population is the population of an i-th generation
%   @param HowMany is how many parents we want to chose
%   @param Scores the scores of each genome of the population
    
    Fitness = 1./Scores;
    TotalFitness = sum(Fitness);
    for i = 1:PopulationNumber
        RelativeFitness(i) = Fitness(i)/TotalFitness;
    end
    for i = 1:PopulationNumber
        Probabilities(i) = sum(RelativeFitness(1:i));
    end
    
    TheChosenOnes = [];
    for n = 1:HowMany
        r = rand;
        for i = 1:PopulationNumber
            if r < Probabilities(i)
                TheChosenOnes = [TheChosenOnes; Population(i,:)];
                break
            end
        end
    end
    if isempty(TheChosenOnes)
        TheChosenOnes = Population(randi(PopulationNumber, HowMany, 1),:);
    end
        
end

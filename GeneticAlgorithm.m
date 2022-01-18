function [BestGenome, BestScore] = GeneticAlgorithm(NumberOfBits, NumberOfWords, NumberOfGenerations, PopulationNumber, CrossoverRate, MutationRate, Seniority)
%GENETIC_ALGORITHM finds the solution to the problem - An analytic
%expression of the unknown function
%   @param NumberOfBits the number of bits per word
%   @param NumberOfWords the number of words per genome
%   @param NumberOfGenerations the max iterrations
%   @param PopulationNumber the number of total genomes in every generation
%   @param CrossoverRate the probabiliy of a crossover between two parents
%   @param MutationRate the probability of a mutation in a genome
    
    Population = CreatePopulation(PopulationNumber, NumberOfBits, NumberOfWords);
    
    BestGenome = Population(1,:);
    BestScore = Score(BestGenome, NumberOfBits, NumberOfWords);
    GenomeScores = zeros(PopulationNumber,1);
    for i = 1:NumberOfGenerations
        
        for GenomeIndex = 1:PopulationNumber
            GenomeScores(GenomeIndex) = Score(Population(GenomeIndex,:), NumberOfBits, NumberOfWords);
        end
        
        for GenomeIndex = 1:PopulationNumber
            if GenomeScores(GenomeIndex) < BestScore
                BestGenome = Population(GenomeIndex,:);
                BestScore = Score(BestGenome, NumberOfBits, NumberOfWords);
            end
        end
        if Fitness(BestScore) > 2*1e4
            fprintf('Expression Found at iteration %d\n', i)
            return;
        end
        
        Selected = RouletteSelection(Population, PopulationNumber, Seniority*PopulationNumber, GenomeScores);
        Children = [];
        Indices = randi(floor(Seniority*PopulationNumber), (1-Seniority)*PopulationNumber, 2);
        for j = 1:(1-Seniority)*PopulationNumber/2
            Parent1 = Selected(Indices(j,1),:);
            Parent2 = Selected(Indices(j,2),:);
            [Child1, Child2] = Crossover(Parent1, Parent2, CrossoverRate);
            Child1 = Mutation(Child1, MutationRate);
            Child2 = Mutation(Child2, MutationRate);
            Children = [Children; Child1; Child2];
        end
        
        Population = [Selected;Children];
    end
    fprintf('In 500 generations of evolution, a solution did not meet a desired fitness.\n')
end


function [BestGenome, BestScore, Generation, ListOfScores] = GeneticAlgorithm(NumberOfBits, NumberOfGaussians, NumberOfGenerations, PopulationNumber, CrossoverRate, MutationRate, FinishCondition)
%GENETIC_ALGORITHM finds the solution to the problem - An analytic
%expression of the unknown function
%   @param NumberOfBits the number of bits per word
%   @param NumberOfWords the number of words per genome
%   @param NumberOfGenerations the max iterrations
%   @param PopulationNumber the number of total genomes in every generation
%   @param CrossoverRate the probabiliy of a crossover between two parents
%   @param MutationRate the probability of a mutation in a genome
    u1 = [-1 2];
    u2 = [-2 1];
    Input1 = u1(1) + (u1(2) - u1(1)).*rand(300,1);
    Input2 = u2(1) + (u2(2) - u2(1)).*rand(300,1);
    Population = CreatePopulation(PopulationNumber, NumberOfBits, NumberOfGaussians);
    ListOfScores = [];
    BestGenome = Population(1,:);
    BestScore(1) = Score(BestGenome, NumberOfBits, NumberOfGaussians, [Input1'; Input2']);
    GenomeScores = zeros(PopulationNumber,1);
    for i = 1:NumberOfGenerations
        Input1 = u1(1) + (u1(2) - u1(1)).*rand(300,1);
        Input2 = u2(1) + (u2(2) - u2(1)).*rand(300,1);
        Generation = i;
        for GenomeIndex = 1:PopulationNumber
            GenomeScores(GenomeIndex) = Score(Population(GenomeIndex,:), NumberOfBits, NumberOfGaussians, [Input1'; Input2']);
            
            if GenomeScores(GenomeIndex) < BestScore
                BestGenome = Population(GenomeIndex,:);
                BestScore = GenomeScores(GenomeIndex)
            end
        end
       
        
        if Fitness(BestScore) > FinishCondition
            fprintf('Expression Found at generation %d\n', i)
            fprintf('Score id %f\n', BestScore)
            return;
        end
        
        for S = 1:PopulationNumber
            Selected(S,:) = Tournament(Population, PopulationNumber, GenomeScores);
        end 
        Children = [];
        
        for j = 1:2:PopulationNumber
            Parent1 = Selected(j,:);
            Parent2 = Selected(j+1,:);
                
            [Child1, Child2] = Crossover(Parent1, Parent2, CrossoverRate);
            Child1 = Mutation(Child1, MutationRate);
            Child2 = Mutation(Child2, MutationRate);
            Children = [Children; Child1; Child2];
        end
        Population = Children;
        
    end
    fprintf('In %d generations of evolution, a solution did not meet a desired fitness.\n', NumberOfGenerations)
    fprintf('Best Score Accomplished is %f\n', BestScore);
end


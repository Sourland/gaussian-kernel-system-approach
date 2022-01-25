function [BestGenome, BestScore, Generation, ListOfScores] = GeneticAlgorithm(NumberOfBits, NumberOfGaussians, NumberOfGenerations, PopulationNumber, CrossoverRate, MutationRate, Seniority, FinishCondition)
%GENETIC_ALGORITHM finds the solution to the problem - An analytic
%expression of the unknown function
%   @param NumberOfBits the number of bits per word
%   @param NumberOfWords the number of words per genome
%   @param NumberOfGenerations the max iterrations
%   @param PopulationNumber the number of total genomes in every generation
%   @param CrossoverRate the probabiliy of a crossover between two parents
%   @param MutationRate the probability of a mutation in a genome
    
    Population = CreatePopulation(PopulationNumber, NumberOfBits, NumberOfGaussians);
    ListOfScores = [];
    BestGenome = Population(1,:);
    BestScore(1) = Score(BestGenome, NumberOfBits, NumberOfGaussians);
    GenomeScores = zeros(PopulationNumber,1);
    for i = 1:NumberOfGenerations
        
        Generation = i;
        for GenomeIndex = 1:PopulationNumber
            GenomeScores(GenomeIndex) = Score(Population(GenomeIndex,:), NumberOfBits, NumberOfGaussians);
            
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
        
        Selected = RouletteSelection(Population, PopulationNumber, floor(Seniority*PopulationNumber), GenomeScores);
        Children = [];
        Indices = randi(floor(Seniority*PopulationNumber), floor((1-Seniority)*PopulationNumber), 2);
        for j = 1:ceil((1-Seniority)*PopulationNumber/2)
            try Parent1 = Selected(Indices(j,1),:);
            catch
                disp('')
                disp('SELECTING FROM EMPTY ARRAY')
                disp('CANCELLING PROCESS...')
                disp('')
                return
            end
           
            
            try Parent2 = Selected(Indices(j,2),:);
            catch
                disp('')
                disp('SELECTING FROM EMPTY ARRAY')
                disp('CANCELLING PROCESS...')
                disp('')
                return
            end
                
            [Child1, Child2] = Crossover(Parent1, Parent2, CrossoverRate);
            Child1 = Mutation(Child1, MutationRate);
            Child2 = Mutation(Child2, MutationRate);
            Children = [Children; Child1; Child2];
        end
        if BestScore < 1e5
            
            ListOfScores = [ListOfScores BestScore];
        end
        Population = [Selected;Children];
        
    end
    fprintf('In %d generations of evolution, a solution did not meet a desired fitness.\n', NumberOfGenerations)
    fprintf('Best Score Accomplished is %f\n', BestScore);
end


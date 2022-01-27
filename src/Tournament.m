function ChosenOne = Tournament(Population, PopulationNumber, Scores)
%SELECTION selects the best genome for reproducing
%   @param Population is the population of an i-th generation
%   @param HowMany is how many parents we want to chose
%   @param Scores the scores of each genome of the population
    Candidates = randperm(PopulationNumber, 0.3*PopulationNumber);
    SelectionIndex = randi(PopulationNumber);
    for i = length(Candidates)
        if Scores(Candidates(i)) < Scores(SelectionIndex)
            SelectionIndex = i;
        end
    end
    ChosenOne = Population(SelectionIndex,:);   
end

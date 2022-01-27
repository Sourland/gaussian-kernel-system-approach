function Elite = Elitism(Population, HowMany,Scores)
%ELITISM Summary of this function goes here
%   Detailed explanation goes here
    [A, Indeces] = sort(Scores);
    Elite = Population(Indeces,:);
    Elite = Elite(1:HowMany,:);
end


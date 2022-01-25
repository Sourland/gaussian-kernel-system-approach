function Population = CreatePopulation(PopulationNumber, NumberOfBits, NumberOfGaussians)
%CREATEPOPULATION Summary of this function goes here
%   Detailed explanation goes here
    Population = randi([0 1], PopulationNumber, NumberOfBits*NumberOfGaussians);
end


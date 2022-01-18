function Population = CreatePopulation(PopulationNumber, NumberOfBits, NumberOfWords)
%CREATEPOPULATION Summary of this function goes here
%   Detailed explanation goes here
    Population = int2str(randi([0 1], PopulationNumber, NumberOfBits*NumberOfWords));
    for i = 1:PopulationNumber
        str = num2str(Population(i,:));
        str(isspace(str)) = '';
        temp(i,:) = str;
    end
    Population = temp;
end


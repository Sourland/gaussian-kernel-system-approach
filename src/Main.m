clear
clc
close all

%% Initialize the hyperparameters of the problem
NumberOfBits= 60;% number of bits per parameter
NumberOfGaussians = 15; % number of words per genome
NumberOfGenerations = 1500;
PopulationNumber = 100;
Seniority = 0.2;
CrossoverRate = 0.8;
MutationRate = 0.02; % Probability for a generation to get mutated
%% Solve the problem

fprintf("Gaussians = %d\n", NumberOfGaussians);


tic
[Genome, BScore, Generation, ListOfScores] = GeneticAlgorithm(NumberOfBits, NumberOfGaussians, NumberOfGenerations, ...
                                   PopulationNumber, Seniority,CrossoverRate, MutationRate);

[a, c1, c2, s1, s2] = Decode(Genome, NumberOfBits, NumberOfGaussians);
Solution = [a' c1' c2' s1' s2'];
for i = 1:NumberOfGaussians
fprintf('%d * G[%.3f, %.3f, %.3f, %.3f] + ', Solution(i,1), Solution(i,2), ...
        Solution(i,3), Solution(i,4), Solution(i,5));
end
fprintf('\n')
Image(Solution, NumberOfGaussians)
figure()
plot(ListOfScores)
toc

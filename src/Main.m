clear
clc
close all
format long
%% Initialize the problem
NumberOfBits= 30;% number of bits per word
NumberOfWords = 7; % number of words per genome
MutationRate = 1 / (NumberOfBits * NumberOfWords); % Probability for a generation to get mutated
PopulationNumber = 150;
NumberOfGenerations = 500;
CrossoverRate = 0.65;


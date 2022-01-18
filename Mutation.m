function Genome = Mutation(Genome, MutationRate)
%MUTATION mutates a genome and introduces diversity to the new generation
%   @param Genome is the genome up for mutation
%   @param MutationRare is the probability of a genome mutation
    
    for i = 1:length(Genome)
        if rand < MutationRate
            Genome(i) = int2str(1 - str2num(Genome(i)));
        end
    end
end


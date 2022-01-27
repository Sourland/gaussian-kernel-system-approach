function [a, c1, c2, Sigma1, Sigma2] = Decode(Genome, NumberOfBits, NumberOfGaussians)
%DECODE decodes a bit sequence
%   @param 
    Bounds = [-2 2; -3 3; -3 3; 0.5 1; 0.5 1];
    for i = 1:NumberOfGaussians
        Start = (i-1)*NumberOfBits + 1;
        End = (i-1)*NumberOfBits + NumberOfBits;
        SubGenome = Genome(Start:End);
        
        a(i) = DecodeWord(SubGenome(1:12), Bounds(1,:));
        c1(i) = DecodeWord(SubGenome(13:24), Bounds(2,:));
        c2(i) = DecodeWord(SubGenome(25:36), Bounds(3,:));
        Sigma1(i) = DecodeWord(SubGenome(37:48), Bounds(4,:));
        Sigma2(i) = DecodeWord(SubGenome(49:60), Bounds(5,:));
        
        
    end
end


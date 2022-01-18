function Decoded = Decode(Genome, NumberOfBits, NumberOfWords)
%DECODE decodes a bit sequence
%   @param 
    Decoded = zeros(NumberOfWords, 5);
    for i = 1:NumberOfWords
        Start = (i-1)*NumberOfBits + 1;
        End = (i-1)*NumberOfBits + NumberOfBits;
        SubWord = Genome(Start:End);
        Decoded(i,1) = bin2dec(SubWord(1:2));
        Decoded(i,2) = bin2float(SubWord(3:9), 'signed') ;
        Decoded(i,3) = bin2float(SubWord(10:16));
        Decoded(i,4) = bin2float(SubWord(17:23), 'signed');
        Decoded(i,5) = bin2float(SubWord(24:30)) ;    
    end
end


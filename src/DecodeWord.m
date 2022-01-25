function Value = DecodeWord(Word, Bounds)
%BIN2FLOAT Summary of this function goes here
%   Detailed explanation goes here
    Largest = 2^12 - 1;
    WordAsString = num2str(Word);
    WordAsString(isspace(WordAsString)) = '';
    Value = bin2dec(WordAsString);
    Value = Bounds(1) + (Value/Largest) * (Bounds(2) - Bounds(1)); 
    
end


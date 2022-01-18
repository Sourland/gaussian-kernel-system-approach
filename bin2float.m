function number = bin2float(word, signed)
%BIN2FLOAT Summary of this function goes here
%   Detailed explanation goes here
    if nargin > 1
        Sign = bin2dec(word(1));
        IntPart = bin2dec(word(2:4));
        FloatPart = bin2dec(word(4:7));
        FloatPart = FloatPart/(10^numel(num2str(FloatPart)));
        number = IntPart+FloatPart;
        if Sign > 0
            number = - number;
        end
    else
        IntPart = bin2dec(word(2:4));
        FloatPart = bin2dec(word(4:7));
        FloatPart = FloatPart/(10^numel(num2str(FloatPart)));
        number = IntPart+FloatPart;
    end
end


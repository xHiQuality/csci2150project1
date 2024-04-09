function[toWrite] = naturalToBinaryTask()

prompt = {'Enter a decimal number <= 255 to convert to binary or Enter a path to a correctly formatted file: '};
title = 'NaturalToBinary Input';
dims = [1 25];
userInput = inputdlg(prompt,title,dims);

if ~isempty(userInput)
    inputString = userInput{1};

    if inputString(1) == '\' || inputString(1) == '.'
        decimalString = fileread(inputString);
        toWrite = nTbWrapper(decimalString);
    else
    if str2num(inputString) <= 255
        toWrite = nTbWrapper(inputString);
    end
    end
end
end



function output = nTbWrapper(arg1)
            addpath("operations\naturalToBinary");
            cmd = sprintf('naturalToBinary(''%s'');', arg1);
            output = evalc(cmd);
end
function[toWrite] = decodeTask()

prompt = {'Enter any binary number or enter a path to a correctly formatted file (path must start with ''/''): '};
        title = 'Decode Input';
        dims = [1 50];
        userInput = inputdlg(prompt,title,dims);

        if ~isempty(userInput)
            inputString = userInput{1};
            if inputString(1) == '\' || inputString(1) =='.'
                binaryString = fileread(inputString);
                toWrite = decodeWrapper(binaryString);
            else
            toWrite = decodeWrapper(inputString);
            end
        end
end

function output = decodeWrapper(arg1)
            addpath("operations\decode");
            cmd = sprintf('decode(''%s'');', arg1);
            output = evalc(cmd);
end
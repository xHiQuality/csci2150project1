

function [toWrite] = rotationTask()

fileOrString = menu('Choose preset file (FileInput) or String input',...
    'Preset File','String or Path to File');


switch fileOrString
    case 1
        filechoice = menu('Choose preset files', ...
            'A01','A02','A03');

        switch filechoice
            case 1
                prompt = {'Enter string for theta in degrees:'};
                title = 'Theta Input';
                dims = [1 50];
                userInput = inputdlg(prompt,title,dims);
                if ~isempty(userInput)
                    inputString = userInput{1};
                end
               toWrite = rotationWrapper('A01.txt',inputString);
            case 2
                prompt = {'Enter string for theta in degrees:'};
                title = 'Theta Input';
                dims = [1 50];
                userInput = inputdlg(prompt,title,dims);
                if ~isempty(userInput)
                    inputString = userInput{1};
                end
               toWrite = rotationWrapper('A02.txt',inputString);
            case 3
                prompt = {'Enter string for theta in degrees:'};
                title = 'Theta Input';
                dims = [1 50];
                userInput = inputdlg(prompt,title,dims);
                if ~isempty(userInput)
                    inputString = userInput{1};
                end
               toWrite = rotationWrapper('A03.txt',inputString);
        end
    case 2
        
        prompt = {'Enter string for A matrix(format: 5,2,7;3,5,1) or file path (format: \relative\path\to\file):'};

        title = 'A_matrix Input';
        dims = [1 50];
        userInput = inputdlg(prompt,title,dims);
        if ~isempty(userInput)
            inputString = userInput{1};
            
            if inputString(1) == '\' || inputString(1) == '.'
                firstMatrix = inputString;
            else
                firstMatrix = tempname;
                fid = fopen(firstMatrix,'wt');
                for i = 1:length(inputString)
                   if inputString(i) == ';'
                        fprintf(fid,'\n');
                    else
                        fprintf(fid,'%s',inputString(i));
                    end
                end
            end
        end

       prompt = {'Enter string for theta in degrees:'};
                title = 'Theta Input';
                dims = [1 50];
                userInput = inputdlg(prompt,title,dims);
                if ~isempty(userInput)
                    inputString = userInput{1};
                end
            toWrite = rotationWrapper(firstMatrix,inputString);
        
end
end


function output = rotationWrapper(arg1,arg2)
            addpath("operations\rotation\");
            cmd = sprintf('rotation(''%s'', ''%s'');', arg1, arg2);
            output = evalc(cmd);
end


function[toWrite] = lagrangeTask()


fileOrString = menu('Choose preset file (FileInput) or String input',...
    'Preset File','String or Path to File');

switch fileOrString
    case 1
        filechoice = menu('Choose preset file', ...
            'C01.txt','C02.txt','C03.txt','C04.txt');
        switch filechoice
            case 1
               toWrite = lagrangeWrapper('C01.txt');
            case 2
               toWrite = lagrangeWrapper('C02.txt');
            case 3
               toWrite = lagrangeWrapper('C03.txt');
            case 4
                toWrite = lagrangeWrapper('C04.txt');
        end
    case 2
        
        prompt = {'Enter string (format: 1,2,3;4,5,6 or file path (format: \relative\path\to\file):'};

        title = 'Lagrange Input';
        dims = [1 50];
        userInput = inputdlg(prompt,title,dims);
        if ~isempty(userInput)
            inputString = userInput{1};

            if inputString(1) == '\' || inputString(1) == '.'
                toWrite = lagrangeWrapper(inputString);
            else
                tempFileName = tempname;
                fid = fopen(tempFileName,'wt');
                for i = 1:length(inputString)
                    if inputString(i) == ';'
                        fprintf(fid,'\n');
                    else
                        fprintf(fid,'%s',inputString(i));
                    end
                end
               fclose(fid);
            toWrite = lagrangeWrapper(tempFileName);
            
            end
            
        end
end

end

function output = lagrangeWrapper(arg1)
            addpath("operations\lagrange");
            cmd = sprintf('lagrange(''%s'');', arg1);
            output = evalc(cmd);
end
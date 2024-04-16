function[toWrite] = typeofmatrixTask()


fileOrString = menu('Choose preset file (FileInput) or String input',...
    'Preset File','String or Path to File');

switch fileOrString
    case 1
        filechoice = menu('Choose preset file', ...
            'A011.txt','A021.txt','A031.txt','A04.txt','A05.txt','A06.txt','A07.txt','A08.txt');
        switch filechoice
            case 1
               toWrite = typeofmatrixWrapper('A011.txt');
            case 2
               toWrite = typeofmatrixWrapper('A021.txt');
            case 3
               toWrite = typeofmatrixWrapper('A031.txt');
            case 4
                toWrite = typeofmatrixWrapper('A04.txt');
            case 5
                toWrite = typeofmatrixWrapper('A06.txt');
            case 6
                toWrite = typeofmatrixWrapper('A07.txt');
            case 7
                toWrite = typeofmatrixWrapper('A08.txt');
        end
    case 2
        
        prompt = {'Enter string (format: 1,2,3;4,5,6 or file path (format: \relative\path\to\file):'};

        title = 'Matrix Input';
        dims = [1 50];
        userInput = inputdlg(prompt,title,dims);
        if ~isempty(userInput)
            inputString = userInput{1};

            if inputString(1) == '\' || inputString(1) == '.'
                toWrite = typeofmatrixWrapper(inputString);
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
            toWrite = typeofmatrixWrapper(tempFileName);
            
            end
            
        end
end

end

function output = typeofmatrixWrapper(arg1)
            addpath("operations\typeofmatrix");
            cmd = sprintf('typeofmatrix(''%s'');', arg1);
            output = evalc(cmd);
end
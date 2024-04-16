function [toWrite] = gaussianeliminationTask()

fileOrString = menu('Choose preset file (FileInput) or String input',...
    'Preset File','String or Path to File');

switch fileOrString
    case 1
        filechoice = menu('Choose preset files', ...
            'Example1','Example2','Example3','Example4','Example5');

        switch filechoice
            case 1
               toWrite = gaussianWrapper('A1.txt','b1.txt');
            case 2
               toWrite = gaussianWrapper('A2.txt','b2.txt');
            case 3
               toWrite = gaussianWrapper('A3.txt','b3.txt');
            case 4
               toWrite = gaussianWrapper('A4.txt','b4.txt');
            case 5
                toWrite = gaussianWrapper('A5.txt','b5.txt');
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

        prompt = {'Enter string for B matrix(format: 5;2;5) must have same # of rows as A-Matrix has columns && one column or file path (format: \relative\path\to\file):'};

        title = 'B_matrix Input';
        dims = [1 50];
        userInput = inputdlg(prompt,title,dims);
        if ~isempty(userInput)
            inputString = userInput{1};
            
            if inputString(1) == '\' || inputString(1) == '.'
                secondMatrix = inputString;
            else
                secondMatrix = tempname;
                fid = fopen(secondMatrix,'wt');
                for i = 1:length(inputString)
                   if inputString(i) == ';'
                        fprintf(fid,'\n');
                    else
                        fprintf(fid,'%s',inputString(i));
                    end
                end
                 fclose(fid);
            end
           
        end
         toWrite = gaussianWrapper(firstMatrix,secondMatrix);
            
        
end
end


function output = gaussianWrapper(arg1,arg2)
            addpath("operations\gaussianelimination\");
            cmd = sprintf('gaussianelimination(''%s'', ''%s'');', arg1, arg2);
            output = evalc(cmd);
end

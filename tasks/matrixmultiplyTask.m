function [toWrite] = matrixmultiplyTask()

fileOrString = menu('Choose preset file (FileInput) or String input',...
    'Preset File','String or Path to File');

switch fileOrString
    case 1
        filechoice = menu('Choose preset files', ...
            'matrix_01','matrix_02','matrix_03','matrix_04');

        switch filechoice
            case 1
               toWrite = matrixWrapper('A_matrix_01.txt','B_matrix_01.txt');
            case 2
               toWrite = matrixWrapper('A_matrix_02.txt','B_matrix_02.txt');
            case 3
               toWrite = matrixWrapper('A_matrix_03.txt','B_matrix_03.txt');
            case 4
               toWrite = matrixWrapper('A_matrix_04.txt','B_matrix_04.txt');
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

        prompt = {'Enter string for B matrix(format: 5,2,7;9,1,4) must have same # of rows as A-Matrix has columns or file path (format: \relative\path\to\file):'};

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
            end
        end
            fclose(fid);
            toWrite = matrixWrapper(firstMatrix,secondMatrix);
        
end
end


function output = matrixWrapper(arg1,arg2)
            addpath("operations\matrixmultiply\");
            cmd = sprintf('matrixmultiply(''%s'', ''%s'');', arg1, arg2);
            output = evalc(cmd);
end

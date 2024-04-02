function [toWrite] = vectorsTask()


fileOrString = menu('Choose 2 preset files (FileInput) or String input',...
    'Preset Files','String or Path to File');

switch fileOrString
    case 1
        filechoice = menu('Choose preset files', ...
            'vector_01','vector_02','vector_03');

        switch filechoice
            case 1
               toWrite = vectorsWrapper('x_vector_01.txt','y_vector_01.txt');
            case 2
               toWrite = vectorsWrapper('x_vector_02.txt','y_vector_02.txt');
            case 3
               toWrite = vectorsWrapper('x_vector_03.txt','y_vector_03.txt');
        end
    case 2
        
        prompt = {'Enter string for x vector(format: 2.7,-8.1 or file path (format: \relative\path\to\file):'};

        title = 'X-Vector Input';
        dims = [1 50];
        userInput = inputdlg(prompt,title,dims);
        if ~isempty(userInput)
            inputString = userInput{1};
            
            if inputString(1) == '\'
                firstVector = inputString;
            else
                firstVector = tempname;
                fid = fopen(firstVector,'wt');
                for i = 1:length(inputString)
                   fprintf(fid,'%s',inputString(i));
                end
            end
        end

        prompt = {'Enter string for y vector(format: 10.2,9.4) must be same # of points as X-vector or file path (format: \relative\path\to\file):'};

        title = 'Y-Vector Input';
        dims = [1 50];
        userInput = inputdlg(prompt,title,dims);
        if ~isempty(userInput)
            inputString = userInput{1};
            
            if inputString(1) == '\'
                secondVector = inputString;
            else
                secondVector = tempname;
                fid = fopen(secondVector,'wt');
                for i = 1:length(inputString)
                   fprintf(fid,'%s',inputString(i));
                end
            end
        end
            fclose(fid);
            toWrite = vectorsWrapper(firstVector,secondVector);
        
end
end


function output = vectorsWrapper(arg1,arg2)
            addpath("operations\vectors");
            cmd = sprintf('vectors(''%s'', ''%s'');', arg1, arg2);
            output = evalc(cmd);
end
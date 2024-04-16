function [toWrite] = rootfindingTask()

        prompt = {'Enter string for # times to run newtons method or file path (format: \relative\path\to\file):'};

        title = 'Run Amount Input';
        dims = [1 50];
        userInput = inputdlg(prompt,title,dims);
        if ~isempty(userInput)
            inputString = userInput{1};
            
            if inputString(1) == '\' || inputString(1) == '.'
                runAmount = fileread(inputString);
                %fprintf('%s',runAmount);
            else
                %fid = fopen(runAmount,'wt');
                runAmount = inputString;
            end
        end

        prompt = {'Enter string for x_0 (first guess) or file path (format: \relative\path\to\file):'};

        title = 'x_0 Input';
        dims = [1 50];
        userInput = inputdlg(prompt,title,dims);
        if ~isempty(userInput)
            inputString = userInput{1};
            
            if inputString(1) == '\' || inputString(1) == '.'
                x_0 = fileread(inputString);
                %fprintf('%s',x_0);
            else
                %fid = fopen(runAmount,'wt');
                x_0 = inputString;
            end
        end

        
        prompt = {'Enter string for x_1 (second guess) or file path (format: \relative\path\to\file):'};

        title = 'x_1 Input';
        dims = [1 50];
        userInput = inputdlg(prompt,title,dims);
       if ~isempty(userInput)
            inputString = userInput{1};
            
            if inputString(1) == '\' || inputString(1) == '.'
                x_1 = fileread(inputString);
                %fprintf('%s',x_1);
            else
                %fid = fopen(runAmount,'wt');
                x_1 = inputString;
            end
        end
        
         toWrite = rootfindingWrapper(runAmount,x_0,x_1);
            
        
end


function output = rootfindingWrapper(arg1,arg2,arg3)
            addpath("operations\rootfinding\");
            cmd = sprintf('rootfinding(''%s'', ''%s'',''%s'');', arg1, arg2,arg3);
            output = evalc(cmd);
end
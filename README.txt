To run:

make sure you are in project1 directory.
cmd to run: matlab -batch "main"


Project structure:
	MAIN and output/readme txt files are in projects\,
	OPERATIONS directory contains the code for each and every lab/requested operation.
		each operation i.e lagrange , will have the matlab file and some preset txt files for file input.
			user can choose to use preset file or input a string that can be a path to other file or a formatted string.
				e.g lagrange\C02.txt contents can be supplied as a string -13,0,13;56,-28,45
				or you can provide a path to a file that is formatted correctly \operations\lagrange\C02.txt
	TASKS directory contains the logic for GUI and writing to output file, as well as capturing output of operation files. 

Usage:
	from project1 directory run the cmd
		matlab -batch "main"
	then choose which operation you would like to use.
	you will then be prompted with the option to use a preset file or input your own custom string or path to file.
	PLEASE follow formatting instructions in input prompt correctly or errors will happen
	Until you click the quit program button on main menu, the application will allow for continious use and append the output file.


Resources I used:

MATLAB Documentation - to learn about various functions I could call for file read/write, and GUI.

ChatGPT 4.0 - if I needed extra explanation about the use of a function I would ask for help understanding it. For example: I knew that I could use evalc() to take the terminal output and transfer to a variable, however the MATLAB documentation wasn't clear for when the file was in a different directory.

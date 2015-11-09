#ATM
	The purpose of this program is to allow current users or new users
	to view balance, withdraw and deposit money, and operate a bank
	account from either a Command Line format or a GUI Interface.
#Setup
```sh
	$ git clone https://github.com/gerberhe/ATM_Project.git
	$ bundle install
```
	This installs the necessary bundles to run the program on your
	personal computer, as well as getting all the files from the
	GIT repository online.

```sh
	$ ruby main.rb
```
	This runs the code so that you can access the ATM.

	If you would like to switch between the GUI mode and the CMD
	mode, open 'main.rb' in Sublime or your own text/code editor,
	and on line 9, where it says '@desired_interface = ""', type
	in either "cmd" or "gui" between the two ""', depending on 
	what type of interface you want.

#Questions
	1. How would I write information to a file before the program
	ends? Currently, my code writes information to a .txt file, but
	it doesn't write the information actually in the file until the
	program or code stops running. I need it to write to the file
	immediately so that I can access that information while running
	the same program or code as it is in progress.

	2. What code so I use to detect where a mouse was clicked on the
	screen of a window in order to essentially create 'buttons' on the
	screen that, when clicked, do certain things, such as view balance?

	3. Currently don't have a third question.
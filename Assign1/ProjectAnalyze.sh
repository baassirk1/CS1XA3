#!/bin/bash

echo "Greetings soldier. It is I, your commanding officer,  Mandalore. How are you today?"

FS=":" read -p "Enter "great" or "horrible": " \VAR1

if [ $VAR1 = "great" ]
	then 
		echo "Good. Me? I'm doing fine."
else 
	echo "We all have those days. My kids haven't called in months... enough of that though.."

fi

echo "-------------------------------------------"

echo "Let's just see if we're up to date. In order to log in, enter your password (hint: it's GeneralD'Alves' first name)"

FS=":" read -p "Please enter answer: " \VAR2

if [ $VAR2 = "curtis" ]
	then
		echo "Good. You're in."
	git status
fi

echo "--------------------------------------------"

echo "

Great. Just in case, let's put whatever you didn't commit into a new directory, so we can deal with it later."

FS=":" read -p "Would you like to put uncommitted changes into a new directory? Please enter "y": " \VAR3

if [ $VAR3 = "y" ] 
	then
		git diff >> changes.log
fi

echo "--------------------------------------------"

echo "

Good. Now, I understand you were relieved of duty last week due to your "reading week". Well, you got some catching up to do. There's a bunch of things you gotta have done by the end of the day. You can refer to them as #TODO items. To find them, just enter the password for your daily mission checklist. You don't remmeber? Damn the week really threw you off... It's our course code."

echo "--------------------------------------------"

FS=":" read -p "Please enter password to login to #DAILYTODO. Note that the password is case sensitive: " \VAR4 

if [ $VAR4 = "1XA3" ]
	then
		rm todo.log

grep -r "#TODO" . > temptodo.log

mv temptodo.log todo.log

fi 

echo "Yeah... you've got a lot of work to do. But enough of that."

echo "--------------------------------------------"

echo "

Okay. Now let's move onto the next task. I've got your haskell progress report from before the break, but we should move on and forget the past."

echo "Searching through Haskell report. Please wait ...."

echo "Haskell errors found. Transferring files over to temporary document."

find . -name "*.hs" | xargs -I {}  -ghc -fno-code"{}" > error.log

echo "
Loading . . ."

echo "


Completed."

echo "--------------------------------------------"

echo "


Very well. Report to General D'Alves now. I'll see you on the battlefield. Manadlore, out."

#Hey! I'm Amonkira, and I'll be your assistant today. All you have to do is check follow the instructions given in the #PROJECTANALYZE.SH file, and you should be good.

#If you'd like to know the answers... (for reference later) please check below.

#1) great / horrible
#2) curtis
#3) y
#4) 1XA3


#In reference to  https://github.com/mudarthc/CS1XA3/blob/master/Assign1/ProjectAnalyze.sh for inspiring the idea of an interface

#End Script


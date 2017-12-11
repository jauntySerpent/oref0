#!/bin/bash


#This is a simple shell script to automate running autotune for once-off users on a Linux machine. 
#This script has NOT been tested with OSX.


#Changes the directory to the default openaps installation directory. ONLY EDIT IF YOU ARE NOT USING THE DEFAULT "myopenaps" DIRECTORY
cd ~/myopenaps/settings

#Opens an editable copy of the "profile.json". Press Ctrl+O to save any changes you made and then press Ctrl+X to close the file and continue running the script.
nano profile.json

#These two commands copy the data in "profile.json" to "pumpprofile.json" and "autotune.json"
cp profile.json pumpprofile.json
cp profile.json autotune.json

#Sets a starting date for autotune. It takes the current date, subtracts 7 days, and then reformats the new date into the correct format (YYYY-MM-DD). If you want autotune to include past data from more than 7 days previous to the current date then edit the "7" to however many days you want. i.e. "-x days"
DATE=$(date +%F -d "-7 days")

#Creates a variable containing your Nightscout URL. Sub in your own Nighscout URL for the placeholder. NOTE: Do not add a trailing / on the end of your Nightscout URL or that will cause an error.	
NSURL="https://mynightscout.azurewebsites.net"

#Runs autotune. DO NOT EDIT THE DIRECTORY UNLESS YOU DID NOT USE THE RECOMMENDED DEFAULT "myopenaps" DIRECTORY. If you wish to include an alternative end date (default yesterday) then append "–end-date=YYYY-MM-DD" to the end of the command (sans quotation marks).
oref0-autotune --dir=~/myopenaps --ns-host=$NSURL --start-date=$DATE

#Keeps the terminal window open after script finishes. The user must manually close the terminal window.
exec $SHELL

#WEARENOTWAITING

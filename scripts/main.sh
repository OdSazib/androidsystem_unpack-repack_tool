#!/bin/bash
#========================================================
#=             Author: OdSazib                          =
#========================================================
# A menu driven shell script
#---------------------------
# Gaining root acces
# --------------------
sudo echo
#
#-------------------------------------------------------
# Statement for checking wether prerequisites packages
# exist. If not then make install and get system ready.
# -------------------------------------------------------
REQ="lib32stdc++6" #Define variable for prerequisites packcages
for pkg in $REQ; do
    if dpkg-query -W $pkg; then
    	clear
        echo -e "\r\n        -----Your system is ready to go-----\r\n\r\n===================== Welcome =====================\r\n"
        sleep 3
    else
    	echo -e "Sorry, '$pkg' is required\r\n\r\nInstalling...\r\n"
    	        while [ -z $prompt ];
                    do read -p "Make Sure you're connected to internet, Continue (Y/n)?" choice;
                    case "$choice" in
                     y|Y ) sudo apt-get -qq install $pkg && prompt=true; break;;
                     n|N ) break;;
                     *) printf " \033[31m %s \n\033[0m" "invalid input"
                    esac;
                done;
                prompt=;
                if dpkg-query -W $pkg;then
                         echo "Successfully installed $pkg"
                         echo
                else
        	           echo -e "\r\nSorry $pkg didn't install :(\r\n Bye bye...\r\n"
        	           exit 0
                fi

        echo -e "\r\n                ----Let's work-----\r\n\r\n\r\n===================== Welcome =====================\r\n"
        sleep 3
    fi
done

echo
# ----------------------------------
# User defined function
# ----------------------------------
pause(){
  read -p "Press [Enter] key to continue..." fackEnterKey
}
show(){
        local x=$1
        local y=$2
        local txt="$3"
        echo "$txt"
}        
# function to display menus
show_menus() {
	clear
	# Get the system time
         now="$(date +"%r")"
        # Show main - menu, host name and time
        show 3 5 "==================================================="
        show 3 5 "= Android System Unpack-Repack Scripts for Ubuntu ="
        show 3 5 "=-------------------------------------------------="
        show 3 5 "=             writen by odsazib                   ="
        show 3 5 "==================================================="
	show 3 5 "       Main-Menu for $HOSTNAME - $now"
	show 3 5 "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	show 3 5 "                1. Unpakc"
	show 3 5 "                2. Repack"
	show 3 5 "                3. Exit"
}
# read input from the keyboard and take a action
# decompress system.new.dat when the user select 1 from the menu option.
# compress system.img or extracted system files when the user select 2 from the menu option.
# Exit the user when user select 3 form the menu option.
read_options(){
	local choice
	read -p "        Enter choice [ 1 - 3]: " choice
	case $choice in
		1) ./scripts/unpack.sh ;;
		2) ./scripts/repack.sh ;;
		3) exit 0;;
		*) printf " \033[31m %s \n\033[0m" "Invalid input" && sleep 1
	esac
}
 
# ----------------------------------------------
#  Trap CTRL+C, CTRL+Z and quit singles
#  Prevent user to quit by pressing ^ this keys
# ----------------------------------------------
trap '' SIGINT SIGQUIT SIGTSTP
 
# -----------------------------------
# Main logic - infinite loop
# ------------------------------------
while true
do
	pause
	show_menus
	read_options
done

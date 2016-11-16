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
        sleep 2
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
         # Specify colors utilized in the terminal
         normal='tput sgr0'              # White
         red='tput setaf 1'              # Red
         green='tput setaf 2'            # Green
         yellow='tput setaf 3'           # Yellow
         blue='tput setaf 4'             # Blue
         violet='tput setaf 5'           # Violet
         cyan='tput setaf 6'             # Cyan
         white='tput setaf 7'            # White
         txtbld=$(tput bold)             # Bold
         bldred=${txtbld}$(tput setaf 1) # Bold Red
         bldgrn=${txtbld}$(tput setaf 2) # Bold Green
         bldblu=${txtbld}$(tput setaf 4) # Bold Blue
         bldvlt=${txtbld}$(tput setaf 5) # Bold Violet
         bldcya=${txtbld}$(tput setaf 6) # Bold Cyan
         bldwht=${txtbld}$(tput setaf 7) # Bold White
        # Show main - menu, host name and time
        show 3 5 "        ${bldred}============================================================="
        show 3 5 "        ${bldred}=${bldgrn}      Android System Unpack-Repack Scripts for Linux       ${bldred}="
        show 3 5 "        ${bldred}=${bldvlt}-----------------------------------------------------------${bldred}="
        show 3 5 "        ${bldred}=${bldgrn}                    writen by odsazib                      ${bldred}="
        show 3 5 "        ${bldred}=${bldvlt}~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~${bldred}="
	    show 3 5 "        ${bldred}=${bldgrn}            Main-Menu for $HOSTNAME - $now            ${bldred}="
	    show 3 5 "        ${bldred}=${bldvlt}~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~${bldred}="
	    show 3 5 "        ${bldred}=${bldblu}               1. Unpack Dat File                          ${bldred}="
        show 3 5 "        ${bldred}=${bldblu}               2. Unpack Image File                        ${bldred}="
	    show 3 5 "        ${bldred}=${bldblu}               3. Repack                                   ${bldred}="
	    show 3 5 "        ${bldred}=${bldblu}               4.${bldred} Exit                                     ${bldred}="
        show 3 5 "        ${bldred}=                                                           ="
        show 3 5 "        ${bldred}============================================================="
}
# read input from the keyboard and take a action
# decompress system.new.dat when the user select 1 from the menu option.
# compress system.img or extracted system files when the user select 2 from the menu option.
# Exit the user when user select 3 form the menu option.
read_options(){
	local choice
	read -p "${bldcya}        Enter choice [1-4] : ${bldblu}" choice
	case $choice in
		1) ./scripts/unpack.sh ;;
        2) ./scripts/imageonly.sh ;;
		3) ./scripts/repack.sh ;;
		4) echo -e "\r\n"; exit 0;;
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

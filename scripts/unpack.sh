#!/bin/bash
#========================================================
#=             Author: OdSazib                          =
#========================================================
sudo echo
if test -f ./input/system.transfer.list && test -f ./input/system.new.dat; 
      then
	      echo
else
	echo -e "\r\nNothing found in /input directory\r\n\r\nPlease open the text file inside the input dir to read \r\nand keep those files there in /input\r\n"
	echo -e "Bye Bye...\r\n"
	exit 0
fi
./tools/sdat2img.py ./input/system.transfer.list ./input/system.new.dat ./system.img
rm -rf ./output && mkdir ./output && mv ./system.img ./output
echo ""
echo "You got system.img from system.new.dat!"
echo -e "\r\nsytem.img placed to ./output folder"
echo -e "\r\nDo you want to extract it?"
echo ""
prompt_confirm() {
  while true; do
    read -r -n 1 -p "${1:-Continue?} [E/N]: " REPLY
    case $REPLY in
      [eE]) echo -e "\r\n\r\nExtracting....." && ./scripts/imageonly.sh; return 0 ;;
      [nN]) rm -rf ./system; echo -e "\r\nYou can extract syetm.img by Entering 2 and to make it dat enter 3 from main menu\r\n"; return 0 ;;
      *) printf " \033[31m %s \n\033[0m" "invalid input"
    esac 
  done  
}
prompt_confirm "Press 'E' to extract, 'N' to keep system.img intact" || exit 0
echo ""
#!/bin/bash
#========================================================
#=             Author: OdSazib                          =
#========================================================
if  sudo test -f ./input/system.transfer.list && test -f ./input/system.new.dat; 
      then
	      echo
else
	echo -e "\r\nNothing found in /input directory\r\n\r\nPlease open the text file inside the input dir to read \r\nand keep those files there in /input\r\n"
	echo -e "Bye Bye...\r\n"
	exit 0
fi
sudo test -d ./system_out && rm -rf ./system_out; mkdir ./system_out
./tools/sdat2img.py ./input/system.transfer.list ./input/system.new.dat ./system.img
echo ""
echo "You got system.img from system.new.dat!"
echo "Do you want to extract it?"
echo ""
prompt_confirm() {
  while true; do
    read -r -n 1 -p "${1:-Continue?} [E/N]: " REPLY
    case $REPLY in
      [eE]) rm -rf ./output && echo -e "\r\n\r\nExtracting....."; return 0 ;;
      [nN]) rm -rf ./system && rm -rf ./system_out && rm -rf ./output; mkdir ./output && mv ./system.img ./output && echo -e "\r\nCongrats!!! sytem.img placed to ./output folder\r\n\r\nTo process syetm.img, Enter 2 from main menu\r\n"; return 1 ;;
      *) printf " \033[31m %s \n\033[0m" "invalid input"
    esac 
  done  
}
prompt_confirm "Press 'E' to extract, 'N' to keep system.img intact" || exit 0
sudo mount -t ext4 -o loop system.img system_out/
sudo test -d ./system && rm -rf ./system; mkdir ./system
sudo cp -r ./system_out/. ./system/.
sudo chown -R odsazib:odsazib ./system
sudo umount ./system_out
rm -r ./system_out
rm ./system.img
echo "Completed!! system.img extracted to ./system "
echo ""
echo "To repack extracted files, Enter 2 from main menu"
echo ""
echo ""

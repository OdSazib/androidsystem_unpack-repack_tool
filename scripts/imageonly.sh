#!/bin/bash
#========================================================
#=             Author: OdSazib                          =
#========================================================
sudo echo
if test -f ./output/system.img; then 
	    echo
  else 
  	 echo -e "No system.img found in /output folder\r\n"; exit 0
fi

mkdir system_out
sudo mount -t ext4 -o loop output/system.img system_out/
test -d ./system && rm -rf ./system; mkdir ./system
sudo cp -r ./system_out/. ./system/.
sudo chown -R $USER:$USER ./system
sudo umount ./system_out
rm -r ./system_out
rm -rf ./output
echo "Completed!! system.img extracted to ./system "
echo ""
echo "To repack extracted files, Enter 3 from main menu"
echo ""
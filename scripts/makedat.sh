#!/bin/bash
mv ./my_new_system.img ./output/my_new_system.img
rm -rf ./system
cp ./tools/rimg2sdat output
sudo chmod +x ./output/rimg2sdat
cd output
./rimg2sdat my_new_system.img
rm my_new_system.img
rm rimg2sdat
echo -e "\r\nDone"
echo "Congrats!!! Look at ./output folder now"
echo ""
exit 0

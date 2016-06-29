#!/bin/bash
#========================================================
#=             Author: OdSazib                          =
#========================================================
sudo echo
if  sudo test -f ./output/system.img;
        then
            echo ""
            echo "sytem.img found instead of extracted system folder"
            echo ""
            echo "Processing system.img...please wait..."
            echo ""
            cp ./tools/rimg2sdat ./output
            sudo chmod +x ./output/rimg2sdat
            cd output
            ./rimg2sdat system.img
            rm system.img
            rm rimg2sdat
            echo "Done"
            echo "Congrats!!! Look at ./output folder now"
            echo ""
            exit 0
elif 
    sudo test -d ./system;
        then
            echo ""
            echo "Extracted ./system folder found"
            echo ""
            echo "Making system.img from extracted systm folder...please wait..."
            echo ""
            if sudo test -f ./input/file_contexts; 
                then
                  echo
            else
                echo -e "\r\nfile_contexts not found in /input directory\r\n\r\nPlease open the text file inside the input dir to read \r\nand keep those files there in /input\r\n"
                echo -e "Bye Bye...\r\n"
                exit 0
            fi
            sudo test -d ./output && rm -rf ./output; mkdir ./output
            ./tools/make_ext4fs -T 0 -S ./input/file_contexts -l 2415919104 -a system my_new_system.img system/
            echo ""
            echo -e "Created, Processing system.img...please wait...\r\n"
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
else
	echo -e "\r\nSorry! Nothing found for processing\r\nBye Bye...\r\n"
	exit 0
fi
echo


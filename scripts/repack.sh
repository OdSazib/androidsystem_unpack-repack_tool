#!/bin/bash
#========================================================
#=             Author: OdSazib                          =
#========================================================
sudo echo
if test -f ./output/system.img;
        then
            echo ""
            echo "sytem.img found instead of extracted system folder"
            echo ""
            echo "Processing system.img...please wait..."
            echo ""
            cp ./tools/rimg2sdat ./output
            chmod +x ./output/rimg2sdat
            cd output
            ./rimg2sdat system.img
            rm system.img
            rm rimg2sdat
            echo "Done"
            echo "Congrats!!! Look at ./output folder now"
            echo ""
            exit 0
elif 
    test -d ./system;
        then
            echo ""
            echo "Extracted ./system folder found"
            echo ""
            echo "Making system.img from extracted systm folder...please wait..."
            echo ""
            if test -f ./input/file_contexts; 
                then
                  echo
            else
                echo -e "\r\nfile_contexts not found in /input directory\r\n\r\nPlease open the text file inside the input dir to read \r\nand keep those files there in /input\r\n"
                echo -e "Bye Bye...\r\n"
                exit 0
            fi
            test -d ./output && rm -rf ./output; mkdir ./output
            BLOCK_SIZE="2415919104"
                for system in $BLOCK_SIZE; do
                ./tools/make_ext4fs -T 0 -S ./input/file_contexts -l $system -a system my_new_system.img system/
            done

            echo ""
            echo -e "Hello! system.img has created!!\r\n"
            echo -e "\r\nDo you want convert it to dat?"
            
            prompt_confirm() {
                while true; do
                    read -r -n 1 -p "${1:-Continue?} [Y/N]: " REPLY
                    case $REPLY in
                        [yY]) echo -e "\r\n\r\nProcessing....." && ./scripts/makedat.sh; return 0 ;;
                        [nN])  mv ./my_new_system.img ./output/system.img && rm -rf ./system; echo -e "\r\nOK! sysetm.img is placed to /output and to make it dat enter 3 from main menu\r\n"; return 0 ;;
                        *) printf " \033[31m %s \n\033[0m" "invalid input"
                        esac 
                    done  
                }
                prompt_confirm "Press 'Y' to make system.new.dat, 'N' to keep system.img intact" || exit 0
                echo

            
else
	echo -e "\r\nSorry! Nothing found for processing\r\nBye Bye...\r\n"
	exit 0
fi
echo


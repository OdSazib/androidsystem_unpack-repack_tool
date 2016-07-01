automated scripts to use available binaries and codes to compress & decompress system.new.dat of android 5.0+ roms
# Android System Unpack-Repack Tool For Ubuntu
Android new compression is deeper than before and hence can not be decompressed in normal way or with traditional archive manager. From android 5.0+ android roms are two level compressed, normal ext4 raw.img and dat format. So things are not natively easy.
Btw the ways are made by devlopers over years and using their scripts/tools differ from one to another. I found some complex ways to use prebuilt binary of make_ext4fs, rimg2sadt and sdat2img.py, So wrote scripts to automate the whole process within only one command, yes just 1 command once you are being followed all instructions here. It's very easy to use rather than those long process and big commands.

Thanks to: 
------------------------------------
- xpirt, luxi78, howellzhu 
- all github contributors
- original xda thread:<br/>http://forum.xda-developers.com/android/software-hacking/how-to-conver-lollipop-dat-files-to-t2978952/

=====================================
#Instructions: (Follow step by step)
------------------------------------

Part-A: Make system ready
------------------------------------
- 1. Open terminal
- 2. Clone this repo by this command: git clone https://github.com/OdSazib/androidsystem_unpack-repack_tool.git
- 3. cd to ^this directory, example: cd ~/androidsystem_unpack-repack_tool
- 4. Extract your rom and copy your file_contexts, system.new.dat, system.transfer.list to /input folder

Part-B: Start Unpack-Repack
------------------------------------
- 5. Enter this command: ./runme.sh

Part-C: Flashing Rom Zip
------------------------------------
- 6. To flash your repacked rom, take system.new.dat and system.transfer.list from /output folder and replace with your previous one in your rom folder you extracted. Make zip and flash.

#Enjoy!!!
Once you started using this everything seems super easy, right? :D

NOTICES:
--------
- At step 5 script will make your system ready, keep your pc connected to internet. When finished, you will get a menu to unpack, repack and get exit. Use them 
- While unpacking, you will be promted if wish to keep system.img or even extract all files of system folder. Fortunately you can get both by your choice. But at a time you should keep either system.img or it's extracted file. I declared in script what you actually want.
- If you did extract you can modify system files, btw by entering 2, you will repack both your extracted system folder and unextracted system.img, Cool right?
- If your rom doesn't boot or flashing doesn't finish, Open repack.sh and change the numeric value from this line is shown bellow:<br/>
   BLOCK_SIZE="2415919104" <br/>
   It's system partition block size, mine is 2415919104. You should find it in your device tree BoardConfig.mk, in this line "BOARD_SYSTEMIMAGE_PARTITION_SIZE := 2415919104" <br/>(It's necessary only if your devices doesn't boot with my block size)

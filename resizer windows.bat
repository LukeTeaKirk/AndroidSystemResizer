echo off
echo " Welcome to Partition Resizer for OnePlus6"
echo " Made by Jay / ProtoDeVNan0"
echo " Version 1.0"
echo.
echo " Be careful while resizing any partition. This script has safety features"
echo " enabled but You should always be careful"
echo " also EDL + MSM will fix\restore both A\B partition sizes"
echo.
echo " Before resizing, please backup data, efs and persist if possible"
echo.
echo " For any questions and problems join @JaysRoms on Telegram"

echo.
echo " Make sure You're in TWRP"
echo.

echo " Pushing sgdisk to Your recovery"

win_tools\adb push sgdisk \sbin

echo " Done!"
echo.

echo " Backing up stock partition table\sizes.."

win_tools\adb shell sgdisk /dev/block/sda --print > backup_table.txt

echo.

set /p storsize="Now choose what storage size You have (64\128\256): " 
echo.

echo " Your storage size is: %storsize% GB"
echo.

echo " WARNING: Last chance to change Your mind, after that only EDL will help"
echo " Use ctrl + c to cancel"
echo.
set /p partname=" Which partition would You like to resize? (system only for now): "
echo.
set syssize=6
if "%partname%" == "system"  (
 echo " You have chosen system partition"
 echo.
 set syssize=6
 echo.
 set /p slot="What slot do You want to resize? (a\b):"
 echo.
 echo " Your new system size will be %syssize% GB and You chose to resize slot %slot% "
 echo.
 echo " Deleting data partition.."
 echo.
 win_tools\adb shell sgdisk /dev/block/sda --delete 17
 echo " Done!"
 echo.
)
 if "%slot%" == "a"  if "%storsize%" == "128" ( 
  echo "Deleting system_a partition.."
  echo.
  win_tools\adb shell sgdisk /dev/block/sda --delete 13
  echo " Resizing system_a.."
  echo.
  win_tools\adb shell sgdisk /dev/block/sda --new=17:1601344:3237370
  echo " Resizing data.."
  echo.
  win_tools\adb shell sgdisk /dev/block/sda --new=18:3237371:30437370
  echo " Renaming partitions.."
  echo.
  win_tools\adb shell sgdisk /dev/block/sda --change-name=17:system_a
  win_tools\adb shell sgdisk /dev/block/sda --change-name=18:userdata
echo.
 echo " Done!"
 echo.
 echo " Rebooting to fastboot.."
 echo.
 win_tools\adb reboot bootloader
 echo " Wiping userdata and both system partitions.."
 echo.
 win_tools\fastboot erase userdata
 win_tools\fastboot erase system_a
 win_tools\fastboot erase system_b
 echo.
 echo " Done! Now format data in twrp and wipe system and flash any rom You want!"
 echo.
 set /p wait="Press any key to exit"
)
 IF "%slot%" == "b" if "%storsize%" == "128" (
  echo " Deleting system_b partition.."
  win_tools\adb shell sgdisk /dev/block/sda --delete 14
  echo " Resizing system_b.."
  echo.
  win_tools\adb shell sgdisk /dev/block/sda --new=17:1601344:3237370
  echo " Resizing data.."
  echo.
  win_tools\adb shell sgdisk /dev/block/sda --new=18:3237371:30437370
  echo " Renaming partitions.."
  echo.
  win_tools\adb shell sgdisk /dev/block/sda --change-name=17:system_b
  win_tools\adb shell sgdisk /dev/block/sda --change-name=18:userdata
echo.
 echo " Done!"
 echo.
 echo " Rebooting to fastboot.."
 echo.
 win_tools\adb reboot bootloader
 echo " Wiping userdata and both system partitions.."
 echo.
 win_tools\fastboot erase userdata
 win_tools\fastboot erase system_a
 win_tools\fastboot erase system_b
 echo.
 echo " Done! Now format data in twrp and wipe system and flash any rom You want!"
 echo.
 set /p wait="Press any key to exit"
)
if "%slot%" == "a" if "%storsize%" == "256" (
  echo " Deleting system_a partition.."
  echo.
  win_tools\adb shell sgdisk /dev/block/sda --delete 13
  echo " Resizing system_a.."
  echo.
  win_tools\adb shell sgdisk /dev/block/sda --new=17:1601344:3237370
  echo " Resizing data.."
  echo.
  win_tools\adb shell sgdisk /dev/block/sda --new=18:3237371:61677562
  echo " Renaming partitions.."
  echo.
  win_tools\adb shell sgdisk /dev/block/sda --change-name=17:system_a
  win_tools\adb shell sgdisk /dev/block/sda --change-name=18:userdata
echo.
 echo " Done!"
 echo.
 echo " Rebooting to fastboot.."
 echo.
 win_tools\adb reboot bootloader
 echo " Wiping userdata and both system partitions.."
 echo.
 win_tools\fastboot erase userdata
 win_tools\fastboot erase system_a
 win_tools\fastboot erase system_b
 echo.
 echo " Done! Now format data in twrp and wipe system and flash any rom You want!"
 echo.
 set /p wait="Press any key to exit"
)
if "%slot%" == "b" if "%storsize%" == "256" (
  echo " Deleting system_b partition.."
  win_tools\adb shell sgdisk /dev/block/sda --delete 14
  echo " Resizing system_b.."
  echo.
  win_tools\adb shell sgdisk /dev/block/sda --new=17:1601344:3237370
  echo " Resizing data.."
  echo.
  win_tools\adb shell sgdisk /dev/block/sda --new=18:3237371:61677562
  echo " Renaming partitions.."
  echo.
  win_tools\adb shell sgdisk /dev/block/sda --change-name=17:system_b
  win_tools\adb shell sgdisk /dev/block/sda --change-name=18:userdata
echo.
 echo " Done!"
 echo.
 echo " Rebooting to fastboot.."
 echo.
 win_tools\adb reboot bootloader
 echo " Wiping userdata and both system partitions.."
 echo.
 win_tools\fastboot erase userdata
 win_tools\fastboot erase system_a
 win_tools\fastboot erase system_b
 echo.
 echo " Done! Now format data in twrp and wipe system and flash any rom You want!"
 echo.
 set /p wait="Press any key to exit"
)
if "%slot%" == "a" if "%storsize%" == "64" (
  echo " Deleting system_a partition.."
  echo.
  win_tools\adb shell sgdisk /dev/block/sda --delete 13
  echo " Resizing system_a.."
  echo.
  win_tools\adb shell sgdisk /dev/block/sda --new=17:1601344:3237370
  echo " Resizing data.."
  echo.
  win_tools\adb shell sgdisk /dev/block/sda --new=18:3237371:14817274
  echo " Renaming partitions.."
  echo.
  win_tools\adb shell sgdisk /dev/block/sda --change-name=17:system_a
  win_tools\adb shell sgdisk /dev/block/sda --change-name=18:userdata
echo.
 echo " Done!"
 echo.
 echo " Rebooting to fastboot.."
 echo.
 win_tools\adb reboot bootloader
 echo " Wiping userdata and both system partitions.."
 echo.
 win_tools\fastboot erase userdata
 win_tools\fastboot erase system_a
 win_tools\fastboot erase system_b
 echo.
 echo " Done! Now format data in twrp and wipe system and flash any rom You want!"
 echo.
 set /p wait="Press any key to exit"
)
 if "%slot% == "b"  if "%storsize%" == "64" (
  echo " Deleting system_b partition.."
  win_tools\adb shell sgdisk /dev/block/sda --delete 14
  echo " Resizing system_b.."
  echo.
  win_tools\adb shell sgdisk /dev/block/sda --new=17:1601344:3237370
  echo " Resizing data.."
  echo.
  win_tools\adb shell sgdisk /dev/block/sda --new=18:3237371:14817274
  echo " Renaming partitions.."
  echo.
  win_tools\adb shell sgdisk /dev/block/sda --change-name=17:system_b
  win_tools\adb shell sgdisk /dev/block/sda --change-name=18:userdata
  echo.
 echo " Done!"
 echo.
 echo " Rebooting to fastboot.."
 echo.
 win_tools\adb reboot bootloader
 echo " Wiping userdata and both system partitions.."
 echo.
 win_tools\fastboot erase userdata
 win_tools\fastboot erase system_a
 win_tools\fastboot erase system_b
 echo.
 echo " Done! Now format data in twrp and wipe system and flash any rom You want!"
 echo.
 set /p wait="Press any key to exit"
)
 
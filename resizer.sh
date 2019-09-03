echo " Welcome to Partition Resizer for OnePlus6"
echo " Made by Jay / ProtoDeVNan0"
echo " Version 1.0"
echo " "
echo " Be careful while resizing any partition. This script has safety features"
echo " enabled but You should always be careful"
echo " also EDL + MSM will fix/restore both A/B partition sizes"
echo " "
echo " Before resizing, please backup data, efs and persist if possible"
echo " "
echo " For any questions and problems join @JaysRoms on Telegram"

echo ""
echo " Make sure You're in TWRP"
echo ""

echo " Pushing sgdisk to Your recovery"

linux_tools/adb push sgdisk /sbin

echo " Done!"
echo ""

echo " Backing up stock partition table/sizes.."

linux_tools/adb shell sgdisk /dev/block/sda --print > backup_table.txt

echo ""

read -p " Now choose what storage size You have (64/128/256): " storsize
echo ""

echo " Your storage size is: $storsize GB"
echo ""

echo " WARNING: Last chance to change Your mind, after that only EDL will help"
echo " Use ctrl + c to cancel"
echo ""
read -p " Which partition would You like to resize? (system only for now): " partname
echo ""

if [ $partname == "system" ]; then
 echo " You have chosen system partition"
 echo ""
 syssize=6
 echo ""
 read -p " What slot do You want to resize? (a/b): " slot
 echo ""
 echo " Your new system size will be $syssize GB and You chose to resize slot $slot "
 echo ""
 echo " Deleting data partition.."
 echo ""
 linux_tools/adb shell sgdisk /dev/block/sda --delete 17
 echo " Done!"
 echo ""
 if [ $slot == "a" ] && [ $storsize == "128" ]; then
  echo " Deleting system_a partition.."
  echo ""
  linux_tools/adb shell sgdisk /dev/block/sda --delete 13
  echo " Resizing system_a.."
  echo ""
  linux_tools/adb shell sgdisk /dev/block/sda --new=17:1601344:3237370
  echo " Resizing data.."
  echo ""
  linux_tools/adb shell sgdisk /dev/block/sda --new=18:3237371:30437370
  echo " Renaming partitions.."
  echo ""
  linux_tools/adb shell sgdisk /dev/block/sda --change-name=17:system_a
  linux_tools/adb shell sgdisk /dev/block/sda --change-name=18:userdata
 elif [ $slot == "b" ] && [ $storsize == "128" ]; then
  echo " Deleting system_b partition.."
  linux_tools/adb shell sgdisk /dev/block/sda --delete 14
  echo " Resizing system_b.."
  echo ""
  linux_tools/adb shell sgdisk /dev/block/sda --new=17:1601344:3237370
  echo " Resizing data.."
  echo ""
  linux_tools/adb shell sgdisk /dev/block/sda --new=18:3237371:30437370
  echo " Renaming partitions.."
  echo ""
  linux_tools/adb shell sgdisk /dev/block/sda --change-name=17:system_b
  linux_tools/adb shell sgdisk /dev/block/sda --change-name=18:userdata
elif [ $slot == "a" ] && [ $storsize == "256" ]; then
  echo " Deleting system_a partition.."
  echo ""
  linux_tools/adb shell sgdisk /dev/block/sda --delete 13
  echo " Resizing system_a.."
  echo ""
  linux_tools/adb shell sgdisk /dev/block/sda --new=17:1601344:3237370
  echo " Resizing data.."
  echo ""
  linux_tools/adb shell sgdisk /dev/block/sda --new=18:3237371:61677562
  echo " Renaming partitions.."
  echo ""
  linux_tools/adb shell sgdisk /dev/block/sda --change-name=17:system_a
  linux_tools/adb shell sgdisk /dev/block/sda --change-name=18:userdata
 elif [ $slot == "b" ] && [ $storsize == "256" ]; then
  echo " Deleting system_b partition.."
  linux_tools/adb shell sgdisk /dev/block/sda --delete 14
  echo " Resizing system_b.."
  echo ""
  linux_tools/adb shell sgdisk /dev/block/sda --new=17:1601344:3237370
  echo " Resizing data.."
  echo ""
  linux_tools/adb shell sgdisk /dev/block/sda --new=18:3237371:61677562
  echo " Renaming partitions.."
  echo ""
  linux_tools/adb shell sgdisk /dev/block/sda --change-name=17:system_b
  linux_tools/adb shell sgdisk /dev/block/sda --change-name=18:userdata
elif [ $slot == "a" ] && [ $storsize == "64" ]; then
  echo " Deleting system_a partition.."
  echo ""
  linux_tools/adb shell sgdisk /dev/block/sda --delete 13
  echo " Resizing system_a.."
  echo ""
  linux_tools/adb shell sgdisk /dev/block/sda --new=17:1601344:3237370
  echo " Resizing data.."
  echo ""
  linux_tools/adb shell sgdisk /dev/block/sda --new=18:3237371:14817274
  echo " Renaming partitions.."
  echo ""
  linux_tools/adb shell sgdisk /dev/block/sda --change-name=17:system_a
  linux_tools/adb shell sgdisk /dev/block/sda --change-name=18:userdata
 elif [ $slot == "b" ] && [ $storsize == "64" ]; then
  echo " Deleting system_b partition.."
  linux_tools/adb shell sgdisk /dev/block/sda --delete 14
  echo " Resizing system_b.."
  echo ""
  linux_tools/adb shell sgdisk /dev/block/sda --new=17:1601344:3237370
  echo " Resizing data.."
  echo ""
  linux_tools/adb shell sgdisk /dev/block/sda --new=18:3237371:14817274
  echo " Renaming partitions.."
  echo ""
  linux_tools/adb shell sgdisk /dev/block/sda --change-name=17:system_b
  linux_tools/adb shell sgdisk /dev/block/sda --change-name=18:userdata
 fi
 echo ""
 echo " Done!"
 echo ""
 echo " Rebooting to fastboot.."
 echo ""
 linux_tools/adb reboot bootloader
 echo " Wiping userdata and both system partitions.."
 echo ""
 linux_tools/fastboot erase userdata
 linux_tools/fastboot erase system_a
 linux_tools/fastboot erase system_b
 echo ""
 echo " Done! Now format data in twrp and wipe system and flash any rom You want!"
 echo ""
fi

#!/bin/sh
apt-ftparchive packages ./ > ./Packages
sed -i -e '/^SHA/d' ./Packages
bzip2 -c9k ./Packages > ./Packages.bz2
printf "Origin: Pocketslate's Repo \nLabel: Pocketslate\nSuite: stable\nVersion: 1.0\nCodename: Pocketslate\nArchitecture: iphoneos-arm\nComponents: main\nDescription: Pocketslate's Tweaks\nMD5Sum:\n "$(cat ./Packages | md5sum | cut -d ' ' -f 1)" "$(stat ./Packages --printf="%s")" Packages\n "$(cat ./Packages.bz2 | md5sum | cut -d ' ' -f 1)" "$(stat ./Packages.bz2 --printf="%s")" Packages.bz2\n" >Release;
exit 0

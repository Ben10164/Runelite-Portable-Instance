#!/bin/bash

echo "Hi, this program is written by Ben"
echo "Scripts:"
echo "1 - Download the JDK"
echo "2 - Download Runelite"
echo "3 - Update Runelite"
echo "4 - Download all and run Runelite"
echo "5 - Remove Everything"
echo "6 - Run Runelite"
echo "7 - Fix Invalid Jar"
echo
echo "Please enter the script you would like to run:"

read input
if test $input -eq 1; then
    # Download the JDK
    curl -L "https://github.com/adoptium/temurin11-binaries/releases/download/jdk-11.0.17%2B8/OpenJDK11U-jdk_aarch64_mac_hotspot_11.0.17_8.tar.gz" --output mac.tar.gz
    mkdir jdk-11
    tar -xf mac.tar.gz -C jdk-11 --strip-components 1
    rm mac.tar.gz
elif test $input -eq 2; then
    # Download the latest .jar of Runelite
    curl -L "https://github.com/runelite/launcher/releases/latest/download/runelite.jar" --output RuneLite.jar
elif test $input -eq 3; then
    # Update to the latest .jar of Runelite
    rm RuneLite.jar
    curl -L "https://github.com/runelite/launcher/releases/latest/download/runelite.jar" --output RuneLite.jar
elif test $input -eq 4; then
    # Download all, and run Runelite
    curl -L "https://github.com/adoptium/temurin11-binaries/releases/download/jdk-11.0.17%2B8/OpenJDK11U-jdk_aarch64_mac_hotspot_11.0.17_8.tar.gz" --output mac.tar.gz
    mkdir jdk-11
    tar -xf mac.tar.gz -C jdk-11 --strip-components 1
    rm mac.tar.gz

    curl -L "https://github.com/runelite/launcher/releases/latest/download/runelite.jar" --output RuneLite.jar

    jdk-11/Contents/Home/bin/java -Duser.home=client-home -Djava.io.tmpdir=client-tmp -jar RuneLite.jar --launch-mode=REFLECT
elif test $input -eq 5; then
    # Remove everything
    rm -rf jdk-11
    rm RuneLite.jar
elif test $input -eq 6; then
    # Run Runelite
    jdk-11/Contents/Home/bin/java -Duser.home=client-home -Djava.io.tmpdir=client-tmp -jar RuneLite.jar --launch-mode=REFLECT
elif test $input -eq 7; then
    # Fix Invalid Jar
    rm RuneLite.jar
    echo "The last release does not contain a Universal Jar"
    echo "Attempting to run a Python file (Requires Python and the Requests package)"
    url=$(python3 GetURL.py)
    curl -L $url --output RuneLite.jar
fi

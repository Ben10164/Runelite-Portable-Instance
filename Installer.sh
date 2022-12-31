#!/bin/bash

read input
if test $input -eq 1
then 
    # Download the JDK
    curl -L "https://github.com/adoptium/temurin11-binaries/releases/download/jdk-11.0.17%2B8/OpenJDK11U-jdk_aarch64_mac_hotspot_11.0.17_8.tar.gz" --output mac.tar.gz
    mkdir jdk-11
    tar -xf mac.tar.gz -C jdk-11 --strip-components 1
    rm mac.tar.gz
elif test $input -eq 2
then 
    # Download the latest .jar of Runelite
    curl -L "https://github.com/runelite/launcher/releases/latest/download/runelite.jar" --output RuneLite.jar
elif test $input -eq 3
then 
    # Update to the latest .jar of Runelite
    rm RuneLite.jar
    curl -L "https://github.com/runelite/launcher/releases/latest/download/runelite.jar" --output RuneLite.jar
elif test $input -eq 4
then 
    # Run Runelite
    jdk-11/Contents/Home/bin/java -Duser.home=client-home -Djava.io.tmpdir=client-tmp -jar RuneLite.jar --nojvm
elif test $input -eq 5
then 
    # Download all, and run Runelite
    curl -L "https://github.com/adoptium/temurin11-binaries/releases/download/jdk-11.0.17%2B8/OpenJDK11U-jdk_aarch64_mac_hotspot_11.0.17_8.tar.gz" --output mac.tar.gz
    mkdir jdk-11
    tar -xf mac.tar.gz -C jdk-11 --strip-components 1
    rm mac.tar.gz
    
    curl -L "https://github.com/runelite/launcher/releases/latest/download/runelite.jar" --output RuneLite.jar

    jdk-11/Contents/Home/bin/java -Duser.home=client-home -Djava.io.tmpdir=client-tmp -jar RuneLite.jar --nojvm

fi
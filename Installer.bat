@echo off

echo "Hi, this program is written by Ben"
echo "Scripts:"
echo "1 - Download the JDK"
echo "2 - Download Runelite"
echo "3 - Update Runelite"
echo "4 - Download all and run Runelite"
echo "5 - Remove Everything"
echo "6 - Run Runelite"

Setlocal EnableDelayedExpansion

set /p input= "Please enter the script you would like to run:"
IF /I "%input%" EQU "1" (
curl "-L" "https://github.com/adoptium/temurin11-binaries/releases/download/jdk-11.0.17%%2B8/OpenJDK11U-jdk_x64_windows_hotspot_11.0.17_8.zip" "--output" "win.zip"
mkdir "jdk-11"
  tar "-xf" "win.zip" "-C" "jdk-11" "--strip-components" "1"
  DEL  "win.zip"
) ELSE (
 IF /I "%input%" EQU "2" (
    curl "-L" "https://github.com/runelite/launcher/releases/latest/download/runelite.jar" "--output" "RuneLite.jar"
  ) ELSE (
    IF /I "%input%" EQU "3" (
      DEL  "RuneLite.jar"
      curl "-L" "https://github.com/runelite/launcher/releases/latest/download/runelite.jar" "--output" "RuneLite.jar"
    ) ELSE (
      IF /I "%input%" EQU "4" (
curl "-L" "https://github.com/adoptium/temurin11-binaries/releases/download/jdk-11.0.17%%2B8/OpenJDK11U-jdk_x64_windows_hotspot_11.0.17_8.zip" "--output" "win.zip"
        mkdir "jdk-11"
  tar "-xf" "win.zip" "-C" "jdk-11" "--strip-components" "1"
        DEL  "win.zip"
        curl "-L" "https://github.com/runelite/launcher/releases/latest/download/runelite.jar" "--output" "RuneLite.jar"
        
        
        jdk-11\bin\java.exe "-Duser.home=client-home" "-Djava.io.tmpdir=client-tmp" "-jar" "RuneLite.jar" "--nojvm"
      
      
      ) ELSE (
        IF /I "%input%" EQU "5" (
          DEL /S /Q "client-home"
          DEL /S /Q "client-tmp"
          DEL /S /Q "jdk-11"
          DEL  "RuneLite.jar"
        ) ELSE (
          IF /I "%input%" EQU "6" (
            
            
        jdk-11\bin\java.exe "-Duser.home=client-home" "-Djava.io.tmpdir=client-tmp" "-jar" "RuneLite.jar" "--nojvm"
          
          
          
          )
        )
      )
    )
  )
)
@echo off

echo "Hi, this program is written by Ben"
echo "Scripts:"
echo "1 - Download the JDK"
echo "2 - Download Runelite"
echo "3 - Update Runelite"
echo "4 - Download all and run Runelite"
echo "5 - Remove Everything"
echo "6 - Run Runelite"
echo "7 - Fix Invalid Jar"

set /p input= "Please enter the script you would like to run:"
IF /I "%input%" EQU "1" goto DownloadJDK
IF /I "%input%" EQU "2" goto DownloadJar
IF /I "%input%" EQU "3" goto UpdateJar
IF /I "%input%" EQU "4" goto Everything
IF /I "%input%" EQU "5" goto RemoveAll
IF /I "%input%" EQU "6" goto Run
IF /I "%input%" EQU "7" goto FixInvalidJar

:DownloadJDK
curl "-L" "https://github.com/adoptium/temurin11-binaries/releases/download/jdk-11.0.17%%2B8/OpenJDK11U-jdk_x64_windows_hotspot_11.0.17_8.zip" "--output" "win.zip"
mkdir "jdk-11"
tar "-xf" "win.zip" "-C" "jdk-11" "--strip-components" "1"
DEL "win.zip"
goto end

:UpdateJar
DEL "RuneLite.jar"
goto DownloadJar

:DownloadJar
curl "-L" "https://github.com/runelite/launcher/releases/latest/download/runelite.jar" "--output" "RuneLite.jar"
goto end

:Everything
curl "-L" "https://github.com/adoptium/temurin11-binaries/releases/download/jdk-11.0.17%%2B8/OpenJDK11U-jdk_x64_windows_hotspot_11.0.17_8.zip" "--output" "win.zip"
mkdir "jdk-11"
tar "-xf" "win.zip" "-C" "jdk-11" "--strip-components" "1"
DEL "win.zip"
curl "-L" "https://github.com/runelite/launcher/releases/latest/download/runelite.jar" "--output" "RuneLite.jar"
goto Run

:RemoveAll
RMDIR /S /Q "client-home"
RMDIR /S /Q "client-tmp"
RMDIR /S /Q "jdk-11"
DEL "RuneLite.jar"
goto end

:Run
jdk-11\bin\java.exe "-Duser.home=client-home" "-Djava.io.tmpdir=client-tmp" "-jar" "RuneLite.jar" "--launch-mode=REFLECT"
goto end

:FixInvalidJar
DEL "RuneLite.jar"
echo "The last release does not contain a Universal Jar"
echo "Attempting to run a Python file (Requires Python and the Requests package)
for /f %%i in ('python3 GetURL.py') do set VAR=%%i
curl "-L" %VAR% "--output" "RuneLite.jar" 

:end

read input
if test $input -eq 1
then 
    sh Scripts/1-DownloadJDK.sh
elif test $input -eq 2
then 
    sh Scripts/2-DownloadRunelite.sh
elif test $input -eq 3
then 
    sh Scripts/3-UpdateRunelite.sh
elif test $input -eq 4
then 
    sh Scripts/4-Runelite.sh
elif test $input -eq 5
then 
    sh Scripts/1-DownloadJDK.sh
    sh Scripts/2-DownloadRunelite.sh
    sh Scripts/3-UpdateRunelite.sh
    sh Scripts/4-Runelite.sh
fi
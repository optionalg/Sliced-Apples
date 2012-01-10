#!/bin/sh
#Gather extra details on Mac systems

system_profiler > ~/Desktop/profile.txt
#Model Identifier
grep "Model Identifier" ~/Desktop/profile.txt | awk '{print $3}' >> ~/Desktop/details.txt
#Bluetooth
grep -m 1 "[Bb]luetooth" ~/Desktop/profile.txt | sed 's/://' >> ~/Desktop/details.txt
#Wireless
grep "AirPort Extreme" ~/Desktop/profile.txt | sed 's/[ \t]*//' >> ~/Desktop/details.txt
#Video Card
grep -A2 "Graphics" ~/Desktop/profile.txt | sed 's/[ \t]*//;/^$/d' >> ~/Desktop/details.txt

cat ~/Desktop/details.txt | pbcopy

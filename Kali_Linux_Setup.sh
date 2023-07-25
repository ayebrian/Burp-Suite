#!/bin/bash
YELLOW=`tput setaf 3`
echo '${YELLOW}
 .d8888b.          888b    888          .d8888b.          888       888         888b    888 
d88P  Y88b         8888b   888         d88P  Y88b         888       888         8888b   888 
Y88b.              88888b  888         888    888         888  d8b  888         88888b  888 
 "Y888b.           888Y88b 888         888                888 d888b 888         888Y88b 888 
    "Y88b.         888 Y88b888         888  88888         888d88888b888         888 Y88b888 
      "888         888  Y88888         888    888         88888P Y88888         888  Y88888 
Y88b  d88P         888   Y8888         Y88b  d88P         8888P   Y8888         888   Y8888 
 "Y8888P"          888    Y888          "Y8888P88         888P     Y888         888    Y888 
'

if [[ $EUID -eq 0 ]]; then
    # Download Burp Suite Profesional Latet Version
    echo 'Downloading Burp Suite Professional v2022.8.2 ....'
    Link="https://portswigger-cdn.net/burp/releases/download?product=pro&version=2022.8.2&type=jar"
    wget "$Link" -O Burp_Suite_Pro.jar --quiet --show-progress
    sleep 2

    # execute Keygenerator
    echo 'Starting Keygenerator'
    (java -jar keygen.jar) &
    sleep 3s
    
    # Execute Burp Suite Professional with Keyloader
    echo 'Executing Burp Suite Professional with Keyloader'
    echo "java --illegal-access=permit -Dfile.encoding=utf-8 -javaagent:$(pwd)/loader.jar -noverify -jar $(pwd)/Burp_Suite_Pro.jar &" > burp
    chmod +x burp
    cp burp /bin/burp 
    (./burp)
else
    echo "Execute Command as Root User"
    exit
fi

# Lets Download the latest Burp Suite Professional jar File
echo "`n`t 1. Please download latest Burp Suite Professional Jar file from :-:"
echo "`n`t https://portswigger.net/burp/releases/startdownload?product=pro&version=&type=Jar"
echo "`n`t 2. Replace the existing Burp-Suite-Pro.jar file with downloaded jar file. `n`t Keep previous file name"

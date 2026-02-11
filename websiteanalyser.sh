#!/bin/bash

# Input validation
while true; do
    echo -------------------------------------------------------
    echo Website Analyser Tool v1.0.0 | NMAP and Domain Analysis
    read -p "Enter the website address you would like to analyse: " website
    if [ -n "$website" ]; then
        break
    else
        echo "Website cannot be empty!"
    fi
done

echo -------------------------------------------------------
sleep 1
echo Currently running simple silent nmap scan of $website
sudo nmap -sS -sV $website

echo NMAP OUTPUT COMPLETE, MOVING ON
echo --------------------------------------------------
sleep 2

echo Now checking domain ownership
sleep 1

read -p "Want to save this to a log file? (yes/no): " question

if [ "$question" = "yes" ]; then
    read -p "Please enter the file location to save: " outputlog
    whois $website > "$outputlog"
    echo "Saved to $outputlog"
else
    echo "Moving on..."
    sleep 1
    whois $website | grep -i "registrar"
    whois $website | grep -i "registrant"
    whois $website | grep -i "creation date"
fi

sleep 2
echo -------------------------------------------------
echo "Analysis complete!"

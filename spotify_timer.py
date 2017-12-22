#!/usr/bin/env python3
import os
import sys
import time
from datetime import datetime, timedelta

def main():
    if len(sys.argv) >= 2:
        minutes = float(sys.argv[1])
        run_countdown(minutes)
    else:
        print ("usage: [itunes or spotify] [minutes to wait (fractions are allowed)] "
               "[true (if you want your computer to sleep afterward)]")
    if len(sys.argv) == 3 and argv3_value(sys.argv[2]) == True:
        computer_sleep()

def run_countdown(minutes):
    start = datetime.now()
    finish = start + timedelta(minutes = minutes)

    # Wait the proper amount of time, while printing a timer
    print("Time until sleep:")
    for i in range(1, int(minutes * 60)):
        time.sleep(1)
        current_time = datetime.now()
        remaining_time = str(finish - current_time)[:-7]

        sys.stdout.write("\r" + remaining_time)
        sys.stdout.flush()
    pause()

def pause():
    os.system("osascript -e 'tell app \"Spotify\" to playpause'")

def computer_sleep():
    os.system("osascript -e 'tell application \"Finder\" to sleep'")

def argv3_value(value):
    return value.lower() in ("yes", "true", "t", "1")

if __name__ == '__main__':
    main()

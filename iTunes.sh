#!/bin/bash
# Command Line Tool to control iTunes
# 03.01.2017

optionsMenu () {
  echo "-------------------------------";
  echo "Somethings You Can Ask Me To Do";
  echo "-------------------------------";
  echo "USAGE: `basename $0` <option>";
  echo;
  echo " 1. info  = Current track, artist, album info";
  echo " 2. go = Play music"
  echo " 3. x = Pause music"
  echo " 4. next = Play next track"
  echo " 5. prev = Play previous track "
  echo " 6. kill = Stop music "
  echo " 7. tracks = Show currently listed tracks"
  echo " 8. mix = shuffle currently playing list"
}

if [ $# = 0 ]; then
  optionsMenu;
fi

while [ $# -gt 0 ]; do
    arg=$1
    case $arg in
      #DISPLAY NOW PLAYING INFO
        "info" ) state=`osascript -e 'tell application "iTunes" to player state as string'`
            echo "iTunes is currently $state:";
            if [ $state = "playing" ]; then
              artist=`osascript -e 'tell application "iTunes" to artist of current track as string'`;
              track=`osascript -e 'tell application "iTunes" to name of current track as string'`;
              echo "$track by $artist"
            fi
            break;;
      #FIRE iTunes
        "go"    ) echo "Starting iTunes";
            osascript -e 'tell application "iTunes" to play';
            break ;;
      #PAUSE iTunes
        "x"     ) echo "Pausing iTunes";
            osascript -e 'tell application "iTunes" to pause';
            break ;;
      #NEXT TRACK
        "next"  ) echo "Track Switch - NEXT";
            osascript -e 'tell application "iTunes" to next track';
            break ;;
      #PREVIOUS TRACK
        "prev"  ) echo "Track Switch - PREV";
            osascript -e 'tell application "iTunes" to previous track';
            break ;;
    esac
done

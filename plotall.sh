#!/bin/bash


sh ./plotsum.sh &
sh ./plotenergy.sh &
sh ./plotposition.sh &
sh ./plotoccu.sh &
sh ./plotcurrent.sh &

wait 
echo 'All 5 Scripts complete'

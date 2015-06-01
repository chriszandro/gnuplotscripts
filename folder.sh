#!bin/bash

#Job Folder
#mkdir -p ../Job/Jobfiles
#mkdir -p ../Job/JobOutput

#Output Folder
#---System
#mkdir -p ../output/system
#mkdir -p ../output/system/png
#mkdir -p ../output/system/pdf
#---Summary
mkdir -p ../output/summary
mkdir -p ../output/summary/png
mkdir -p ../output/summary/pdf
#---Results
mkdir -p ../output/result
mkdir -p ../output/result/png
mkdir -p ../output/result/pdf
#---Results 2Overview
mkdir -p ../output/result/2overview
mkdir -p ../output/result/2overview/png
mkdir -p ../output/result/2overview/pdf
#---Results 3Overview
mkdir -p ../output/result/3overview
mkdir -p ../output/result/3overview/png
mkdir -p ../output/result/3overview/pdf
#---Single Observables
mkdir -p ../output/result/observables
#---collector
mkdir -p ../output/collector

#-----Current
mkdir -p ../output/result/observables/current
mkdir -p ../output/result/observables/current/png
mkdir -p ../output/result/observables/current/pdf
#-----Position
mkdir -p ../output/result/observables/position
mkdir -p ../output/result/observables/position/png
mkdir -p ../output/result/observables/position/pdf
#-----Energy
mkdir -p ../output/result/observables/energy
mkdir -p ../output/result/observables/energy/png
mkdir -p ../output/result/observables/energy/pdf
#-----Occupation
mkdir -p ../output/result/observables/occupation
mkdir -p ../output/result/observables/occupation/png
mkdir -p ../output/result/observables/occupation/pdf

#---Copy Setplot
cp setplot.gnu ../output/result/setplot.gnu
cp setplot.gnu ../output/summary/setplot.gnu
cp setplot.gnu ../output/system/setplot.gnu

#---Copy Scripts
#-----Summary Folder
cp plotsystems.sh ../output/summary
cp plotwave.sh ../output/summary
#-----Result Folder
cp plotsum.sh ../output/result
cp plotsum2.sh ../output/result
cp plotsum3.sh ../output/result
cp plotsum_t.sh ../output/result
cp plotcurrent.sh ../output/result
cp plotcurrentzoom.sh ../output/result
cp plotposition.sh ../output/result
cp plotoccu.sh ../output/result
cp plotenergy.sh  ../output/result
cp plotall.sh ../output/result

cp clean.sh ../
cp jobster.py ../

#---MISC
touch ../info.txt

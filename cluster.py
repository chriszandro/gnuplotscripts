#Chriszandro Hofmeister
#This program creates Inputfile + Jobfile which matches perfectly
#Imports
import shutil
from time import sleep
import subprocess
import os

#Essentials
description = "system2_simple"
resource = "#PBS -l nodes=1:ppn=24,walltime=24:00:00"

timestep = "1000"
time_start = "1.d0"
time_end = "1.d5" 

computationfile = "computation_test"
project = "master5"
program = "./Release_Intel64/master5"

#Not so essential but maybe important
#---OpenMP
kmpaffinity = "#export KMP_AFFINITY=disabled"
ompdynamic = "#export OMP_DYNAMIC=false"
ompnumthreads =  "#export OMP_NUM_THREADS=6"
#---Threads MKL
mkldynamic = "export MKL_DYNAMIC=true"
mklnumthreads = "export MKL_NUM_THREADS=24"

#Automatic Staff
path = os.getcwd()
inputfile = "inputfile_" + description + ".inp"
jobfile = description + ".job"

#Inputfile Generation
InputFile = open(inputfile, 'w')
InputFile.write("-----------------------Potential----------------------------------------------"+ "\n")          
InputFile.write("        1.2700000000   #l"+ "\n") 
InputFile.write("        0.4000000000   #Delta"+ "\n")
InputFile.write("        0.5000000000   #Vb"+ "\n")
InputFile.write("        0.100000000   #shiftEnergy"+ "\n")
InputFile.write("        0.0000000000   #x-shift"+ "\n")
InputFile.write("-----------------------Vibronic-----------------------------------------"+ "\n")                
InputFile.write("        1.0000000000   #Omega (.1) "+ "\n")
InputFile.write("        0.0000000000   #Lambda (0.06)"+ "\n")
InputFile.write("        0.3000000000   #Parabola Shift (.3)"+ "\n")
InputFile.write("-----------------------Switch Function-----------------------------------------"+ "\n")                
InputFile.write("        0.1000000000   #A" + "\n")
InputFile.write("        0.0100000000   #B"+ "\n")
InputFile.write("        1.0000000000   #C"+ "\n")
InputFile.write("        0.0000000000   #switchShift"+ "\n")
InputFile.write("-----------------------Voltage Grid---------(info: voltage1 = fixed and gridV = 0 for a single voltage) "+ "\n")       
InputFile.write("                 200   #gridV"+ "\n")
InputFile.write("       -1.0000000000   #voltage1"+ "\n")
InputFile.write("        1.0000000000   #voltage2"+ "\n")
InputFile.write("-----------------------Field Grid----------------------------------------------"+ "\n")                               
InputFile.write("                  10   #gridVGate"+ "\n")
InputFile.write("        0.0000000000   #Voltage gate1 (= intial Gate voltage!)"+ "\n")
InputFile.write("        1.5000000000   #Voltage gate2"+ "\n")
InputFile.write("        1.0000000000   #d in nano meter"+ "\n")
InputFile.write("-----------------------Self-Energy---------------------------------------------"+ "\n")
InputFile.write("------------Left- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -"+ "\n")
InputFile.write("        3.0000000000   #beta1"+ "\n")
InputFile.write("        0.1000000000   #beta2"+ "\n")
InputFile.write("                       #someday a new variable..."+ "\n")
InputFile.write("------------Right - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -"+ "\n")
InputFile.write("        3.0000000000   #beta1"+ "\n")    
InputFile.write("        0.1000000000  #beta2"+ "\n")
InputFile.write("                       #someday a new variable..."+ "\n")
InputFile.write("------------Left & Right - - - - - - - - - - - - - - - - - - - - - - - - - - - -"+ "\n")
InputFile.write("      293.0000000000   #Temperature"+ "\n")
InputFile.write("        0.0000000000   #Fermi-Level"+ "\n")
InputFile.write("-----------------------Time Evolution- - - - - - - - - - - - - - - - - - - - - -"+ "\n") 
InputFile.write("            " + timestep + "     #Time step" + "\n")
InputFile.write("            " + time_start + "     #Time start in au" + "\n")
InputFile.write("            " + time_end + "     #Time End in au"+ "\n")
InputFile.write("-----------------------Various Parameter Grid- - - - - - - - - - - - - - - - - -"+ "\n")
InputFile.write("                   1   #Paramter Grid"+ "\n")
InputFile.write("        0.5000000000   #Parameter 1"+ "\n")
InputFile.write("        5.0000000000   #Parameter 2" + "\n")
InputFile.write("-----------------------Various Parameter Grid-----------------------------------")      
InputFile.write("Infos: ")
InputFile.write("")
InputFile.close()

#JobFile
jobName = "#PBS -N " + description  
jobOutput = "#PBS -o ./output/${PBS_JOBNAME}.log"  
jobError = "#PBS -e ./output/${PBS_JOBNAME}.err"
moduleLoad = "module load intel64"
changeDirectory = "cd "  + project 

JobFile = open(jobfile, "w")
JobFile.write("#!/bin/bash -l" + "\n")
JobFile.write('#' + "\n")
JobFile.write('# Resources' + "\n")
JobFile.write("-----------------------------------"+ "\n")
JobFile.write(resource + "\n")
JobFile.write("\n")
JobFile.write("#OpenMP" + "\n")
JobFile.write(kmpaffinity + "\n")
JobFile.write(ompdynamic + "\n")
JobFile.write(ompnumthreads + "\n")
JobFile.write("\n")
JobFile.write("#Threads MKL" + "\n")
JobFile.write(mkldynamic + "\n")
JobFile.write(mklnumthreads + "\n")
JobFile.write("#-----------------------------------"+ "\n")
JobFile.write("\n")

JobFile.write('# Job Specifications' + "\n")
JobFile.write("#-----------------------------------"+ "\n")
JobFile.write('# Job Name' + "\n")  
JobFile.write(jobName +"\n")
JobFile.write("\n")
JobFile.write('# Job Output' + "\n")
JobFile.write(jobOutput + "\n")
JobFile.write(jobError + "\n")
JobFile.write("\n")    
JobFile.write("#Mail with (a)bort, (b)egin, (e)nd" + "\n")
JobFile.write("#PBS -m abe" + "\n") 
JobFile.write("#-----------------------------------"+ "\n")
JobFile.write("\n")

JobFile.write('# Job Execution' + "\n")
JobFile.write("-----------------------------------")
JobFile.write('# Module Load' + "\n")
JobFile.write(moduleLoad + "\n")
JobFile.write("\n")    
JobFile.write('# Change Directory' + "\n")
JobFile.write(changeDirectory + "\n")
JobFile.write("\n")
JobFile.write('# Run' + "\n")
JobFile.write(program + " " + inputfile + " " + computationfile + " " + path + "/")
JobFile.close()
 
#Informational output
print "******************************************************"
print "Inputfile created: \t\t\t\t" + inputfile
print "Job File Created for PBS Cluster System: \t" + jobfile
print "******************************************************"

#Make output folder for job output if it doesnt exist
if not os.path.exists("./output"):
    os.makedirs("./output")

#Computationfile 
try:
    with open(computationfile) as computation:
        print "Computation file has been generated before: " + computationfile
except IOError:
    print "New computation file was generated " + computationfile
    Computation = open(computationfile, "w")  
    Computation.write("---------------Program Mode-------------------------------------\n")
    Computation.write("               1       #Program-Mode | 1: Voltage-Loop\n")
    Computation.write("               1       #Output System Generation: 0: No output, 1: Output\n")
    Computation.write("---------------System-------------------------------------------\n")
    Computation.write("            1000       #N\n" )
    Computation.write("               0       #id\n")
    Computation.write("--------------MasterEq-----------------------------------------\n")
    Computation.write("              80       #medim00          Dimension 00\n"     )
    Computation.write("              80       #medim11          Dimension 11\n")
    Computation.write("               5       #meBand           Bandwidth\n")
    Computation.write("----------------OuputPaths--------------------------------------\n")
    Computation.write("--- System\n" )
    Computation.write("./output2/system\n")
    Computation.write("--- Summary\n")
    Computation.write("./output2/summary\n")
    Computation.write("--- Result\n")
    Computation.write("./output2/result\n")
    Computation.write("---------------Time Evolution-----------------------------------\n")
    Computation.write("               3        #Evaluation Method (1=expokit chebjev, 2=zvode, 3=expokit pade)\n")
    Computation.write("               6        #Pade Coefficient for Calcs\n"               )
    Computation.write("---------------Schroedinger ------------------------------------\n")
    Computation.write("               2      #Logical for Eigensystem Routine for Schroedinger\n")
    Computation.write("        1.0d-25\n")
    Computation.write("---------------------------E O F -------------------------------\n")
    Computation.close()

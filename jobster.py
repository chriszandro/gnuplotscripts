'''
Created on Jul 29, 2013



@author: chriszandro
'''
#Imports
import shutil
from time import sleep
import subprocess
import os

path = os.path.dirname(__file__)
currentDirectory = os.path.split(os.path.dirname(path))[1]

#Ui
program = 'master6'

# Variable Declaration Cluster
binBash = "#!/bin/bash -l"
resource = "#PBS -l nodes=1:ppn=24,walltime=02:00:00"
jobName = "#PBS -N " + currentDirectory + "_" 
jobOutput = "#PBS -o " + path + "/Job/JobOutput/$PBS_JOBID"  
changeDirectory = "cd "  + path 
moduleLoad = "module load intel64"

JobArray = []
JobInputFileArray = [] 

#Copy Computation File
shutil.copyfile('./computation', '../computation')

#Number of jobs
print "How many Jobs?"
number_of_files = input()

#Copy Inputfiles
for index in range(1, number_of_files + 1):
    inputfile = 'inputfile' + str(index)
    shutil.copyfile('./scripts/inputfile', inputfile)

    JobFile = open("./Job/Jobfiles/job_" + inputfile, 'w')
    JobInputFile = open(inputfile)
    
    JobInputFileArray.append(JobInputFile) 
    JobArray.append(JobFile)
    
    #Jobfile Write
    #--------------------------------------------    
    JobFile.write(binBash + "\n")
    JobFile.write('#' + "\n")
    
    JobFile.write('# Resources' + "\n")
    JobFile.write(resource + "\n")
    JobFile.write("\n")
    
    JobFile.write('# Job Name' + "\n")  
    JobFile.write(jobName + inputfile + "\n")
    JobFile.write("\n")
        
    JobFile.write('# Job Output' + "\n")
    JobFile.write(jobOutput + "\n")
    JobFile.write("\n")
    
    JobFile.write('# Module Load' + "\n")
    JobFile.write(moduleLoad + "\n")
    JobFile.write("\n")
    
    JobFile.write('# Change Directory' + "\n")
    JobFile.write(changeDirectory + "\n")
    JobFile.write("\n")
    JobFile.write('# Run' + "\n")
    JobFile.write('./program/' + program + ' ' + inputfile + ' computation ')
    
    JobInputFile.close()
    JobFile.close()
    #--------------------------------------------




# Jobname = "#SBATCH -J NAME"

#decision = raw_input()
#print decision


# if decision == "Y":
#     print "Execution"
# #     for job in JobArray:
# #         subprocess.call(["sbatch", job ])
# #         print job + " was submitted"
# #         sleep(3)
# elif decision == "N":
#     print "Answer is no"
# else:
#     print "Operation canceled
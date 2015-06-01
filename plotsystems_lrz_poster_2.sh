#bash/bin
    #!****************************************************************************************************
    #!Subroutine
    #! Writes Gridpoints, energys and wavefunctions calculated.
    #!
    #! Scheme
    #! -----------------------------------------------------------------
    #! Column 1                : Grid Points
    #! Column 2                : Energy Values unoccupied in eV
    #! Column 3                : Energy Values occupied in eV
    #! Column 4                : Potential unoccupied in eV
    #! Column 5                : Potential occupied in eV
    #! Column 6                : Switch
    #! Column 7                :Gate
    #! Column 8-(8+number_wave): Wave
    #!****************************************************************************************************

#Creating Folder if necessary

mkdir -p ./png
mkdir -p ./pdf


for FILE in *.sum; do

echo "Processing $FILE for SystemView"
gnuplot <<- EOF

set style line 80 lt rgb "#000000"

#Grid	
# set style line 81 lt 0  # dashed
# set style line 81 lt rgb "#808080"  # grey
# set grid back linestyle 81
# set border 3 back linestyle 80
 unset xtics
 unset ytics

#Legend
  
  set key top right
  set key off

  set style line 1 lt rgb "#000000" lw 2 pt 1
  set style line 2 lt rgb "#009600" lw 2 pt 6
  set style line 3 lt rgb "#5060D0" lw 2 pt 2
  set style line 4 lt rgb "#F25900" lw 2 pt 9
  set style line 5 lt rgb "#F25900" lw 1 pt 4
  set style line 6 lt rgb "#000000" lw 2 pt 4
  set border lw 1.5 

  set xrange[-4.2:4.2]

#PNG OUTPUT
#------------------------------------------
 #set term png medium font arial 15
  set term pngcairo font "Arial, 15"
  
 set output "./png/SysView_${FILE}.png" 

 # set title "SysView for ${FILE}"
  
    # --- GRAPH System
   set title ""
    set xlabel "Position [a.u.]"
    set ylabel "Potential [eV]"
    plot "${FILE}" using 1:4 with lines linestyle 1 title "Unoccupied" 

#PDF OUTPUT
#----------------------------------------------------     
#    set term pdfcairo font "Arial,10"
#    set output "./pdf/SysView_${FILE}.pdf" 
    
replot 

EOF
done

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
  set style line 81 lt 0  # dashed
  set style line 81 lt rgb "#808080"  # grey
  set grid back linestyle 81
  set border 3 back linestyle 80
  set xtics nomirror
  set ytics nomirror

#Legend
  
  set key top right
  set key on

  set style line 1 lt rgb "#A00000" lw 2 pt 1
  set style line 2 lt rgb "#00A000" lw 2 pt 6
  set style line 3 lt rgb "#5060D0" lw 2 pt 2
  set style line 4 lt rgb "#F25900" lw 2 pt 9
  set style line 5 lt rgb "#F25900" lw 1 pt 4

  set xrange[-4:4]

#PNG OUTPUT
#------------------------------------------
  #set term pngcairo medium font arial 10
  set term pngcairo font "Arial, 10"
  
 set output "./png/SysView_${FILE}.png" 

  set title "SysView for ${FILE}"
  
    # --- GRAPH System
    set title "${FILE}"
    set xlabel "Position [x]"
    set ylabel "Potential [eV]"
    plot "${FILE}" using 1:4 with lines linestyle 1 title "Unoccupied" , "${FILE}" using 1:5 with lines linestyle 2 title "Occupied", "${FILE}" using 1:6 with lines linestyle 3 title "Switch", "${FILE}" using 1:7 with lines linestyle 5 title "Gate"

#PDF OUTPUT
#----------------------------------------------------     
    set term pdfcairo font "Arial,10"
    set output "./pdf/SysView_${FILE}.pdf" 
    
replot 

EOF
done

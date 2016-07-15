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

#Creating Folders if ncessary
mkdir -p ./png
mkdir -p ./pdf


for FILE in *.sys; do

echo "Processing $FILE"
gnuplot <<- EOF

set style line 80 lt rgb "#000000"
set encoding iso_8859_1

#Grid	
  set style line 81 lt 0  # dashed
  set style line 81 lt rgb "#808080"  # grey
# set grid back linestyle 81
# set border 3 back linestyle 80
  
  set xtics nomirror
  set ytics 0.1 nomirror

#Legend
  
  set key top center
  set key on

  set style line 1 lt rgb "black" lw 2 pt 2
  set style line 2 lt rgb "#00A000" lw 2 pt 3
  set style line 3 lt rgb "#5060D0" lw 2 pt 2
  set style line 4 lt rgb "#F25900" lw 2 pt 4


  set style line 12 lt rgb "#3ce830" lw 2 pt 6
  set style line 13 lt rgb "#00A000" lw 2 pt 6

  set xrange[-2.3:2.3]
  set yrange[-0.00:1.2]  

#PNG OUTPUT
#------------------------------------------
  set terminal pngcairo  font 'Arial, 13' linewidth 3
  set output "./png/States_${FILE}.png" 
  
    # --- GRAPH System
    set title "${FILE}"
    set xlabel "Reaction Coordinate [\305]"
    set ylabel "Energy [eV]"
    
    plot  "${FILE}" using 1:4 with lines linestyle 1 notitle , for[i=6:20] "${FILE}" using 1:i   with lines notitle 
       

EOF
done

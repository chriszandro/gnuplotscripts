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
mkdir -p ./png/xmatrix


for FILE in *.xmatrix; do

echo "Processing $FILE"
gnuplot <<- EOF

set style line 80 lt rgb "#000000"

#Grid	
  set style line 81 lt 0  # dashed
  set style line 81 lt rgb "#808080"  # grey
  set grid back linestyle 81
  set border 3 back linestyle 80
  
  set xtics nomirror
  set ytics 0.1 nomirror

#Legend
  
  set key top center
  set key on

  set style line 1 lt rgb "#A00000" lw 2 pt 1
  set style line 2 lt rgb "#00A000" lw 2 pt 6
  set style line 3 lt rgb "#5060D0" lw 2 pt 2
  set style line 4 lt rgb "#F25900" lw 2 pt 9


  set style line 12 lt rgb "#3ce830" lw 2 pt 6
  set style line 13 lt rgb "#00A000" lw 2 pt 6

# set yrange[-0.05:1.05]  

#PNG OUTPUT
#------------------------------------------
  set terminal pngcairo enhanced dashed  font 'Arial, 8'
  set title "States for ${FILE}"
 
  set xtics (-0.6,0.695,4.61,2.0,3.3,5.95)
  set grid xtics

set key bottom right
set palette rgb 33,13,10

#set yrange[0.001:1.00]
#set xrange[2.50:3.00]

set output "./png/xmatrix/localized_${FILE}.png" 
plot  for[i=2:7] "${FILE}" using 1:i with lines title "State Nr.".(i-1)

set output "./png/xmatrix/DELOCAL_${FILE}.png" 
plot  for[i=7:12] "${FILE}" using 1:i with lines title "State Nr.".(i-1)

EOF
done

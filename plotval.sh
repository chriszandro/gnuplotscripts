#bash/bin

mkdir -p ./val/png

for FILE in *.val; do

echo "Plotting failure in rhox computation"
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
  
  set key bottom right
  set key off

  set style line 1 lt rgb "#A00000" lw 2 pt 1
  set style line 2 lt rgb "#00A000" lw 2 pt 6
  set style line 3 lt rgb "#5060D0" lw 2 pt 2
  set style line 4 lt rgb "#F25900" lw 2 pt 9
  set style line 5 lt rgb "#F25900" lw 1 pt 4

  #set logscale x
 
  #set yrange[0:5]

#PNG OUTPUT
#------------------------------------------
  set term png medium font arial 8
#  set term pngcairo font "Arial, 10"

  set output "./val/png/${FILE}.png" 
#  set size 2,2 

#  set multiplot layout 2,2 rowsfirst title "${FILE}" 

    # --- GRAPH Current
    set title "Validity Check"
    set xlabel "Gate Voltage"
    set ylabel "Boolean"
    plot "${FILE}" using 1:2 with points

EOF
done

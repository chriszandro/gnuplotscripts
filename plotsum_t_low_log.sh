#bash/bin

for FILE in *.evo; do
mkdir -p ./png_log
mkdir -p ./pdf
echo "Processing $FILE for IV Characteristics"
gnuplot <<- EOF

set style line 80 lt rgb "#000000"

#Grid	
  set style line 81 lt 0  # dashed
  set style line 81 lt rgb "#808080"  # grey
  set grid back linestyle 81
  set border 3 back linestyle 80
  
  set format x "%.2g"
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

  set logscale x

#PNG OUTPUT
#------------------------------------------
#  set term png medium font arial 8
  set term pngcairo font "Arial, 10"
  set output "./png_log/evo_${FILE}.png" 
  set size 2,2 

  set multiplot layout 2,2 rowsfirst title "${FILE}" 

    # --- GRAPH Current
    set logscale y
    set title "Current"
    set xlabel "time [a.u.]"
    set ylabel "Current [muA ]"
    plot "${FILE}" using 1:3 every 10 with lines linestyle 2 
    unset logscale y

    # --- GRAPH Position
    set title "Position"
    set xlabel "time [a.u.]"
    set ylabel "Position [Bohr Radius]"
    plot "${FILE}" using 1:2 every 10 with lines linestyle 3

    # --- GRAPH 3
    set title "Energy"
    set xlabel "time [a.u.]"
    set ylabel "Energy [eV]"
    plot "${FILE}" using 1:4 every 10 with lines linestyle 4

    # --- GRAPH d
    set title "Occupation"
    set xlabel "time [a.u.]"
    set ylabel "n"
    plot "${FILE}" using 1:6 every 10 with lines linestyle 5

unset multiplot


EOF
done

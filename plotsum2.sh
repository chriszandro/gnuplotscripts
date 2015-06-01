#bash/bin

mkdir -p ./2overview/png
mkdir -p ./2overview/pdf

for FILE in *.dat; do

echo "Processing $FILE for IV Characteristics"
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


#PNG OUTPUT
#------------------------------------------
#  set term png medium font arial 8
  set term pngcairo font "Arial, 10"
  set output "./2overview/png/${FILE}.png" 
  set size 2,2 

  set multiplot layout 2,2 rowsfirst title "${FILE}" 

    # --- GRAPH Window Unoccupied
    set title "Window Unoccupied"
    set xlabel "Voltage [V]"
    set ylabel "Number of States"
    plot "${FILE}" using 1:8 with lines linestyle 2

    # --- GRAPH Window Occupied
    set title "Window Occupied"
    set xlabel "Voltage [V]"
    set ylabel "Number of States"
    plot "${FILE}" using 1:9 with lines linestyle 3

    # --- GRAPH 3 Error
    set title "LU Error"
    set xlabel "Voltage [V]"
    set ylabel "Error (true = 1)"
    plot "${FILE}" using 1:7 with lines linestyle 4

    # --- GRAPH d
    set title  "Time in Loop"
    set xlabel "Voltage [V]"
    set ylabel "Time [s]"
    plot "${FILE}" using 1:10 with lines linestyle 1

unset multiplot

#PDF OUTPUT
#----------------------------------------------------    
#    set term pdf font "Arial,4"
    set term pdfcairo font "Arial,10"
    set output "./2overview/pdf/${FILE}.pdf" 
    set size 11,8.5
     
  set multiplot layout 2,2 rowsfirst title "${FILE}"

    # --- GRAPH Window Unoccupied
    set title "Window Unoccupied"
    set xlabel "Voltage [V]"
    set ylabel "Number of States"
    plot "${FILE}" using 1:8 with lines linestyle 2

    # --- GRAPH Window Occupied
    set title "Window Occupied"
    set xlabel "Voltage [V]"
    set ylabel "Number of States"
    plot "${FILE}" using 1:9 with lines linestyle 3

    # --- GRAPH 3 Error
    set title "LU Error"
    set xlabel "Voltage [V]"
    set ylabel "Error (true = 1)"
    plot "${FILE}" using 1:7 with lines linestyle 4

    # --- GRAPH d
    set title  "Time in Loop"
    set xlabel "Voltage [V]"
    set ylabel "Time [s]"
    plot "${FILE}" using 1:10 with lines linestyle 1


unset multiplot


EOF
done

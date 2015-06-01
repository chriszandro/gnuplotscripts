#bash/bin

mkdir -p ./png
mkdir -p ./pdf

for FILE in *.dat; do

echo "Processing $FILE for 3overview"
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
  
  set output "./3overview/png/${FILE}_overview3.png" 
  set size 2,2 

  set multiplot layout 2,2 rowsfirst title "${FILE}" 

    # --- GRAPH Window Unoccupied
    set title "Ground State Unoccupied"
    set xlabel "Voltage [V]"
    set ylabel "Energy in eV"
    plot "${FILE}" using 1:11 with lines linestyle 2

    # --- GRAPH Window Occupied
    set title "1st excited state Unoccupied"
    set xlabel "Voltage [V]"
    set ylabel "Energy in eV"
    plot "${FILE}" using 1:12 with lines linestyle 3

    # --- GRAPH 3 Error
    set title "Ground State Occupied"
    set xlabel "Voltage [V]"
    set ylabel "Energy in eV"
    plot "${FILE}" using 1:13 with lines linestyle 4

    # --- GRAPH d
    set title "1st excited state Unoccupied"
    set xlabel "Voltage [V]"
    set ylabel "Energy in eV"
    plot "${FILE}" using 1:14 with lines linestyle 1

unset multiplot

#PDF OUTPUT
#----------------------------------------------------    
  #  set term pdf font "Arial,4"
    set term pngcairo font "Arial, 10"
    set output "./3overview/pdf/${FILE}_overview3.pdf" 
    set size 11,8.5
     
  set multiplot layout 2,2 rowsfirst title "${FILE}"

    # --- GRAPH Window Unoccupied
    set title "Ground State Unoccupied"
    set xlabel "Voltage [V]"
    set ylabel "Energy in eV"
    plot "${FILE}" using 1:11 with lines linestyle 2

    # --- GRAPH Window Occupied
    set title "1st excited state Unoccupied"
    set xlabel "Voltage [V]"
    set ylabel "Energy in eV"
    plot "${FILE}" using 1:12 with lines linestyle 3

    # --- GRAPH 3 Error
    set title "Ground State Occupied"
    set xlabel "Voltage [V]"
    set ylabel "Energy in eV"
    plot "${FILE}" using 1:13 with lines linestyle 4

    # --- GRAPH d
    set title "1st excited state Unoccupied"
    set xlabel "Voltage [V]"
    set ylabel "Energy in eV"
    plot "${FILE}" using 1:14 with lines linestyle 1


unset multiplot


EOF
done

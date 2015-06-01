set style line 80 lt rgb "#000000"

#Grid   
  set style line 81 lt 0  # dashed
  set style line 81 lt rgb "#808080"  # grey
  set grid back linestyle 81
  set border 3 back linestyle 80
  set xtics nomirror
  set ytics nomirror



set terminal pdfcairo font "Arial,10"
set output "on_off_ratio.pdf"

set ylabel "Ratio"
set xlabel "Voltage [V]"

plot "./big.dat" using 1:($22/$3) with lines linestyle 1 title "On/off ratio"

set output "on_off_compare.pdf"
set ylabel "Current"

plot "./big.dat" using 1:3 with lines linestyle 2 title "off state", "./big.dat" using 1:22 with lines linestyle 1 title "on state"

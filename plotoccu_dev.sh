#bash/bin

for FILE in *.p1; do
mkdir -p ./occupation/

echo "Processing $FILE"
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
  
  set key top center
  set key on

  set style line 1 lt rgb "#A00000" lw 2 pt 1
  set style line 2 lt rgb "#00A000" lw 2 pt 6
  set style line 3 lt rgb "#5060D0" lw 2 pt 2
  set style line 4 lt rgb "#F25900" lw 2 pt 9
  set style line 5 lt rgb "#A25900" lw 2 pt 9
  
  set style line 6 lt rgb "#F259A0" lw 2 pt 9
  set style line 7 lt rgb "#02F909" lw 2 pt 9
  set style line 8 lt rgb "#C200FF" lw 2 pt 9
  set style line 9 lt rgb "#025934" lw 2 pt 9
  set style line 10 lt rgb "#02A9F0" lw 2 pt 9

  set style line 11 lt  rgb "#F259A0" lw 2 pt 9
  set style line 12 lt  rgb "#02F909" lw 2 pt 9
  set style line 13 lt  rgb "#C200FF" lw 2 pt 9
  set style line 14 lt  rgb "#025934" lw 2 pt 9
  set style line 15 lt  rgb "#02A9F0" lw 2 pt 9

  set logscale y 

  #PNG OUTPUT
#------------------------------------------
  set terminal pngcairo enhanced dashed  font 'Arial, 8'
  set output "./occupation/${FILE}.png" 
  set xtics (-0.6,0.695,4.61,2.0,3.3,5.95)
  set grid xtics
# set xrange[0:2.5]
  set yrange[0.001:1]

x0=NaN
y0=NaN

 set title "System ${FILE}"
  f(x) = x - 2.0 
    # --- GRAPH System
    set title "${FILE}"
    set xlabel "Voltage [V]"
    set ylabel "Occupation"
    plot "${FILE}" using (dx=column(1)-x0,x0=column(1),1-dx/2):(dy=$2-y0,y0=$2,dy/dx) with lines title "State Nr.".(2-1)

EOF
done

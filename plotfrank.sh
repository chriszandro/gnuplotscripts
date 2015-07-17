#bash/bin

mkdir -p ./frank
mkdir -p ./frank

for FILE in *.cou; do

echo "Processing $FILE for Frank-Condon"
gnuplot <<- EOF

#set style line 80 lt rgb "#000000"

#Grid	
# set style line 81 lt 0  # dashed
# set style line 81 lt rgb "#808080"  # grey
# set grid back linestyle 81
# set border 3 back linestyle 80
# set xtics nomirror
# set ytics nomirror

#Legend
  
  set key bottom right
#  set key off

# set style line 1 lt rgb "#A00000" lw 2 pt 1
# set style line 2 lt rgb "#00A000" lw 2 pt 6
# set style line 3 lt rgb "#5060D0" lw 2 pt 2
# set style line 4 lt rgb "#F25900" lw 2 pt 9
# set style line 5 lt rgb "#F25900" lw 1 pt 4

set palette rgb 33,13,10
#set logscale cb

#PNG OUTPUT
#------------------------------------------
  set term png medium font arial 10
  set output "./frank/${FILE}.png" 

    set view map
    set title "Franck-Condon of File: ${FILE}"
    plot "${FILE}" matrix with image 


EOF
done

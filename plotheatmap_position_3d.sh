#bash/bin

#Create Directories
mkdir -p ./position3d

#Console Input
echo "3D Plotter in Matlab Style"
echo " "

read -e -p "Resultion: " resolution
read -e -p "xrot : " xrot 
read -e -p "yrot: " yrot 

for FILE in *xyz.pom; do
echo "Processing: ${FILE}"

gnuplot <<- EOF

set style line 80 lt rgb "#000000"

#Grid	
  set style line 81 lt 0  # dashed
  set style line 81 lt rgb "#808080"  # grey
  set grid back linestyle 81
  set border 3 back linestyle 80
  
  set format x "%.2g"
  set format y "%.2g"
   
  set xtics nomirror
  set ytics nomirror

#Legend
  
  #set key bottom right
  #set key off

  set style line 1 lt rgb "#A00000" lw 2 pt 1
  set style line 2 lt rgb "#00A000" lw 2 pt 6
  set style line 3 lt rgb "#5060D0" lw 2 pt 2
  set style line 4 lt rgb "#F25900" lw 2 pt 9
  set style line 5 lt rgb "#F25900" lw 1 pt 4

 #Palettes
  
  #Disble colorbar tics
  set cbtics scale 0
  
  # matlab palette colors
  set palette defined ( 0 "#000090",\
                      1 "#000fff",\
                      2 "#0090ff",\
                      3 "#0fffee",\
                      4 "#90ff70",\
                      5 "#ffee00",\
                      6 "#ff7000",\
                      7 "#ee0000",\
                      8 "#7f0000")

# 3d Parameters                      
  
  set pm3d
  set hidden3d
  set isosamples 10
  #set contour base

# Labels

  #X Labels
  set xlabel "Bias Voltage U [V]"
  set ylabel "Gate Voltage V [V]"
  set zlabel ""

# set xrange[-1.5:1.5]
  set yrange[1.5:2.5]
  set view ${xrot}, ${yrot}
  set key off

#set logscale y

#PNG OUTPUT
#------------------------------------------
#   set term png medium font arial 8
    set term pngcairo font "Arial, 10"
    set output "./position3d/rhox_${FILE}.png" 
   
    splot "${FILE}" every :${resolution} using 1:2:3 with lines

EOF
done
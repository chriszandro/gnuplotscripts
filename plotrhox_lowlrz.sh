#bash/bin

#Create Directories
mkdir -p ./pdf/rhox
mkdir -p ./png/rhox

#Console Input
echo "3D Plotter in Matlab Style"
read -e -p "File for 3D plot:  " FILE
echo " "

read -e -p "Resolution" resolution

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

  set title "Density Matrix in Position Representation"
 
  #X Labels
  set xlabel "Position x [a.u.]"
  set ylabel "Voltage [V]"
  set zlabel "rhoxx"

# set view 28, 69
  set key off
  #set yrange[0:5E3]
  #set logscale x

#PNG OUTPUT
#------------------------------------------
   set term png medium font arial 8
 ##   set term pngcairo font "Arial, 10"

    set output "./png/rhox/rhox_standard_${FILE}.png" 
    splot "${FILE}" every :${resolution} using 1:2:3 with lines

    set output "./png/rhox/rhox_Topview_${FILE}.png" 
    set view 28, 69
    splot "${FILE}" every :${resolution} using 1:2:3 with lines
     
    set output "./png/rhox/rhox_Topview2_${FILE}.png" 
    set view 60, 60
    splot "${FILE}" every :${resolution} using 1:2:3 with lines
  
    set output "./png/rhox/rhox_Topview3_${FILE}.png" 
    set view 28, 0
    splot "${FILE}" every :${resolution} using 1:2:3 with lines
##Range Change

set yrange[0:1E5]

 
    set output "./png/rhox/rhox_standardE5_${FILE}.png" 
    splot "${FILE}" every :${resolution} using 1:2:3 with lines

    set output "./png/rhox/rhox_TopviewE5_${FILE}.png" 
    set view 28, 69
    splot "${FILE}" every :${resolution} using 1:2:3 with lines
     
    set output "./png/rhox/rhox_Topview2E5_${FILE}.png" 
    set view 60, 60
    splot "${FILE}" every :${resolution} using 1:2:3 with lines
  
    set output "./png/rhox/rhox_Topview3E5_${FILE}.png" 
    set view 28, 0
    splot "${FILE}" every :${resolution} using 1:2:3 with lines
#PDF OUTPUT
#----------------------------------------------------    
    set term pdf font "Arial,4"
#     set term pdfcairo font "Arial,10"
     set output "./pdf/rhox/evo_${FILE}.pdf" 
  
     replot 
  
EOF

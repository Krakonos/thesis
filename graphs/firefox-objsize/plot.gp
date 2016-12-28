
set grid
set term x11
set datafile separator ","

# MPR-A1 style
#set tics nomirror

# Set grid style
set style line 11 lc rgb '#808080' lt 1
set style line 12 lc rgb '#808080' lt 0 lw 1
set border 1+2+8 back ls 11
set grid back ls 12
set grid mytics ls 12


#set terminal svg size 1024,768 fname 'OpenSans, Verdana, Helvetica, Arial, sans-serif' fsize '9' rounded dashed
set terminal pngcairo size 1200,600 font 'OpenSans, Verdana, Helvetica, Arial, sans-serif' rounded dashed

unset key
#set key left top
# End of style

set palette negative

set style line 1 pt 0 lw 5 lc rgb '#D73027' # red
set style line 2 pt 0 lw 5 lc rgb '#F46D43' # orange
set style line 3 pt 0 lw 5 lc rgb '#FDAE61' # 
set style line 4 pt 0 lw 5 lc rgb '#74ADD1' # medium blue
set style line 5 pt 0 lw 5 lc rgb '#4575B4' # blue
set style line 6 pt 0 lw 5 lc rgb '#542788' # dark purple
set style line 7 pt 0 lw 5 lc rgb '#A6DBA0' # 
set style line 8 pt 0 lw 5 lc rgb '#5AAE61' # medium green
set style line 9 pt 0 lw 5 lc rgb '#1B7837' # dark green

# palette
set palette defined ( 0 '#D73027',\
		1 '#F46D43',\
		2 '#FDAE61',\
		3 '#FEE090',\
		4 '#4575B4',\
	    5 '#542788',\
        6 '#A6DBA0',\
        7 '#5AAE61',\
        8 '#1B7837'\
)

set style data histogram
set style histogram cluster gap 1
set boxwidth 0.8
set style fill solid

set xtics rotate 90
set y2tics rotate by 90
unset ytics
unset y2tics
set format y2 "%.2f MB"
set yrange [0:80]

set output 'objsize.png'
plot "data.csv" using 1:($2/1024):xtic(3) with boxes, \
     "data.csv" using 1:($2/1024):(gprintf(" %.2f MB",$2/1024)) with labels left rotate





#set terminal svg size 600,1200 fname 'OpenSans, Verdana, Helvetica, Arial, sans-serif' fsize '9' rounded dashed
#set output "objsize.svg"

set terminal epslatex standalone size 8cm,15cm
set output "objsize.tex"

replot


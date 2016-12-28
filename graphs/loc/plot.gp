
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

set key left top
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

set xdata time
set timefmt "%b %Y"
set ylabel "Lines of code (in millions)"
set format x "%Y"
set xrange ["Jan 2006":"Dec 2016"]
set xtics rotate by 45 
set xtics offset graph 0,-0.08
set xlabel " "

set output 'loc.png'
plot "gcc.csv" using 1:($2/1000000)         with linespoints ls 4 title "GCC", \
     "chrome.csv" using 1:($2/1000000)         with linespoints ls 8 title "Chromium", \
     "firefox.csv" using 1:($2/1000000)         with linespoints ls 1 title "Firefox"


#set terminal svg size 1200,600 fname 'OpenSans, Verdana, Helvetica, Arial, sans-serif' fsize '9' rounded dashed
#set output "loc.svg"

set terminal epslatex standalone
set output "loc.tex"

replot



set grid
set term x11
#set datafile separator ","

# MPR-A1 style
#set tics nomirror

# Set grid style
set style line 11 lc rgb '#000000' lt 1
set style line 12 lc rgb '#808080' lt 0 lw 1
set border 1+2+8 back ls 11
set grid back ls 12
set grid mytics ls 12


#set terminal svg size 1024,768 fname 'OpenSans, Verdana, Helvetica, Arial, sans-serif' fsize '9' rounded dashed
set terminal pngcairo size 1200,300 font 'OpenSans, Verdana, Helvetica, Arial, sans-serif' rounded dashed
set output "firefox-ipa-pta.png"

set key left top
# End of style

set palette negative

set style line 1 pt 0 lw 2 lc rgb '#D73027' # red
set style line 2 pt 0 lw 2 lc rgb '#F46D43' # orange
set style line 3 pt 0 lw 2 lc rgb '#FDAE61' # 
set style line 4 pt 0 lw 2 lc rgb '#74ADD1' # medium blue
set style line 5 pt 0 lw 2 lc rgb '#4575B4' # blue
set style line 6 pt 0 lw 2 lc rgb '#542788' # dark purple
set style line 7 pt 0 lw 2 lc rgb '#A6DBA0' # 
set style line 8 pt 0 lw 2 lc rgb '#5AAE61' # medium green
set style line 9 pt 0 lw 2 lc rgb '#1B7837' # dark green

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

set xlabel "Running time (in minutes)"
set ylabel "CPU cores used" textcolor rgbcolor '#5AAE61'
set y2label "Memory used (in GB)" textcolor rgbcolor '#D73027'
set xtics 60
set ytics border nomirror norotate
set y2tics
#set y2range [0:50]
#set key outside center bottom box font ",15" spacing 4
unset key
set grid
set yrange [0:9]

plot \
   'cgstat.log' using ($1/60):($3/(100*10**7)) title 'CPU time used' with lines ls 8,  \
   'cgstat.log' using ($1/60):($2/(1024*1024*1024)) axes x1y2 title 'Memory used' with lines ls 1

set terminal epslatex standalone color colortext size 14cm,6cm
set output "firefox-ipa-pta.tex"

replot

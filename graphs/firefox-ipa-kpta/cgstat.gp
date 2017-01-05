set term png size 1280,1024
set output 'cgstat.png'
set title "Resource usage over time\n./cmd" font ",20"
set xlabel "Running time (in seconds)"
set ylabel "CPU cores used"
set y2label "memory used (in GB)"
set ytics border nomirror norotate
set y2tics
#set y2range [0:50]
set key outside center bottom box font ",15" spacing 4
set grid
plot \
   'cgstat.log' using ($2/(1024*1024*1024)) axes x1y2 title 'Memory used' with lines, \
   'cgstat.log' using ($3/(100*10**7)) title 'CPU time used' with lines
set term qt size 1900,900
replot

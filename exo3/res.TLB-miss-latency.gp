# Calibrator v0.9e
# (by Stefan.Manegold@cwi.nl, http://www.cwi.nl/~manegold/)
set term pdfcairo enhanced color size 12,8 font 'Arial,12'
set output 'res.TLB-miss-latency.pdf'
#set term gif background "white" interlace small size 800, 700 # xFFFFFF x333333 x333333 x0055FF x005522 x660000 xFF0000 x00FF00 x0000FF
#set output 'res.TLB-miss-latency.gif'
set style data linespoints
set key below
set title 'res.TLB-miss-latency'
set xlabel 'spots accessed'
set x2label ''
set ylabel 'nanosecs per iteration'
set y2label 'cycles per iteration'
set logscale x 2
set logscale x2 2
set logscale y 10
set logscale y2 10
set format x '%1.0f'
set format x2 '%1.0f'
set format y '%1.0f'
set format y2 ''
set xrange[3.000000:5120.000000]
#set x2range[3.000000:5120.000000]
set yrange[1.000000:1000.000000]
#set y2range[1.000000:1000.000000]
set grid x2tics
set xtics mirror ('1' 1, '2' 2, '4' 4, '8' 8, '16' 16, '32' 32, '64' 64, '128' 128, '256' 256, '512' 512, '1k' 1024, '2k' 2048, '4k' 4096)
set x2tics mirror ('[48]' 48, '<L1>' 1024)
set y2tics ('(4)' 1.070000, '(9)' 2.460000, '3.7' 1, '37' 10, '370' 100, '3.7e+03' 1000)
set label 1 '(1.08)  ' at 3.000000,1.081081 right
set arrow 1 from 3.000000,1.081081 to 5120.000000,1.081081 nohead lt 0
set label 2 '(2.43)  ' at 3.000000,2.432432 right
set arrow 2 from 3.000000,2.432432 to 5120.000000,2.432432 nohead lt 0
plot \
0.1 title 'stride:' with points pt 0 ps 0 , \
'res.TLB-miss-latency.data' using 1:($7-0.000000) title '\{8200\}' with linespoints lt 2 pt 4 , \
'res.TLB-miss-latency.data' using 1:($13-0.000000) title '4104' with linespoints lt 3 pt 5 , \
'res.TLB-miss-latency.data' using 1:($19-0.000000) title '2056' with linespoints lt 4 pt 6 , \
'res.TLB-miss-latency.data' using 1:($25-0.000000) title '1032' with linespoints lt 5 pt 7
set nolabel
set noarrow

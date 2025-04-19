# Calibrator v0.9e
# (by Stefan.Manegold@cwi.nl, http://www.cwi.nl/~manegold/)
set term pdfcairo enhanced color size 12,8 font 'Arial,12'
set output 'res.cache-replace-time.pdf'
#set term gif background "white" interlace small size 800, 700 # xFFFFFF x333333 x333333 x0055FF x005522 x660000 xFF0000 x00FF00 x0000FF
#set output 'res.cache-replace-time.gif'
set style data linespoints
set key below
set title 'res.cache-replace-time'
set xlabel 'memory range [bytes]'
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
set xrange[0.750000:40960.000000]
#set x2range[0.750000:40960.000000]
set yrange[1.000000:1000.000000]
#set y2range[1.000000:1000.000000]
set grid x2tics
set xtics mirror ('1k' 1, '' 2, '4k' 4, '' 8, '16k' 16, '' 32, '64k' 64, '' 128, '256k' 256, '' 512, '1M' 1024, '' 2048, '4M' 4096, '' 8192, '16M' 16384, '' 32768)
set x2tics mirror)
set y2tics ('(4)' 1.060000, '3.7' 1, '37' 10, '370' 100, '3.7e+03' 1000)
set label 1 '(1.08)  ' at 0.750000,1.081081 right
set arrow 1 from 0.750000,1.081081 to 40960.000000,1.081081 nohead lt 0
plot \
0.1 title 'stride:' with points pt 0 ps 0 , \
'res.cache-replace-time.data' using 1:($7-0.000000) title '16' with linespoints lt 1 pt 3 , \
'res.cache-replace-time.data' using 1:($13-0.000000) title '8' with linespoints lt 2 pt 4
set nolabel
set noarrow

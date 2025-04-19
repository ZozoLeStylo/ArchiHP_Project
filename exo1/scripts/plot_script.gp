
set terminal pngcairo size 800,600
set output 'graphrep1.png'
set title "Temps d'accès aux données vs nombre de données (1 répétition)"
set xlabel "Nombre de données (en millions)"
set ylabel "Temps (en secondes)"
set xtics 5e6
set yrange [0.0001:0.01]
set ytics 0.0001, 0.0005, 0.01
set grid
plot 'res1rep1.csv' using 2:1 with lines title "Temps vs Données"

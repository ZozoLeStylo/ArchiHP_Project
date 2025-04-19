
set terminal pngcairo size 800,600
set output 'graphrep10core.png'
set title "Temps d'accès aux données vs nombre de données (10 répétitions sur le coeur 0)"
set xlabel "Nombre de données (en millions)"
set ylabel "Temps (en secondes)"
set xtics 5e6
set yrange [0.0001:0.003]
set ytics 0.0001, 0.0005, 0.003
set grid
plot 'res1rep10core.csv' using 2:1 with lines title "Temps vs Données"

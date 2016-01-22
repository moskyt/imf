set terminal png noenhanced
set xzeroaxis linetype -1 linewidth 1.5
set key outside
set key right top
set output "plots/plot_01.png"
set xlabel "time signal"
set ylabel "y"
set title 'secret experiment #4070'
plot "data/file_01.csv" using 1:2 title "y1",
set output "plots/plot_02.png"
set xlabel "time signal"
set ylabel "intensity"
set title 'detector calibration 18. 10. 2015'
plot "data/file_02.csv" using 3:1 title "y2","data/file_02.csv" using 3:2 title "y1","data/file_02.csv" using 3:4 title "y4","data/file_02.csv" using 3:5 title "y3",
set output "plots/plot_03.png"
set xlabel "time signal"
set ylabel "y"
set title 'secret experiment #1001'
plot "data/file_03.csv" using 3:1 title "y3","data/file_03.csv" using 3:2 title "y2","data/file_03.csv" using 3:4 title "y4","data/file_03.csv" using 3:5 title "y1",
set output "plots/plot_04.png"
set xlabel "time signal"
set ylabel "y"
set title 'secret experiment #5171'
plot "data/file_04.csv" using 1:2 title "y4","data/file_04.csv" using 1:3 title "y2","data/file_04.csv" using 1:4 title "y3","data/file_04.csv" using 1:5 title "y5","data/file_04.csv" using 1:6 title "y1",
set output "plots/plot_05.png"
set xlabel "time"
set ylabel "signal strength"
set title 'file_05'
plot "data/file_05.csv" using 1:2 title "y2","data/file_05.csv" using 1:3 title "y1",
set output "plots/plot_06.png"
set xlabel "time"
set ylabel "signal strength"
set title 'secret experiment #3643'
plot "data/file_06.csv" using 3:1 title "y1","data/file_06.csv" using 3:2 title "y2",
set output "plots/plot_07.png"
set xlabel "time"
set ylabel "y"
set title 'secret experiment #2472'
plot "data/file_07.csv" using 5:1 title "y2","data/file_07.csv" using 5:2 title "y1","data/file_07.csv" using 5:3 title "y3","data/file_07.csv" using 5:4 title "y4",
set output "plots/plot_08.png"
set xlabel "time"
set ylabel "y"
set title 'secret experiment #3280'
plot "data/file_08.csv" using 6:1 title "y1","data/file_08.csv" using 6:2 title "y4","data/file_08.csv" using 6:3 title "y3","data/file_08.csv" using 6:4 title "y6","data/file_08.csv" using 6:5 title "y2","data/file_08.csv" using 6:7 title "y5",
set output "plots/plot_09.png"
set xlabel "time"
set ylabel "intensity"
set title 'secret experiment #5480'
plot "data/file_09.csv" using 4:1 title "y5","data/file_09.csv" using 4:2 title "y3","data/file_09.csv" using 4:3 title "y2","data/file_09.csv" using 4:5 title "y4","data/file_09.csv" using 4:6 title "y1",
set output "plots/plot_10.png"
set xlabel "time"
set ylabel "intensity"
set title 'secret experiment #5031'
plot "data/file_10.csv" using 3:1 title "y1","data/file_10.csv" using 3:2 title "y2",
set output "plots/plot_11.png"
set xlabel "time"
set ylabel "y"
set title 'secret experiment #5762'
plot "data/file_11.csv" using 5:1 title "y3","data/file_11.csv" using 5:2 title "y5","data/file_11.csv" using 5:3 title "y2","data/file_11.csv" using 5:4 title "y4","data/file_11.csv" using 5:6 title "y1","data/file_11.csv" using 5:7 title "y6",
set output "plots/plot_12.png"
set xlabel "time"
set ylabel "signal strength"
set title 'file_12'
plot "data/file_12.csv" using 5:1 title "y3","data/file_12.csv" using 5:2 title "y2","data/file_12.csv" using 5:3 title "y1","data/file_12.csv" using 5:4 title "y4",
set output "plots/plot_13.png"
set xlabel "time signal"
set ylabel "signal strength"
set title 'file_13'
plot "data/file_13.csv" using 1:2 title "y5","data/file_13.csv" using 1:3 title "y4","data/file_13.csv" using 1:4 title "y2","data/file_13.csv" using 1:5 title "y6","data/file_13.csv" using 1:6 title "y1","data/file_13.csv" using 1:7 title "y3",
set output "plots/plot_14.png"
set xlabel "time signal"
set ylabel "signal strength"
set title 'secret experiment #3704'
plot "data/file_14.csv" using 1:2 title "y1",
set output "plots/plot_15.png"
set xlabel "time"
set ylabel "y"
set title 'secret experiment #3557'
plot "data/file_15.csv" using 3:1 title "y6","data/file_15.csv" using 3:2 title "y1","data/file_15.csv" using 3:4 title "y2","data/file_15.csv" using 3:5 title "y4","data/file_15.csv" using 3:6 title "y5","data/file_15.csv" using 3:7 title "y3",
set output "plots/plot_16.png"
set xlabel "time"
set ylabel "intensity"
set title 'file_16'
plot "data/file_16.csv" using 3:1 title "y2","data/file_16.csv" using 3:2 title "y3","data/file_16.csv" using 3:4 title "y5","data/file_16.csv" using 3:5 title "y4","data/file_16.csv" using 3:6 title "y1",
set output "plots/plot_17.png"
set xlabel "time signal"
set ylabel "y"
set title 'detector calibration 16. 11. 2015'
plot "data/file_17.csv" using 2:1 title "y4","data/file_17.csv" using 2:3 title "y3","data/file_17.csv" using 2:4 title "y5","data/file_17.csv" using 2:5 title "y2","data/file_17.csv" using 2:6 title "y1",
set output "plots/plot_18.png"
set xlabel "time"
set ylabel "y"
set title 'file_18'
plot "data/file_18.csv" using 4:1 title "y1","data/file_18.csv" using 4:2 title "y2","data/file_18.csv" using 4:3 title "y4","data/file_18.csv" using 4:5 title "y3",
set output "plots/plot_19.png"
set xlabel "time"
set ylabel "intensity"
set title 'secret experiment #3487'
plot "data/file_19.csv" using 4:1 title "y2","data/file_19.csv" using 4:2 title "y5","data/file_19.csv" using 4:3 title "y4","data/file_19.csv" using 4:5 title "y1","data/file_19.csv" using 4:6 title "y3","data/file_19.csv" using 4:7 title "y6",
set output "plots/plot_20.png"
set xlabel "elapsed time"
set ylabel "intensity"
set title 'secret experiment #3760'
plot "data/file_20.csv" using 3:1 title "y2","data/file_20.csv" using 3:2 title "y5","data/file_20.csv" using 3:4 title "y3","data/file_20.csv" using 3:5 title "y6","data/file_20.csv" using 3:6 title "y4","data/file_20.csv" using 3:7 title "y1",
set output "plots/plot_21.png"
set xlabel "time signal"
set ylabel "y"
set title 'file_21'
plot "data/file_21.csv" using 2:1 title "y3","data/file_21.csv" using 2:3 title "y4","data/file_21.csv" using 2:4 title "y1","data/file_21.csv" using 2:5 title "y2",
set output "plots/plot_22.png"
set xlabel "time"
set ylabel "intensity"
set title 'secret experiment #4214'
plot "data/file_22.csv" using 5:1 title "y1","data/file_22.csv" using 5:2 title "y4","data/file_22.csv" using 5:3 title "y3","data/file_22.csv" using 5:4 title "y2",
set output "plots/plot_23.png"
set xlabel "time"
set ylabel "intensity"
set title 'secret experiment #4709'
plot "data/file_23.csv" using 3:1 title "y1","data/file_23.csv" using 3:2 title "y5","data/file_23.csv" using 3:4 title "y2","data/file_23.csv" using 3:5 title "y4","data/file_23.csv" using 3:6 title "y3",
set output "plots/plot_24.png"
set xlabel "time"
set ylabel "intensity"
set title 'detector calibration 16. 05. 2015'
plot "data/file_24.csv" using 6:1 title "y5","data/file_24.csv" using 6:2 title "y3","data/file_24.csv" using 6:3 title "y1","data/file_24.csv" using 6:4 title "y2","data/file_24.csv" using 6:5 title "y4",
set output "plots/plot_25.png"
set xlabel "time signal"
set ylabel "y"
set title 'secret experiment #5504'
plot "data/file_25.csv" using 1:2 title "y4","data/file_25.csv" using 1:3 title "y1","data/file_25.csv" using 1:4 title "y2","data/file_25.csv" using 1:5 title "y3",
set output "plots/plot_26.png"
set xlabel "time"
set ylabel "intensity"
set title 'detector calibration 11. 03. 2015'
plot "data/file_26.csv" using 2:1 title "y2","data/file_26.csv" using 2:3 title "y1",
set output "plots/plot_27.png"
set xlabel "elapsed time"
set ylabel "y"
set title 'secret experiment #3689'
plot "data/file_27.csv" using 3:1 title "y4","data/file_27.csv" using 3:2 title "y2","data/file_27.csv" using 3:4 title "y1","data/file_27.csv" using 3:5 title "y3",
set output "plots/plot_28.png"
set xlabel "time signal"
set ylabel "intensity"
set title 'secret experiment #5032'
plot "data/file_28.csv" using 1:2 title "y4","data/file_28.csv" using 1:3 title "y1","data/file_28.csv" using 1:4 title "y2","data/file_28.csv" using 1:5 title "y3",
set output "plots/plot_29.png"
set xlabel "time"
set ylabel "intensity"
set title 'file_29'
plot "data/file_29.csv" using 5:1 title "y4","data/file_29.csv" using 5:2 title "y2","data/file_29.csv" using 5:3 title "y1","data/file_29.csv" using 5:4 title "y5","data/file_29.csv" using 5:6 title "y3",
set output "plots/plot_30.png"
set xlabel "time signal"
set ylabel "y"
set title 'file_30'
plot "data/file_30.csv" using 2:1 title "y2","data/file_30.csv" using 2:3 title "y1",
set output "plots/plot_31.png"
set xlabel "time signal"
set ylabel "y"
set title 'secret experiment #2513'
plot "data/file_31.csv" using 3:1 title "y2","data/file_31.csv" using 3:2 title "y1","data/file_31.csv" using 3:4 title "y3","data/file_31.csv" using 3:5 title "y4",
set output "plots/plot_32.png"
set xlabel "time"
set ylabel "intensity"
set title 'detector calibration 28. 11. 2015'
plot "data/file_32.csv" using 1:2 title "y3","data/file_32.csv" using 1:3 title "y1","data/file_32.csv" using 1:4 title "y2","data/file_32.csv" using 1:5 title "y4",
set output "plots/plot_33.png"
set xlabel "time signal"
set ylabel "intensity"
set title 'file_33'
plot "data/file_33.csv" using 6:1 title "y3","data/file_33.csv" using 6:2 title "y1","data/file_33.csv" using 6:3 title "y4","data/file_33.csv" using 6:4 title "y2","data/file_33.csv" using 6:5 title "y5",
set output "plots/plot_34.png"
set xlabel "time signal"
set ylabel "intensity"
set title 'secret experiment #5834'
plot "data/file_34.csv" using 2:1 title "y2","data/file_34.csv" using 2:3 title "y3","data/file_34.csv" using 2:4 title "y1",
set output "plots/plot_35.png"
set xlabel "time"
set ylabel "intensity"
set title 'detector calibration 27. 08. 2015'
plot "data/file_35.csv" using 5:1 title "y3","data/file_35.csv" using 5:2 title "y4","data/file_35.csv" using 5:3 title "y5","data/file_35.csv" using 5:4 title "y1","data/file_35.csv" using 5:6 title "y6","data/file_35.csv" using 5:7 title "y2",
set output "plots/plot_36.png"
set xlabel "time signal"
set ylabel "intensity"
set title 'secret experiment #4647'
plot "data/file_36.csv" using 3:1 title "y1","data/file_36.csv" using 3:2 title "y2",
set output "plots/plot_37.png"
set xlabel "time signal"
set ylabel "signal strength"
set title 'secret experiment #1381'
plot "data/file_37.csv" using 1:2 title "y4","data/file_37.csv" using 1:3 title "y2","data/file_37.csv" using 1:4 title "y3","data/file_37.csv" using 1:5 title "y1","data/file_37.csv" using 1:6 title "y5",
set output "plots/plot_38.png"
set xlabel "time signal"
set ylabel "y"
set title 'secret experiment #1893'
plot "data/file_38.csv" using 4:1 title "y3","data/file_38.csv" using 4:2 title "y5","data/file_38.csv" using 4:3 title "y2","data/file_38.csv" using 4:5 title "y1","data/file_38.csv" using 4:6 title "y4",
set output "plots/plot_39.png"
set xlabel "time"
set ylabel "intensity"
set title 'file_39'
plot "data/file_39.csv" using 2:1 title "y4","data/file_39.csv" using 2:3 title "y5","data/file_39.csv" using 2:4 title "y2","data/file_39.csv" using 2:5 title "y1","data/file_39.csv" using 2:6 title "y3",
set output "plots/plot_40.png"
set xlabel "time"
set ylabel "intensity"
set title 'secret experiment #1241'
plot "data/file_40.csv" using 2:1 title "y1",
set output "plots/plot_41.png"
set xlabel "time"
set ylabel "signal strength"
set title 'detector calibration 19. 10. 2015'
plot "data/file_41.csv" using 1:2 title "y2","data/file_41.csv" using 1:3 title "y1",
set output "plots/plot_42.png"
set xlabel "time"
set ylabel "y"
set title 'secret experiment #2528'
plot "data/file_42.csv" using 5:1 title "y5","data/file_42.csv" using 5:2 title "y3","data/file_42.csv" using 5:3 title "y1","data/file_42.csv" using 5:4 title "y2","data/file_42.csv" using 5:6 title "y4",
set output "plots/plot_43.png"
set xlabel "time"
set ylabel "intensity"
set title 'detector calibration 28. 10. 2015'
plot "data/file_43.csv" using 1:2 title "y1","data/file_43.csv" using 1:3 title "y2",
set output "plots/plot_44.png"
set xlabel "time signal"
set ylabel "signal strength"
set title 'secret experiment #4686'
plot "data/file_44.csv" using 2:1 title "y1",
set output "plots/plot_45.png"
set xlabel "time signal"
set ylabel "intensity"
set title 'file_45'
plot "data/file_45.csv" using 3:1 title "y1","data/file_45.csv" using 3:2 title "y2","data/file_45.csv" using 3:4 title "y3",
set output "plots/plot_46.png"
set xlabel "time signal"
set ylabel "intensity"
set title 'secret experiment #3450'
plot "data/file_46.csv" using 2:1 title "y3","data/file_46.csv" using 2:3 title "y1","data/file_46.csv" using 2:4 title "y2","data/file_46.csv" using 2:5 title "y4","data/file_46.csv" using 2:6 title "y5",
set output "plots/plot_47.png"
set xlabel "time"
set ylabel "intensity"
set title 'secret experiment #2903'
plot "data/file_47.csv" using 4:1 title "y3","data/file_47.csv" using 4:2 title "y2","data/file_47.csv" using 4:3 title "y1",
set output "plots/plot_48.png"
set xlabel "time"
set ylabel "intensity"
set title 'detector calibration 16. 07. 2015'
plot "data/file_48.csv" using 1:2 title "y4","data/file_48.csv" using 1:3 title "y5","data/file_48.csv" using 1:4 title "y3","data/file_48.csv" using 1:5 title "y1","data/file_48.csv" using 1:6 title "y2",
set output "plots/plot_49.png"
set xlabel "time"
set ylabel "signal strength"
set title 'secret experiment #5422'
plot "data/file_49.csv" using 1:2 title "y1",
set output "plots/plot_50.png"
set xlabel "time signal"
set ylabel "intensity"
set title 'file_50'
plot "data/file_50.csv" using 1:2 title "y1","data/file_50.csv" using 1:3 title "y4","data/file_50.csv" using 1:4 title "y3","data/file_50.csv" using 1:5 title "y2",

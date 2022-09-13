set terminal png size 800,600;
set key top right
set title noenhanced



set output "out/file_01.png"
set title 'secret experiment #4070'
set xlabel "time signal"
set ylabel ""

plot 'data/file_01.csv' using 1:2 title 'y1'


set output "out/file_02.png"
set title 'detector calibration 18. 10. 2015'
set xlabel "time signal"
set ylabel "intensity"

plot 'data/file_02.csv' using 3:1 title 'y2', 'data/file_02.csv' using 3:2 title 'y1', 'data/file_02.csv' using 3:4 title 'y4', 'data/file_02.csv' using 3:5 title 'y3'


set output "out/file_03.png"
set title 'secret experiment #1001'
set xlabel "time signal"
set ylabel ""

plot 'data/file_03.csv' using 3:1 title 'y3', 'data/file_03.csv' using 3:2 title 'y2', 'data/file_03.csv' using 3:4 title 'y4', 'data/file_03.csv' using 3:5 title 'y1'


set output "out/file_04.png"
set title 'secret experiment #5171'
set xlabel "time signal"
set ylabel ""

plot 'data/file_04.csv' using 1:2 title 'y4', 'data/file_04.csv' using 1:3 title 'y2', 'data/file_04.csv' using 1:4 title 'y3', 'data/file_04.csv' using 1:5 title 'y5', 'data/file_04.csv' using 1:6 title 'y1'


set output "out/file_05.png"
set title 'file_05'
set xlabel ""
set ylabel "signal strength"

plot 'data/file_05.csv' using 1:2 title 'y2', 'data/file_05.csv' using 1:3 title 'y1'


set output "out/file_06.png"
set title 'secret experiment #3643'
set xlabel ""
set ylabel "signal strength"

plot 'data/file_06.csv' using 3:1 title 'y1', 'data/file_06.csv' using 3:2 title 'y2'


set output "out/file_07.png"
set title 'secret experiment #2472'
set xlabel ""
set ylabel ""

plot 'data/file_07.csv' using 5:1 title 'y2', 'data/file_07.csv' using 5:2 title 'y1', 'data/file_07.csv' using 5:3 title 'y3', 'data/file_07.csv' using 5:4 title 'y4'


set output "out/file_08.png"
set title 'secret experiment #3280'
set xlabel ""
set ylabel ""

plot 'data/file_08.csv' using 6:1 title 'y1', 'data/file_08.csv' using 6:2 title 'y4', 'data/file_08.csv' using 6:3 title 'y3', 'data/file_08.csv' using 6:4 title 'y6', 'data/file_08.csv' using 6:5 title 'y2', 'data/file_08.csv' using 6:7 title 'y5'


set output "out/file_09.png"
set title 'secret experiment #5480'
set xlabel ""
set ylabel "intensity"

plot 'data/file_09.csv' using 4:1 title 'y5', 'data/file_09.csv' using 4:2 title 'y3', 'data/file_09.csv' using 4:3 title 'y2', 'data/file_09.csv' using 4:5 title 'y4', 'data/file_09.csv' using 4:6 title 'y1'


set output "out/file_10.png"
set title 'secret experiment #5031'
set xlabel ""
set ylabel "intensity"

plot 'data/file_10.csv' using 3:1 title 'y1', 'data/file_10.csv' using 3:2 title 'y2'


set output "out/file_11.png"
set title 'secret experiment #5762'
set xlabel ""
set ylabel ""

plot 'data/file_11.csv' using 5:1 title 'y3', 'data/file_11.csv' using 5:2 title 'y5', 'data/file_11.csv' using 5:3 title 'y2', 'data/file_11.csv' using 5:4 title 'y4', 'data/file_11.csv' using 5:6 title 'y1', 'data/file_11.csv' using 5:7 title 'y6'


set output "out/file_12.png"
set title 'file_12'
set xlabel ""
set ylabel "signal strength"

plot 'data/file_12.csv' using 5:1 title 'y3', 'data/file_12.csv' using 5:2 title 'y2', 'data/file_12.csv' using 5:3 title 'y1', 'data/file_12.csv' using 5:4 title 'y4'


set output "out/file_13.png"
set title 'file_13'
set xlabel "time signal"
set ylabel "signal strength"

plot 'data/file_13.csv' using 1:2 title 'y5', 'data/file_13.csv' using 1:3 title 'y4', 'data/file_13.csv' using 1:4 title 'y2', 'data/file_13.csv' using 1:5 title 'y6', 'data/file_13.csv' using 1:6 title 'y1', 'data/file_13.csv' using 1:7 title 'y3'


set output "out/file_14.png"
set title 'secret experiment #3704'
set xlabel "time signal"
set ylabel "signal strength"

plot 'data/file_14.csv' using 1:2 title 'y1'


set output "out/file_15.png"
set title 'secret experiment #3557'
set xlabel ""
set ylabel ""

plot 'data/file_15.csv' using 3:1 title 'y6', 'data/file_15.csv' using 3:2 title 'y1', 'data/file_15.csv' using 3:4 title 'y2', 'data/file_15.csv' using 3:5 title 'y4', 'data/file_15.csv' using 3:6 title 'y5', 'data/file_15.csv' using 3:7 title 'y3'


set output "out/file_16.png"
set title 'file_16'
set xlabel ""
set ylabel "intensity"

plot 'data/file_16.csv' using 3:1 title 'y2', 'data/file_16.csv' using 3:2 title 'y3', 'data/file_16.csv' using 3:4 title 'y5', 'data/file_16.csv' using 3:5 title 'y4', 'data/file_16.csv' using 3:6 title 'y1'


set output "out/file_17.png"
set title 'detector calibration 16. 11. 2015'
set xlabel "time signal"
set ylabel ""

plot 'data/file_17.csv' using 2:1 title 'y4', 'data/file_17.csv' using 2:3 title 'y3', 'data/file_17.csv' using 2:4 title 'y5', 'data/file_17.csv' using 2:5 title 'y2', 'data/file_17.csv' using 2:6 title 'y1'


set output "out/file_18.png"
set title 'file_18'
set xlabel ""
set ylabel ""

plot 'data/file_18.csv' using 4:1 title 'y1', 'data/file_18.csv' using 4:2 title 'y2', 'data/file_18.csv' using 4:3 title 'y4', 'data/file_18.csv' using 4:5 title 'y3'


set output "out/file_19.png"
set title 'secret experiment #3487'
set xlabel ""
set ylabel "intensity"

plot 'data/file_19.csv' using 4:1 title 'y2', 'data/file_19.csv' using 4:2 title 'y5', 'data/file_19.csv' using 4:3 title 'y4', 'data/file_19.csv' using 4:5 title 'y1', 'data/file_19.csv' using 4:6 title 'y3', 'data/file_19.csv' using 4:7 title 'y6'


set output "out/file_20.png"
set title 'secret experiment #3760'
set xlabel "elapsed time"
set ylabel "intensity"

plot 'data/file_20.csv' using 3:1 title 'y2', 'data/file_20.csv' using 3:2 title 'y5', 'data/file_20.csv' using 3:4 title 'y3', 'data/file_20.csv' using 3:5 title 'y6', 'data/file_20.csv' using 3:6 title 'y4', 'data/file_20.csv' using 3:7 title 'y1'


set output "out/file_21.png"
set title 'file_21'
set xlabel "time signal"
set ylabel ""

plot 'data/file_21.csv' using 2:1 title 'y3', 'data/file_21.csv' using 2:3 title 'y4', 'data/file_21.csv' using 2:4 title 'y1', 'data/file_21.csv' using 2:5 title 'y2'


set output "out/file_22.png"
set title 'secret experiment #4214'
set xlabel ""
set ylabel "intensity"

plot 'data/file_22.csv' using 5:1 title 'y1', 'data/file_22.csv' using 5:2 title 'y4', 'data/file_22.csv' using 5:3 title 'y3', 'data/file_22.csv' using 5:4 title 'y2'


set output "out/file_23.png"
set title 'secret experiment #4709'
set xlabel ""
set ylabel "intensity"

plot 'data/file_23.csv' using 3:1 title 'y1', 'data/file_23.csv' using 3:2 title 'y5', 'data/file_23.csv' using 3:4 title 'y2', 'data/file_23.csv' using 3:5 title 'y4', 'data/file_23.csv' using 3:6 title 'y3'


set output "out/file_24.png"
set title 'detector calibration 16. 05. 2015'
set xlabel ""
set ylabel "intensity"

plot 'data/file_24.csv' using 6:1 title 'y5', 'data/file_24.csv' using 6:2 title 'y3', 'data/file_24.csv' using 6:3 title 'y1', 'data/file_24.csv' using 6:4 title 'y2', 'data/file_24.csv' using 6:5 title 'y4'


set output "out/file_25.png"
set title 'secret experiment #5504'
set xlabel "time signal"
set ylabel ""

plot 'data/file_25.csv' using 1:2 title 'y4', 'data/file_25.csv' using 1:3 title 'y1', 'data/file_25.csv' using 1:4 title 'y2', 'data/file_25.csv' using 1:5 title 'y3'


set output "out/file_26.png"
set title 'detector calibration 11. 03. 2015'
set xlabel ""
set ylabel "intensity"

plot 'data/file_26.csv' using 2:1 title 'y2', 'data/file_26.csv' using 2:3 title 'y1'


set output "out/file_27.png"
set title 'secret experiment #3689'
set xlabel "elapsed time"
set ylabel ""

plot 'data/file_27.csv' using 3:1 title 'y4', 'data/file_27.csv' using 3:2 title 'y2', 'data/file_27.csv' using 3:4 title 'y1', 'data/file_27.csv' using 3:5 title 'y3'


set output "out/file_28.png"
set title 'secret experiment #5032'
set xlabel "time signal"
set ylabel "intensity"

plot 'data/file_28.csv' using 1:2 title 'y4', 'data/file_28.csv' using 1:3 title 'y1', 'data/file_28.csv' using 1:4 title 'y2', 'data/file_28.csv' using 1:5 title 'y3'


set output "out/file_29.png"
set title 'file_29'
set xlabel ""
set ylabel "intensity"

plot 'data/file_29.csv' using 5:1 title 'y4', 'data/file_29.csv' using 5:2 title 'y2', 'data/file_29.csv' using 5:3 title 'y1', 'data/file_29.csv' using 5:4 title 'y5', 'data/file_29.csv' using 5:6 title 'y3'


set output "out/file_30.png"
set title 'file_30'
set xlabel "time signal"
set ylabel ""

plot 'data/file_30.csv' using 2:1 title 'y2', 'data/file_30.csv' using 2:3 title 'y1'


set output "out/file_31.png"
set title 'secret experiment #2513'
set xlabel "time signal"
set ylabel ""

plot 'data/file_31.csv' using 3:1 title 'y2', 'data/file_31.csv' using 3:2 title 'y1', 'data/file_31.csv' using 3:4 title 'y3', 'data/file_31.csv' using 3:5 title 'y4'


set output "out/file_32.png"
set title 'detector calibration 28. 11. 2015'
set xlabel ""
set ylabel "intensity"

plot 'data/file_32.csv' using 1:2 title 'y3', 'data/file_32.csv' using 1:3 title 'y1', 'data/file_32.csv' using 1:4 title 'y2', 'data/file_32.csv' using 1:5 title 'y4'


set output "out/file_33.png"
set title 'file_33'
set xlabel "time signal"
set ylabel "intensity"

plot 'data/file_33.csv' using 6:1 title 'y3', 'data/file_33.csv' using 6:2 title 'y1', 'data/file_33.csv' using 6:3 title 'y4', 'data/file_33.csv' using 6:4 title 'y2', 'data/file_33.csv' using 6:5 title 'y5'


set output "out/file_34.png"
set title 'secret experiment #5834'
set xlabel "time signal"
set ylabel "intensity"

plot 'data/file_34.csv' using 2:1 title 'y2', 'data/file_34.csv' using 2:3 title 'y3', 'data/file_34.csv' using 2:4 title 'y1'


set output "out/file_35.png"
set title 'detector calibration 27. 08. 2015'
set xlabel ""
set ylabel "intensity"

plot 'data/file_35.csv' using 5:1 title 'y3', 'data/file_35.csv' using 5:2 title 'y4', 'data/file_35.csv' using 5:3 title 'y5', 'data/file_35.csv' using 5:4 title 'y1', 'data/file_35.csv' using 5:6 title 'y6', 'data/file_35.csv' using 5:7 title 'y2'


set output "out/file_36.png"
set title 'secret experiment #4647'
set xlabel "time signal"
set ylabel "intensity"

plot 'data/file_36.csv' using 3:1 title 'y1', 'data/file_36.csv' using 3:2 title 'y2'


set output "out/file_37.png"
set title 'secret experiment #1381'
set xlabel "time signal"
set ylabel "signal strength"

plot 'data/file_37.csv' using 1:2 title 'y4', 'data/file_37.csv' using 1:3 title 'y2', 'data/file_37.csv' using 1:4 title 'y3', 'data/file_37.csv' using 1:5 title 'y1', 'data/file_37.csv' using 1:6 title 'y5'


set output "out/file_38.png"
set title 'secret experiment #1893'
set xlabel "time signal"
set ylabel ""

plot 'data/file_38.csv' using 4:1 title 'y3', 'data/file_38.csv' using 4:2 title 'y5', 'data/file_38.csv' using 4:3 title 'y2', 'data/file_38.csv' using 4:5 title 'y1', 'data/file_38.csv' using 4:6 title 'y4'


set output "out/file_39.png"
set title 'file_39'
set xlabel ""
set ylabel "intensity"

plot 'data/file_39.csv' using 2:1 title 'y4', 'data/file_39.csv' using 2:3 title 'y5', 'data/file_39.csv' using 2:4 title 'y2', 'data/file_39.csv' using 2:5 title 'y1', 'data/file_39.csv' using 2:6 title 'y3'


set output "out/file_40.png"
set title 'secret experiment #1241'
set xlabel ""
set ylabel "intensity"

plot 'data/file_40.csv' using 2:1 title 'y1'


set output "out/file_41.png"
set title 'detector calibration 19. 10. 2015'
set xlabel ""
set ylabel "signal strength"

plot 'data/file_41.csv' using 1:2 title 'y2', 'data/file_41.csv' using 1:3 title 'y1'


set output "out/file_42.png"
set title 'secret experiment #2528'
set xlabel ""
set ylabel ""

plot 'data/file_42.csv' using 5:1 title 'y5', 'data/file_42.csv' using 5:2 title 'y3', 'data/file_42.csv' using 5:3 title 'y1', 'data/file_42.csv' using 5:4 title 'y2', 'data/file_42.csv' using 5:6 title 'y4'


set output "out/file_43.png"
set title 'detector calibration 28. 10. 2015'
set xlabel ""
set ylabel "intensity"

plot 'data/file_43.csv' using 1:2 title 'y1', 'data/file_43.csv' using 1:3 title 'y2'


set output "out/file_44.png"
set title 'secret experiment #4686'
set xlabel "time signal"
set ylabel "signal strength"

plot 'data/file_44.csv' using 2:1 title 'y1'


set output "out/file_45.png"
set title 'file_45'
set xlabel "time signal"
set ylabel "intensity"

plot 'data/file_45.csv' using 3:1 title 'y1', 'data/file_45.csv' using 3:2 title 'y2', 'data/file_45.csv' using 3:4 title 'y3'


set output "out/file_46.png"
set title 'secret experiment #3450'
set xlabel "time signal"
set ylabel "intensity"

plot 'data/file_46.csv' using 2:1 title 'y3', 'data/file_46.csv' using 2:3 title 'y1', 'data/file_46.csv' using 2:4 title 'y2', 'data/file_46.csv' using 2:5 title 'y4', 'data/file_46.csv' using 2:6 title 'y5'


set output "out/file_47.png"
set title 'secret experiment #2903'
set xlabel ""
set ylabel "intensity"

plot 'data/file_47.csv' using 4:1 title 'y3', 'data/file_47.csv' using 4:2 title 'y2', 'data/file_47.csv' using 4:3 title 'y1'


set output "out/file_48.png"
set title 'detector calibration 16. 07. 2015'
set xlabel ""
set ylabel "intensity"

plot 'data/file_48.csv' using 1:2 title 'y4', 'data/file_48.csv' using 1:3 title 'y5', 'data/file_48.csv' using 1:4 title 'y3', 'data/file_48.csv' using 1:5 title 'y1', 'data/file_48.csv' using 1:6 title 'y2'


set output "out/file_49.png"
set title 'secret experiment #5422'
set xlabel ""
set ylabel "signal strength"

plot 'data/file_49.csv' using 1:2 title 'y1'


set output "out/file_50.png"
set title 'file_50'
set xlabel "time signal"
set ylabel "intensity"

plot 'data/file_50.csv' using 1:2 title 'y1', 'data/file_50.csv' using 1:3 title 'y4', 'data/file_50.csv' using 1:4 title 'y3', 'data/file_50.csv' using 1:5 title 'y2'


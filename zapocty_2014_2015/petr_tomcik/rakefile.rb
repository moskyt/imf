task :core do


  file="input.txt"     # vlozit nazev vstupniho souboru!!!

  type=[]                           # typ kazety
  pos=[]                            # pozice kazety [x,y]
  properties={}                     # vlastnosti kazety - pozice - typ a barva
  xposition=[]                      # x-ove souradnice rohu hexagonu
  yposition=[]                      # y-ove souradnice rohu hexagonu
  xcenter=350                       # x-ova pozice stredu
  ycenter=300                       # y-ova pozice stredu
  typelist=[]                       # seznam typu kazet (kvuli prirazeni barev)
  colors={}                         # pomocny hash pro barvy
  i=0                               # y-ova hodnota v souradnem systemu
  j=0                               # y-ova hodnota v souradnem systemu
  k=0                               # index
  clr=[]                            # barvy kazet
  clr[0]="rgb(70,255,70)"           # barevna paleta
  clr[1]="rgb(0,126,253)"
  clr[2]="rgb(145,200,255)"
  clr[3]="rgb(255,255,60)"
  clr[4]="rgb(255,90,90)"
  clr[5]="rgb(255,155,55)"
  clr[6]="rgb(50,240,200)"
  clr[7]="rgb(180,180,0)"
  clr[8]="rgb(255,108,182)"
  clr[9]="rgb(213,90,90)"
  itransform=[1,0,-1,0,-1,0,1,0,1,1,-1,-1]       # sada poli pro transformaci souradnic
  jtransform=[0,1,0,-1,1,1,-1,-1,1,0,-1,0]
  xtransform=[1,0.5,1,0.5,0.5,1,0.5,1,-0.5,1,-0.5,1]
  ytransform=[0,1,0,1,1,0,1,0,1,0,1,0]



  IO.foreach("#{file}") do |line|                # zpracovani vstupniho souboru
    line=line.strip.split('* ').last
    line=line.split(' ')
    line=line.reverse
    typelist << line
    (type << line).flatten!
  end
  
  type=type.insert(7,type.delete_at(28))
  
  typelist=type.uniq                             # tvorba seznamu typu kazet
  typelist=typelist-["*"]
  
  typelist.each do |col|                         # prirazovani barev
    addcol=clr[k]
    colors[col] = addcol
    k=k+1
  end
  
  k=0
                                              
  (0..7).each do |j|                             # tvorba hashe pro nasledne vykresleni schematu
    (1..7-j).each do |i|
      k=k+1
      properties[[i,j]]||={}
      properties[[i,j]][:type]=type[k]
      properties[[i,j]][:col]=colors[type[k]]    
    end
  end
                                              
  properties[[0,0]]||={}                         # ulozeni dat centralni kazety
  properties[[0,0]][:type]=type[0]
  properties[[0,0]][:col]=colors[type[0]]  
  
  
  
  File.open("core.svg", "w") do |f|                        # tvorba souboru svg
    
      f.puts "<svg width=\"700\" height=\"600\" xmlns=\"http://www.w3.org/2000/svg\" version=\"1.1\">"
  
      xposition[0]=xcenter-21.6506                         # centralni kazeta
      xposition[1]=xcenter
      xposition[2]=xcenter+21.6506
      yposition[0]=(ycenter-25)
      yposition[1]=(ycenter-12.5)
      yposition[2]=(ycenter+12.5)
      yposition[3]=(ycenter+25)  
      f.puts " <polygon points=\"#{xposition[1]} #{yposition[0]},#{xposition[2]} #{yposition[1]},#{xposition[2]} #{yposition[2]},#{xposition[1]} #{yposition[3]},#{xposition[0]} #{yposition[2]},#{xposition[0]} #{yposition[1]}\" stroke=\"black\" stroke-width=\"1\" fill=\"#{properties[[0,0]][:col]}\"/>"
      f.puts "<text x=\"#{xposition[1]}\" y=\"#{ycenter+5}\" text-anchor=\"middle\" fill=\"black\" font-weight=\"bold\" font-size=\"14\">#{properties[[0,0]][:type]}</text>"  


      (0..5).each do |hex|                                 # ostatni kazety
        (0..7).each do |j|                            
          (1..7-j).each do |i|
            i1=itransform[2*hex]*i+itransform[2*hex+1]*j
            j1=jtransform[2*hex]*i+jtransform[2*hex+1]*j
            xa=xcenter+43.3012701892*(xtransform[2*hex]*i1+xtransform[2*hex+1]*j1)                     
            ya=ycenter-37.5*(ytransform[2*hex]*i1+ytransform[2*hex+1]*j1)
            xposition[0]=(xa-21.6506)
            xposition[1]=xa
            xposition[2]=(xa+21.6506)
            yposition[0]=(ya-25)
            yposition[1]=(ya-12.5)
            yposition[2]=(ya+12.5)
            yposition[3]=(ya+25)
            unless (j == 0 && i == 7)  
              f.puts " <polygon points=\"#{xposition[1]} #{yposition[0]},#{xposition[2]} #{yposition[1]},#{xposition[2]} #{yposition[2]},#{xposition[1]} #{yposition[3]},#{xposition[0]} #{yposition[2]},#{xposition[0]} #{yposition[1]}\" stroke=\"black\" stroke-width=\"1\" fill=\"#{properties[[i,j]][:col]}\"/>"
              f.puts "<text x=\"#{xposition[1]}\" y=\"#{yposition[2]-7.5}\" text-anchor=\"middle\" fill=\"black\" font-weight=\"bold\" font-size=\"14\">#{properties[[i,j]][:type]}</text>"
            end    
          end
        end
      end

                     
      f.puts "</svg>"        
  end

end
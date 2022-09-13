radky=File.readlines('data.txt')

html=File.open("template/template.html").read



class ColorPicker
   @@colors = ['#e6194b', '#3cb44b', '#ffe119', '#4363d8', '#f58231', '#911eb4', '#46f0f0', '#f032e6', '#bcf60c', '#fabebe', '#008080', '#e6beff', '#9a6324', '#fffac8', '#800000', '#aaffc3', '#808000', '#ffd8b1', '#000075', '#808080'] #převzato z https://sashat.me/2017/01/11/list-of-20-simple-distinct-colors/
    def initialize()
        @iterator=0
        @soubordict={}
    end

    def get(soubor)
        color = @soubordict[soubor]
        if !color then
            color = @soubordict[soubor] = @@colors[@iterator]
            @iterator+=1
            @iterator = @iterator % @@colors.size
        end
        return color
    end
end

colorPicker = ColorPicker.new


def hex_element(x,y,units,kanal,kanalcolor,pocet) 
    horizontal_step=17.12
    vertical_step=15.0

    hex_html='<use xlink:href="#hexa" transform="translate(#X#, #Y#)" fill="#KANALCOLOR#"/>'
    text_html='<text x="#X#" y="#Y#" text-anchor="middle"  font-size="0.2em" font-weight="bold">#TEXT#</text>'
    link_html='<a href="#" onclick="alert(\'#POCET#\');return false;">#TEXT#</a>'

    xunit=units[0]
    yunit=units[1]

  
    if y>0 then
        x+=1
    end


    xcoord=horizontal_step*( x*xunit[0] + y*yunit[0])
    ycoord=vertical_step*(x*xunit[1] + y*yunit[1])


    hexstr=hex_html
    hexstr=hexstr.gsub('#X#',xcoord.to_s)
    hexstr=hexstr.gsub('#Y#',ycoord.to_s)
    hexstr=hexstr.gsub('#KANALCOLOR#',kanalcolor)

    textstr=text_html
    textstr=textstr.gsub('#X#',xcoord.to_s)
    textstr=textstr.gsub('#Y#',ycoord.to_s)
    textstr=textstr.gsub('#TEXT#',kanal)


    linkstr=link_html
    linkstr=linkstr.gsub('#TEXT#',textstr)
    linkstr=linkstr.gsub('#POCET#',pocet.to_s)



    return hexstr + "\n" + linkstr
end

smery = [ [[-1,0],[-0.5,1]], [[-0.5,1],[0.5,1]], [[0.5,1],[1,0]], [[1,0],[0.5,-1]], [[0.5,-1],[-0.5,-1]], [[0.5,1],[1,0]], [[-0.5,-1],[-1,0]] ]

grid=[]
counter={}

radekn=0
for radek in radky do
    kanaln=0
    for kanal in radek.split.reverse do
        if kanaln==0 and radekn==0 then
            stred=kanal
        else
            counter[kanal] ||= 0
            counter[kanal] += 1
        end

        kanaln+=1
    end
    radekn+=1
end

for key in counter.keys do
    if key==stred then #prostřední se přičítá zvlášť
        counter[key] = counter[key]*6 + 1
    else
        counter[key] *=  6
    end
end




radekn=0
for radek in radky do 
    smern=0
    for smer in smery do
        kanaln=0
        for kanal in radek.split.reverse do
            
            if kanal=='*' then
                next
            elsif kanaln==0 and radekn==0 and smern!=0 then #aby se prostřední element neumísťoval vícekrát
                kanaln+=1
                next
            end
            kanalcolor = colorPicker.get(kanal)

            grid << hex_element(kanaln,radekn,smer,kanal,kanalcolor,counter[kanal])



            kanaln+=1 
        end
        smern+=1
        
    end
    radekn+=1
end


html=html.gsub("#AZ#",grid.join("\n"))
# Výstup
File.write("output.html", html)





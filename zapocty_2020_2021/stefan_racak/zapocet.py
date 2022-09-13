with open ("jmena.txt", "r") as subor:
    jmena = []
    for riadok in subor:
        jmena.extend(riadok.split())

   

data = {}
znaky = ["," , "." , ":" , "(" , ")" , ";" , "-"]
with open ("data.txt" , "r") as subor:

    cast = []

    for riadok in subor:
        for znak in znaky:
            riadok = riadok.replace(znak , " ")
        cast = riadok.split()



        cislo = 0
        cislo = str("".join(filter(str.isdigit, riadok)))
        if ("4" in cislo[0] and "2" in cislo[1] and "0" in cislo[2]): #len pre ceske telefonne cisla
            cislo = "+" + cislo
        else:
            cislo = "+420" + cislo


        if (cast[0] in jmena):
            data[cast[1] + "_" + cast[0]] = {}    #nadefinujem si slovnik do slovniku podla priezviska a mena Racak_Stefan - {}
            data[cast[1] + "_" + cast[0]]["celemeno"] = cast[0] + " " + cast[1] #priradil som k prizvisku nahoru cele meno
            data[cast[1] + "_" + cast[0]]["cislo"] = cislo


        else:
            data[cast[0] + "_" + cast[1]] = {}    #nadefinujem si slovnik do slovniku podla priezviska Racak - {}
            data[cast[0] + "_" + cast[1]]["celemeno"] = cast[1] + " " + cast[0] #priradil som k prizvisku nahoru cele meno
            data[cast[0] + "_" + cast[1]]["cislo"] = cislo

    subor.close()




with open ("data.txt" , "r") as subor:

    cast = []

    for riadok in subor:
        for znak in znaky:
            riadok = riadok.replace(znak , " ")
        cast = riadok.split()



        cislo = 0
        cislo = str("".join(filter(str.isdigit, riadok)))
        if ("4" in cislo[0] and "2" in cislo[1] and "0" in cislo[2]):
            cislo = "+" + cislo
        else:
            cislo = "+420" + cislo


        if (cast[0] in jmena):
            if (cislo != data[cast[1] + "_" + cast[0]]["cislo"] ):
                data[cast[1] + "_" + cast[0]]["cislo2"] = cislo



        else:
            if (cislo != data[cast[0] + "_" + cast[1]]["cislo"]):
                    data[cast[0] + "_" + cast[1]]["cislo2"] = cislo

    subor.close()

def zoradit(hodnota):
     return(hodnota)

zoradene = sorted(data, key = zoradit)


with open("telefonny_zoznam.txt", "w") as subor:
    for klic in zoradene:
        if ("cislo2" in data[klic]):
            subor.write("{:<30}".format(data[klic]["celemeno"]) + data[klic]["cislo"] + "\t" + data[klic]["cislo2"]  + "\n")

        else:
            subor.write("{:<30}".format(data[klic]["celemeno"]) + data[klic]["cislo"]  + "\n")

print("Koniec")

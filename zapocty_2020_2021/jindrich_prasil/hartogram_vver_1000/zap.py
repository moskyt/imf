import random

# Nastavení velikosti buňky a počátku kreslení
delka = 19
pocatek_x = 350
pocatek_y = 500
# Načtení dat z texťáku a jejich uložení do JSON
data = {}
max_pocet_prvku = 0    #maximální počet prvků na jednom řádku
with open("data.txt" , "r") as soubor:
    rozdeleny_radek = []
    sloupec = 0
    for radek in soubor:
        rozdeleny_radek = radek.split()
        if ("*" in rozdeleny_radek):
            rozdeleny_radek.remove("*")
        if (len(rozdeleny_radek) > max_pocet_prvku):
            max_pocet_prvku = len(rozdeleny_radek)
        sloupec += 1
        row = 1
        for j in range (0,len(rozdeleny_radek),1):
            data[row,sloupec] = {}
            data[row,sloupec]["nazev"] = rozdeleny_radek[j]
            row += 1
# Seznam všech názvů PS
nazvy = []
for index in data:
    if not (data[index]["nazev"])  in nazvy:
        nazvy.append(data[index]["nazev"])
# Načtení barev
with open ("barvy.txt" , "r") as soubor:
    barvy = []
    for radek in soubor:
        barvy.extend(radek.split())
# Náhodný výběr barev pro každý PS
predvybrane_barvy = []
for nazev in nazvy:
    predvybrane_barvy.append(barvy[random.randint(0, 49)])
# Vyřazení duplicitních barev a jejich doplnění novou unikátní barvou
vybrane_barvy = []
for barva in predvybrane_barvy:
    if barva not in vybrane_barvy:
        vybrane_barvy.append(barva)
k = 0
while (k < 6):
    k += 1
    if (len(nazvy) != len(vybrane_barvy)):
        cteni = True
        while cteni:
            barva = barvy[random.randint(0, 49)]
            if barva not in vybrane_barvy:
                vybrane_barvy.append(barva)
                break
# Přiřazení barvy k PS
for index in data:
    for i in range(0,len(nazvy),1):
        if (nazvy[i] == data[index]["nazev"]):
            data[index]["barva"] = vybrane_barvy[i]
# Definice hexagonu:
# ax,ay - souřadnice prvního bodu
# delka - délka strany
# text - popisek uvnitř buňky
# barva - barva výplně buňky
def bunka(ax,ay,delka,text,barva):
    bx = float(ax) + 2 * float(delka) * 0.866025404
    by = float(ay) + float(delka)
    cx = float(ax) + 4 * float(delka) * 0.866025404
    dy = float(ay) - 2* float(delka)
    ey =  float(ay) - 3 * float(delka)
    stred_x = (ax + cx)/2
    stred_y = ay - int(delka)
    retezec = ""
    retezec += "<polygon fill=\"" + barva +  "\" points = \" " + str(ax) + "," + str(ay) + " " + str(bx) + "," + str(by) + " " + str(cx) + "," + str(ay) + " " + str(cx) + "," + str(dy)+ " " + str(bx) + "," + str(ey) + " " +str(ax) + "," + str(dy)+ "\" />"
    retezec += "\n <text x=\"" + str(stred_x) + "\" y=\""+ str(stred_y) + "\"  text-anchor=\"middle\"  fill=\"black\" font-size=\"20\">" +  str(text) + " </text>"
    return retezec
# Vykreslení levé dolní šestiny
# k - počet řádků
# ax,ay - souřadnice
# delka - delka strany
#symetrie - zadat "True" a bude vykreslovat pravou horní šestinu
def zapis_radku_vlevo(k,ax,ay,delka,symetrie ="None"):
    for (i,j) in data:
        if (j == k):
            barva = data[i,j]["barva"]
            text = data[i,j]["nazev"]
            # text = str(i) + str(j)
            if (i,j) != (1,1):
                soubor.write(bunka(ax,ay,delka,text,barva) + "\n")
            if (symetrie == "True"):
                ax -= delka *4*0.866025404
            else:
                ax += delka *4*0.866025404
# Vykreslení střední dolní šestiny
# k - počet řádků
# ax,ay - souřadnice
# delka - delka strany
#symetrie - zadat "True" a bude vykreslovat střední horní šestinu
def zapis_stredu(k,ax,ay,delka,symetrie = "None"):
    for (i,j) in data:
        if (i == k):
            barva = data[i,j]["barva"]
            text = data[i,j]["nazev"]
            if (i,j) != (1,1):
                soubor.write(bunka(ax,ay,delka,text,barva)+ "\n")
            if (symetrie == "True"):
                ax -= delka *4*0.866025404
            else:
                ax += delka *4*0.866025404
# Vykreslení pravé dolní šestiny
# k - počet řádků
# ax,ay - souřadnice
# delka - delka strany
#symetrie - zadat "True" a bude vykreslovat levou horní šestinu
def zapis_radku_vpravo(k,ax,ay,delka,symetrie = "None"):
    for (i,j) in data:
        if (j == k):
            barva = data[i,j]["barva"]
            text = data[i,j]["nazev"]
            if (i,j) != (1,1):
                soubor.write(bunka(ax,ay,delka,text,barva) + "\n")
            if (symetrie == "True"):
                ay += 3 * delka
                ax += delka * 2 * 0.866025404
            else:
                ay -= 3 * delka
                ax -= delka * 2 * 0.866025404
# Tvorba svg souboru
barva = ""
text = ""
with open ("AZ.svg" , "w") as soubor:
    soubor.write("<svg width=\"2600\" height=\"2100\" xmlns=\"http://www.w3.org/2000/svg\" viewBox = \"0 0 2600 2100\"> \n" )
# zápis levé dolní šestiny
    ax = pocatek_x
    ay = pocatek_y
    k = 0
    while (k < max_pocet_prvku):
        k += 1
        zapis_radku_vlevo(k,ax,ay,delka)
        ay += 3 * delka
        ax = pocatek_x + k * delka *2*0.866025404
# zápis dolního středu
    ay = pocatek_y + 3 * delka
    ax += 5 * delka * 2 * 0.866025404
    while (k > 1):
        k -= 1
        zapis_stredu(k,ax,ay,delka)
        ay += 3 * delka
        ax -= 2 * delka * 0.866025404
# zápis pravé dolní šestiny
    ay -= 3 * delka
    ax += 26 * delka
    while (k < max_pocet_prvku):
        zapis_radku_vpravo(k,ax,ay,delka)
        ax += delka *2 * 0.866025404
        ay -= 3 * delka
        k +=1
# zápis pravé horní šestiny
    k = 0
    while (k <  max_pocet_prvku):
        k += 1
        zapis_radku_vlevo(k,ax,ay,delka,"True")
        ay -= 3 * delka
        ax -= 2 * delka * 0.866025404
# zápis horního středu
    k = 0
    ay += 3 * delka
    ax += delka * 2 * 0.866025404
    while (k < max_pocet_prvku):
        k += 1
        zapis_stredu(k,ax,ay,delka,"True")
        ay += 3 * delka
        ax -= delka * 2 * 0.866025404
# zápis levé horní šestiny
    k = 0
    ax -= 6 * delka * 2 * 0.866025404
    ay -= 24 * delka
    while (k < max_pocet_prvku):
        k += 1
        zapis_radku_vpravo(k,ax,ay,delka,"True")
        ax -= delka * 2 * 0.866025404
        ay += 3 * delka

    soubor.write("</svg>")
    soubor.close()
print("HOTOVO! \n Výstupní soubor se jmenuje AZ.svg")

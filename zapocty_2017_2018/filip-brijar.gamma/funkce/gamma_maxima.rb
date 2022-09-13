=begin
Funkce hledá pět palivových souborů s největší celkovou aktivitou. Výsledkem je pole pěti ID palivových souborů (proměnná "maxima").
=end
def najdi_maxima(data)
	if (data.keys.length>5)
		
		maxima = data.map{|m,n| n["ID"]}
		maxima.sort_by!{|n| data[n]["celek"]}
		maxima = [maxima[maxima.length-5],maxima[maxima.length-4],maxima[maxima.length-3],maxima[maxima.length-2],maxima[maxima.length-1]]
		return maxima
	else
		puts ("\nCHYBA (najdi_maxima): Při hledání 5ti maximálních hodnot došlo k chybě. Zadaný hash obsahuje méně jak 5 prvků.")
		return nil
	end
end
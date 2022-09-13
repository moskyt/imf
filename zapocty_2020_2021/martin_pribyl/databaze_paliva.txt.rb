\documentclass[a4paper,twoside,11pt]{article}

\usepackage[utf8]{inputenc}
\usepackage[OT1]{fontenc}
\usepackage[czech]{babel}
\usepackage{graphicx}
\usepackage[margin=2cm]{geometry}

\begin{document}

\title{Palivový soubor <%= soubor["Nazev"] %>}
\author{Martin Přibyl}
\date{2020/2021}
\maketitle

<% posledni_vyvezeni = 0 %>
<% (1..pocet_kampani).each do |i| %>
	<% if soubor.include?("Cislo kampane #{i}") %>
		<% posledni_vyvezeni = soubor["Konec kampane #{i}"]%>
	<% else %>
		<% next %>
	<% end %>
<% end %>

<% cislo_predchozi_kampan = 0 %>
<% max_doba_mimo_AZ = 0 %>
<% konec_predchozi = 0 %>
<% zacatek_nove = 0 %>
<% (1..pocet_kampani).each do |i| %>
	<% if soubor.include?("Cislo kampane #{i}") %>
		<% if cislo_predchozi_kampan == 0%>
			<% konec_predchozi = DateTime.parse(soubor["Konec kampane #{i}"]) %>
		<% else %>
			<% zacatek_nove = DateTime.parse(soubor["Zacatek kampane #{i}"]) %>
			<% if max_doba_mimo_AZ < (zacatek_nove - konec_predchozi).to_i %>
				<% max_doba_mimo_AZ = (zacatek_nove - konec_predchozi).to_i %>
			<% else %>
			<% end %>
			<% konec_predchozi = DateTime.parse(soubor["Konec kampane #{i}"]) %>
		<% end %>
		<% cislo_predchozi_kampan = i %>
	<% else %>
		<% next %>
	<% end %>
<% end %>

\section{Obecné informace}

\begin{tabular}{ll}
Identifikátor PS: & <%= soubor["Nazev"] %> \\
Celkové vyhoření: & <%= "%.1f" % soubor["Celkove vyhoreni"] %> \\
Datum prvního zavezení PS: & <%= soubor["Prvni zavezeni"] %> \\
Datum posledního vyvezení PS: & <%= posledni_vyvezeni %> \\
Nejdelší doba mimo AZ (dny): & <%= max_doba_mimo_AZ %> \\
\end {tabular}

<% (1..pocet_kampani).each do |i| %>
	<% if soubor.include?("Cislo kampane #{i}") %>	

\subsection{Kampaň <%= soubor["Cislo kampane #{i}"] %>}
\begin{itemize}
\item Vyhoření: <%= "%.1f" % soubor["Vyhoreni #{i}"] %>
\item Datum zavezení PS: <%= soubor["Zacatek kampane #{i}"] %>
\item Datum vyvezení PS: <%= soubor["Konec kampane #{i}"] %>

\end{itemize}
	<% else %>
		<% next %>
	<% end %>
<% end %>

\section{Graf}
\begin{tabular}{|c|c|c|c|c|}
\hline
Číslo kampaně  & Začátek kampaně  & Konec kampaně  & Vyhoření na začátku & Vyhoření na konci \\

<% vyhoreni_zacatek = 0.0 %>
<% vyhoreni_konec = 0.0 %>
<% (1..pocet_kampani).each do |i| %>
	<% if soubor.include?("Cislo kampane #{i}") %>
	<% vyhoreni_konec = vyhoreni_konec + soubor["Vyhoreni #{i}"].to_f%>
	
\hline
<%= soubor["Cislo kampane #{i}"] %> & <%= soubor["Zacatek kampane #{i}"] %> & <%= soubor["Konec kampane #{i}"] %> & <%= "%.1f" % vyhoreni_zacatek %> & <%= "%.1f" % vyhoreni_konec %> \\
	
	<% vyhoreni_zacatek = vyhoreni_zacatek + soubor["Vyhoreni #{i}"].to_f%>
	<% else %>
		<% next %>
	<% end %>
<% end %>

\hline
\end{tabular}

\end{document}
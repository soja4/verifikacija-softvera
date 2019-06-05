Rad se sastoji iz 2 podprojekta:
1. Parser klee generisanih fajlova (parser.html)
2. Vizualizator podataka dobijenih od parsera (stablo.ipynb)

Pokretanjem programa parser.html, otvara se aplikacija i prva akcija je izbor simbolickog C source koda.
Zatim se bira odgovarajuci run.istats file i pokrece se parsiranje. 
Dobija se lista povezanih uslova iz source kod-a, a zatim je potrebno izabrati sym.path fajlove generisane od strane klee alata.
Nakon izbora zeljenjih sym.path fajlova, kreira se izlazni fajl klee.output.txt koji sadrzi listu putanji kroz program i uslova koji vaze na toj putanji.

Fajl klee.output.txt je ulazni fajl za vizualizator, cijim se pokretanjem u jupyter notebook alatu iscrtava stablo simbolickog izvrsavanja. 

Svi fajlovi neophodni za test nalaze se u inputs folderu.

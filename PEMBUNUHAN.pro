domains
nama,kelamin,pekerjaan,benda,alasan= symbol
umur = integer

predicates
nondeterm 
orang(nama,umur,kelamin,pekerjaan)
istri(nama, nama)
terbunuh_dengan(nama,benda)
terbunuh(nama)
nondeterm 
pembunuh(nama)
motif(alasan)
milik(nama,benda)
nondeterm
cara_kerja_dengan(benda,benda)
nondeterm
kemungkinan_pemilik(nama,benda)
nondeterm 
dicurigai(nama)


clauses
orang(roland,20,pria,programmer).
orang(adzmar,20,pria,akuntan).
orang(iqbal,21,pria,fotografer).
orang(wahid,21,pria,koki).

istri(rada,adzmar).

terbunuh_dengan(rada,ditikam).
terbunuh(rada).

motif(harta).

milik(roland,pistol).
milik(wahid,pisau).



cara_kerja_dengan(pisau,ditikam).

kemungkinan_pemilik(X,Benda):-
	milik(X,Benda).


dicurigai(X):-
	terbunuh_dengan(rada,Benda),
	cara_kerja_dengan(Benda,Benda),
	kemungkinan_pemilik(X,Benda).
	
dicurigai(X):-
	motif(harta),
	orang(X,_,_,koki).
	
pembunuh(Pembunuh):-
	orang(Pembunuh,_,_,_),
	dicurigai(Pembunuh).
Goal
pembunuh(X). 


domains									%menurut saya domains ini sama-sama mendeklerasikan variable seperti predikat bedanya domains ada parameternya
  name,sex,occupation,object,vice,substance = symbol			%baris pertama ini mendeklerasikan beberapa variable yg tersebutkan menggunakan tipe data symbol 	
  age=integer								%variable age menggunakan tipe data integer

predicates								%predicates digunakan untuk mendklarasikan predikat/penghubung									
									%disini saya menggunakan nondeterm semua karena sudah terbiasa dan juga nondterm ini mebuat saya tidak harus lagi mendkelerasikan lagi method/relasi yang ada apakah dia output/input 
  nondeterm
  person(name,age,sex,occupation)					%penghubung dari person yaitu name,age, sex dan occupation
  nondeterm
  had_affair(name,name) 						%penghubung dari had_affair yaitu name dan name
  nondeterm
  killed_with(name,object)						%penghubung dari killed_with yaitu name dengan object
  nondeterm
  killed(name)								%penghubung dari killed yaitu name
  nondeterm 
  killer(name)								%penghubung killer yaitu name
  nondeterm 
  motive(vice)								%penghubung dari motive yaitu vice
  nondeterm 
  smeared_in(name,substance)						%penghubung dari smeared_in adalah name dan subtance
  nondeterm
  owns(name,object)							%penghubung owns yakni name dan object
  nondeterm
  operates_identically(object,object)					%penghubung operates_identically adalah object dan object
  nondeterm
  owns_probably(name,object)						%penghubung owns_probably yakni name dan object
  nondeterm
  suspect(name)								%penghubung suspect yakni name

/* * * Facts about the murder * * */
clauses									%clause merupakan suatu keyword/perintah yang digunakan untuk mendeklarasikan aturan/fakta (berisi ttg aturan/fakta)
  person(bert,55,m,carpenter).						%bert seorang carpenter atau tukang kayu berumur 55th berjender m(male/laki2)
  person(allan,25,m,football_player).					%allan seorang football_player/pemain sepak bola yang berumur 25th dan berjender male
  person(allan,25,m,butcher).						%allan seorang butcher/tukang daging berumur 25th dan berjender male/laki-laki
  person(john,25,m,pickpocket).						%john seorang pickpocket/pencopet berumur 25th berjender male/laki-laki

  had_affair(barbara,john).						%barbara had_affair with john/barbara berselingkuh dengan john
  had_affair(barbara,bert).						%barbara had_affair with bert/barbara selingkuh dengan bert
  had_affair(susan,john).						%susan had_affair with john/susan selingkuh dengan john

  killed_with(susan,club).						%susan killed_with club /susan terbunuh oleh pentungan
  killed(susan).							%susan terbunuh

  motive(money).							%motive pembunuhan yakni money/uang
  motive(jealousy).							%motive pembunuhan yakni jealousy/cemburu
  motive(righteousness).						%motive pembunuhan yakni rightheousness

  smeared_in(bert,blood).						%bert smeared_in/ternodai oleh blood/darah
  smeared_in(susan,blood).						%susan smeared_in/ternodai oleh blood/darah
  smeared_in(allan,mud). 						%allan smeared_in/ternodai oleh mud/lumpur
  smeared_in(john,chocolate).						%john smeared_in/ternodai oleh chocolate/coklat
  smeared_in(barbara,chocolate).					%barbara smeared_in/ternodai oleh chocolate/coklat

  owns(bert,wooden_leg).						%bert owns/punya/milik kaki palsu
  owns(john,pistol).							%john owns/punya/milik pistol

/* * * Background knowledge * * */

  operates_identically(wooden_leg, club).				%cara kerja wooden_leg mirip club
  operates_identically(bar, club).					%artikan sendiri ya kak ,intinya pemikiran sama
  operates_identically(pair_of_scissors, knife).			%up bukan malas tapi saya ngejar waktu hehe
  operates_identically(football_boot, club).				%up

  owns_probably(X,football_boot):- 					%kemungkinan sepatu bola milik X jika maka 
	person(X,_,_,football_player).					%X dan orang lainnya pemain sepakbola
  owns_probably(X,pair_of_scissors):-					%kemungkinan gunting milik X jika maka
	person(X,_,_,hairdresser).					%X dan orang lainnya adalah pekerja salon
  owns_probably(X,Object):- 						%kemungkinan benda milik X jika maka
	owns(X,Object).							%X memiliki benda itu

/* * * * * * * * * * * * * * * * * * * * * * *
 * Suspect all those who own a weapon with   *
 * which Susan could have been killed.       *
 * * * * * * * * * * * * * * * * * * * * * * */

  suspect(X):-								%X dicurigai jika maka
	killed_with(susan,Weapon) ,					%susan terbunuh dengan senjata dan
	operates_identically(Object,Weapon) ,				%benda/object cara kerjanya mirip weapon/senjata dan
	owns_probably(X,Object).					%x mungkin memiliki object

/* * * * * * * * * * * * * * * * * * * * * * * * * *
 * Suspect men who have had an affair with Susan.  *
 * * * * * * * * * * * * * * * * * * * * * * * * * */

  suspect(X):-								%X dicurigai jika maka
	motive(jealousy),						%cemburu adalah motifnya dan
	person(X,_,m,_),						%X adalah orang tersebut yang berjender m dan
	had_affair(susan,X).						%susan selingkuh dengan X

/* * * * * * * * * * * * * * * * * * * * *
 * Suspect females who have had an       *
 * affair with someone that Susan knew.  *
 * * * * * * * * * * * * * * * * * * * * */

  suspect(X):-								%X dicurigai jika maka
	motive(jealousy),						%cemburu adalah motifnya dan
	person(X,_,f,_),						%X adalah orang tersebut yang berjender f dan
	had_affair(X,Man),						%Laki - laki tersebut selingkuh dengan X dan
	had_affair(susan,Man).						%Susan selingkuh dengan laki-laki

/* * * * * * * * * * * * * * * * * * * * * * * * * * *
 * Suspect pickpockets whose motive could be money.  *
 * * * * * * * * * * * * * * * * * * * * * * * * * * */

  suspect(X):- 								%X dicurigai jika maka
	motive(money),							%motifnya adalah uang dan 
	person(X,_,_,pickpocket).					%X adalah seorang pencopet

  killer(Killer):-							%pembunuh tersebut dikatakan pembunuh jika maka
	person(Killer,_,_,_),						%orang tersebut adalah pembunuh dan orang lainnya dan
	killed(Killed),							%jika orang tersebut terbunuh dan
	Killed <> Killer, /* It is not a suicide */			/* Bukan bunuh diri */  %relasi dari terbunuh adalah pembunuh dan
	suspect(Killer),						%pembunuh tersebut dicurigai dan 
	smeared_in(Killer,Zat), 					%pembunuh ternodai oleh zat dan
	smeared_in(Killed,Zat).						%yang terbunuh ternodai oleh zat

goal									%Goal adalah jawaban yang berisi pernyataan dan pertanyaan
  killer(X).								%Jawaban dari pembunuh tersebut adalah bert
  									%karena pembunuh yang ternodai zat adalah bert. 
  									%Yang terdapat di rule ada dua yaitu susan dan bert yang ternodai dengan zat yaitu darah
 									%karena di goal yang ditanyakan adalah pembunuh maka jawabannya bert
 									%sebab susan adalah orang yang terbunuh  

  		

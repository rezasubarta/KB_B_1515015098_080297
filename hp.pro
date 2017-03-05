DOMAINS
merk,warna= symbol %Mendeklarasikan struktur data yang tidak didefinisikan oleh standar domain dimana merk, dan warna merupakan symbol.
harga= integer %Harga merupakan variabel dan bertipe data Integer.
PREDICATES %berfungsi untuk memberikan gambaran dari fakta-fakta yang ada difungsi CLAUSES.
nondeterm %nondeterm pada predicates berfungsi untuk memberi tahu compiler bahwa predikat tersebut dapat mempunyai lebih dari satu kemungkinan jawaban.
hp(merk,warna,harga)% perintah ini seperti method berisi parameter dalam pemrograman java netbeans
CLAUSES %Merupakan fungsi untuk memberikan gambaran pada visual prolog dalam melakukan pengujian untuk mencari solusi dari pertanyaan yang diberikan. 
hp(iphone,putih,500000).%bagian isi dari fungsi calusa/clause yang isi parameternya sesuai dengan yang kita inginkan 
hp(samsung,merah,400000). %fungsi .(titik) ini seperti  fungsi ; pada java netbeans untuk mengakhiri perintah
hp(lenovo,biru,550000).%sama seperti penjelasan line clause pertama
hp(oppo,merah,300000). %sama seperti penjelasan line clause pertama
hp(nokia,biru,800000). %sama seperti penjelasan line clause pertama
hp(xiaomi,putih,300000). %sama seperti penjelasan line clause pertama

goal %merupakan suatu fungsi sebagai perintah tujuan utama program ini sesuai dengan domain ,predicates dan clause yang telah kita tentukan
hp(Merk,Warna,Harga),Harga<=500000. %kata yang berawal huruf kapital tandanya ia merupakan variable ,pada line ini berguna untuk menampilkan/menyatakan merk,warna dan harga hp
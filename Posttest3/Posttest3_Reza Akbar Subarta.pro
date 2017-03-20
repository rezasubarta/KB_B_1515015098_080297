domains
%b = beasiswa, p = penerima, i = ipk

nb,m=symbol
n=integer
predicates
nondeterm a(m,n)
nondeterm player(nb,m,m,m,m,m)
nondeterm players(nb,m,m,m,m,m,m,m,m,m)
nondeterm main(m,m,m,m,m,n,n,n,n,n)
nondeterm mvp(m)

clauses
player(nba, lebron, curry, irving , durant, westbrook).
players(nba, harden, curry, irving , durant, westbrook, lebron, davis, damian, thomas).
main(lebron, curry, irving, durant, westbrook, 45,30,38,32,48).
main(lebron, curry, irving, durant, westbrook, 36,20,34,30,31).
main(lebron, curry, irving, durant, westbrook, 37,28,29,32,52).
a(M,N):-main(M,_,_,_,_,N,_,_,_,_);main(_,M,_,_,_,_,N,_,_,_);
main(_,_,M,_,_,_,_,N,_,_);main(_,_,_,M,_,_,_,_,N,_);main(_,_,_,_,M,_,_,_,_,N).
mvp(M):-a(M,N),N=52.

goal
nl,write("Liga:"),nl,player(Tingkat,_,_,_,_,_);
nl,write("Nominasi Pemain NBA:"),nl,players(nba,PLayer1,Player2,Player3,Player4,Player5, Player6, Player7, Player8, Player9);
nl,write("Nominasi MVP:"),nl,player(nba,Player1,Player2,Player3,Player4,Player5);
nl,write("Most Valueable Player:"),nl,mvp(MVP).
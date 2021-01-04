create database bibliotheque
on primary(
name=bibliotheque_data,
filename='C:\Users\bouti\OneDrive\سطح المكتب\Base De donne\Tp\Tp1\Biblio\bibliotheque.mdf',
size=10Mb
)
log on(
name=bibliotheque_log,
filename='C:\Users\bouti\OneDrive\سطح المكتب\Base De donne\Tp\Tp1\Biblio\bibliotheque.ldf',
size=10Mb
)
use bibliotheque
create table ouvrage(
titre_ovr varchar(50) primary key,
nb_exp int ,
auteur varchar(10),
an_edt int,
seuil int
)
create table livre(
num_inv varchar(5),
date_acq Date,
titre_ovr varchar(50) ,
constraint fk_livre_ouvrage foreign key(titre_ovr) references ouvrage(titre_ovr)
)
create table fournisseur(
codeF varchar(5) primary key,
nomF varchar(20),
telF varchar(15),
adF varchar(50)
)

create table facteurAchat(
n_fa_achat int primary key,
date_ach Date,
codeF varchar(5) ,
constraint fk_facteurAchat_fournisseur foreign key(codeF) references fournisseur(codeF)
)
create table ligneAchat(
titre_ovr varchar(50),
n_fa_achat int,
nb_ovr_ach int,
prix_u_ach int,
constraint fk_ligneAchat_ouvrage_titre_ovr foreign key(titre_ovr) references ouvrage(titre_ovr),
constraint fk_ligneAchat_ouvrage_n_fa foreign key(n_fa_achat) references facteurAchat(n_fa_achat)
)
create table facteurVent(
n_fa_ven int primary key,
date_ven Date,
nom_client varchar(15),
)
create table ligneVente(
n_fa_ven int,
titre_ovr varchar(50),
nb_ovr_ven int,
prix_u_ven int
constraint fk_ligneVente_ouvrage_tit_ovr foreign key(titre_ovr) references ouvrage(titre_ovr),
constraint fk_lignevente_facteurVent_num_fa foreign key(n_fa_ven) references facteurVent(n_fa_ven)
)
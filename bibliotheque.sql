create database bibliotheque
use bibliotheque
create table ouvrage(
tit_ovr varchar(50) primary key,
nb_exp int ,
aut varchar(10),
an_Edit int,
)
create table livre(
num_inv varchar(5),
date_acq Date,
tit_ovr varchar(50) ,
constraint fk_livre_ouvrage foreign key(tit_ovr) references ouvrage(tit_ovr)
)
create table fournisseur(
cod_fo varchar(5) primary key,
tel_fo varchar(15),
ad_fo varchar(50)
)
create table facteurAchat(
num_fa_achat int primary key,
cod_fo varchar(5) ,
constraint fk_facteurAchat_fournisseur foreign key(cod_fo) references fournisseur(cod_fo)
)
create table ligneAchat(
tit_ovr varchar(50),
num_fa_achat int,
nb_ovr_ach int,
prix_u_ach int,
date_ach Date,
constraint fk_ligneAchat_ouvrage_tit_ovr foreign key(tit_ovr) references ouvrage(tit_ovr),
constraint fk_ligneAchat_ouvrage_num_fa foreign key(num_fa_achat) references facteurAchat(num_fa_achat)
)
create table facteurVent(
num_fa_ven int primary key,
nom_clt varchar(15),
)
create table ligneVente(
num_fa_ven int,
tit_ovr varchar(50),
date_ven Date,
nb_ovr_ven int,
prix_u_ven int
constraint fk_ligneVente_ouvrage_tit_ovr foreign key(tit_ovr) references ouvrage(tit_ovr),
constraint fk_lignevente_facteurVent_num_fa foreign key(num_fa_ven) references facteurVent(num_fa_ven)
)
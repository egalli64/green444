use green;

-- cleanup
drop table if exists categorie;
drop table if exists ordini;
drop table if exists utenti;
drop table if exists immagini;
drop table if exists ordini_prodotti;
drop table if exists prodotti;


create table categorie(
categoria_id integer primary key auto_increment,
nome varchar (30));

insert into categorie (nome) values ('pantaloni'), ('maglie'), ('scarpe');
commit;

create table utenti(
utente_id integer primary key auto_increment,
nome varchar(20),
cognome varchar(25) not null,
email varchar(30) unique not null,
numero_cellulare varchar(20),
indirizzo varchar(40));

insert into utenti (nome, cognome, email, numero_cellulare, indirizzo) values ('Asia', 'Perazza','asiaperazza@gmail.com', '3899995299','via agnosine');
insert into utenti (nome, cognome, email, numero_cellulare, indirizzo) values ('Clara','Corvasce', 'clara.corvasce23@gmail.com', '3282221505', 'via andria');
insert into utenti (nome, cognome, email, numero_cellulare, indirizzo) values ('Anna', 'Adamo', 'annaadamo_@libero.it', '3319710707', 'via primo maggio');
insert into utenti (nome, cognome, email, numero_cellulare, indirizzo) values ('Melania', 'Aceto', 'melaniaaceto@gmail.com', '3209634904', 'corso umberto I');
insert into utenti (nome, cognome, email, numero_cellulare, indirizzo) values ('Laura', 'Di Bernardo', 'db.laura@hotmail.it', '3920175834', 'via laura');
insert into utenti (nome, cognome, email, numero_cellulare, indirizzo) values ('Mara', 'Tammaro', 'tammaromara@gmail.com', '3388082538', 'viale margherita');
insert into utenti (nome, cognome, email, numero_cellulare, indirizzo) values ('Miriam', 'Greco', 'miriam.greco8@gmail.com', '3461334241', 'via miriam');

commit;



create table ordini(
ordine_id integer primary key,
utente_id integer, 
foreign key(utente_id) references utenti(utente_id),
data date not null);


create table prodotti(
prodotto_id integer primary key,
categoria_id integer,
foreign key(categoria_id) references categorie(categoria_id),
prezzo decimal,
nome varchar(20));


create table ordini_prodotti(
prodotto_id integer primary key,
ordine_id integer,
quantità integer,
foreign key(prodotto_id) references prodotti(prodotto_id));


create table immagini(
immagine_id integer primary key,
prodotto_id integer,
nome varchar(20));



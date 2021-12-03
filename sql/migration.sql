use green;

-- cleanup
drop table if exists ordini_prodotti;
drop table if exists prodotti;
drop table if exists categorie;
drop table if exists ordini;
drop table if exists utenti;
drop table if exists immagini;




create table categorie(
categoria_id integer primary key auto_increment,
nome varchar (30));

insert into categorie(nome) values ('pantaloni'), ('maglie'), ('scarpe');
commit;

create table utenti(
utente_id integer primary key auto_increment,
nome varchar(20),
cognome varchar(25) not null,
email varchar(30) unique not null,
numero_cellulare varchar(20),
indirizzo varchar(40),
username varchar(30),
password varchar(30));

insert into utenti (nome, cognome, email, numero_cellulare, indirizzo, username, password) values ('Asia', 'Perazza','asiaperazza@gmail.com', '3899995299','via agnosine','asia','password');
insert into utenti (nome, cognome, email, numero_cellulare, indirizzo, username, password) values ('Clara','Corvasce', 'clara.corvasce23@gmail.com', '3282221505', 'via andria','clara','password');
insert into utenti (nome, cognome, email, numero_cellulare, indirizzo, username, password) values ('Anna', 'Adamo', 'annaadamo_@libero.it', '3319710707', 'via primo maggio','anna','password');
insert into utenti (nome, cognome, email, numero_cellulare, indirizzo, username, password) values ('Melania', 'Aceto', 'melaniaaceto@gmail.com', '3209634904', 'corso umberto I','melania','password');
insert into utenti (nome, cognome, email, numero_cellulare, indirizzo, username, password) values ('Laura', 'Di Bernardo', 'db.laura@hotmail.it', '3920175834', 'via laura','laura','password');
insert into utenti (nome, cognome, email, numero_cellulare, indirizzo, username, password) values ('Mara', 'Tammaro', 'tammaromara@gmail.com', '3388082538', 'viale margherita','mara','password');
insert into utenti (nome, cognome, email, numero_cellulare, indirizzo, username, password) values ('Miriam', 'Greco', 'miriam.greco8@gmail.com', '3461334241', 'via miriam','miriam','password');

commit;



create table ordini(
ordine_id integer primary key auto_increment,
utente_id integer, 
foreign key(utente_id) references utenti(utente_id),
data date not null);

insert into ordini (utente_id, data) values ('1', '2021-11-01');
insert into ordini (utente_id, data) values ('2', '2021-11-05');
insert into ordini (utente_id, data) values ('3', '2021-11-12');
insert into ordini (utente_id, data) values ('4', '2021-11-17');
insert into ordini (utente_id, data) values ('5', '2021-11-22');
insert into ordini (utente_id, data) values ('6', '2021-11-24');
insert into ordini (utente_id, data) values ('7', '2021-11-28');

commit;


create table prodotti(
prodotto_id integer primary key auto_increment,
categoria_id integer,
foreign key(categoria_id) references categorie(categoria_id),
prezzo decimal (2,0),
nome varchar(30));

insert into prodotti (categoria_id, prezzo, nome) values (1, '25', 'pantalone bianco e verde'); 
insert into prodotti (categoria_id, prezzo, nome) values (2, '15', 'maglione con ricami'); 
insert into prodotti (categoria_id, prezzo, nome) values (3, '30', 'stivali alti con tacco');
insert into prodotti (categoria_id, prezzo, nome) values ('3', '13', 'sandali rosa');
insert into prodotti (categoria_id, prezzo, nome) values ('3', '30', 'sneakers bianche');
insert into prodotti (categoria_id, prezzo, nome) values ('1', '30', 'pantalone marrone');
insert into prodotti (categoria_id, prezzo, nome) values ('1', '16', 'jeans bianco');
insert into prodotti (categoria_id, prezzo, nome) values ('2', '20', 't-shirt viola');
insert into prodotti (categoria_id, prezzo, nome) values ('2', '18', 'cardigan blu');

commit;


create table ordini_prodotti(
prodotto_id integer,
ordine_id integer,
quantità integer,
foreign key(prodotto_id) references prodotti(prodotto_id));

insert into ordini_prodotti (ordine_id, prodotto_id, quantità) values (1, 1, 20);
insert into ordini_prodotti (ordine_id, prodotto_id, quantità) values (2, 2, 30);
insert into ordini_prodotti (ordine_id, prodotto_id, quantità) values (3, 3, 30);

commit;


create table immagini(
immagine_id integer primary key auto_increment,
prodotto_id integer,
nome varchar(20));



-- insert into immagini (prodotto_id, nome) values (

 




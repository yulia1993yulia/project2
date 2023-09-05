DROP database Парикмахерская;
create database if not exists Парикмахерская;
use Парикмахерская;

create table if not exists Владельцы_салонов 
(
id int primary key auto_increment,
Имя varchar(50),
Фамилия varchar(200),
Номер_телефона int
);

create table if not exists Мастера
(
id int primary key auto_increment,
Имя varchar(30),
Фамилия varchar(30),
Стаж int,
Номер_телефона varchar(30)
);

create table if not exists Салоны
(
id int primary key auto_increment,
Название varchar(30),
Рейтинг varchar(300),
Адрес varchar(300),
Часы_работы DATETIME
);

create table if not exists Клиенты
(
id int primary key auto_increment,
Имя varchar(50),
Фамилия varchar(200),
Возраст int
);

create table if not exists Оборудование
(
id int primary key auto_increment,
Название varchar(30),
Master_id int,
Salon_id int,
foreign key (Salon_id) references Салоны (id),
foreign key (Master_id) references Мастера (id)
);

create table if not exists Сеансы
(
id int primary key auto_increment,
Название varchar(30),
Продолжительность varchar(30),
Стоимость varchar(30),
Oborudovanie_id int,
Klient_id int,
foreign key (Klient_id) references Клиенты(id),
foreign key (Oborudovanie_id) references Оборудование(id)
);

create table if not exists Отзывы_о_сеансах
(
Содержание varchar(30),
Seans_id int,
Klient_id int,
primary key(Seans_id, Klient_id),
foreign key (Seans_id) references Сеансы(id),
foreign key (Klient_id) references Клиенты(id)
);

create table if not exists Записи
(
id int primary key auto_increment,
Название_услуги varchar(50),
Время varchar(200),
Klient_id int, 
Master_id int,
foreign key (Master_id) references Мастера(id),
foreign key (Klient_id) references Клиенты(id)
);

create table if not exists Салоны_Владельцы
(Vladelec_id int,
Salon_id int,
primary key(Vladelec_id, Salon_id),
foreign key (Vladelec_id) references Владельцы_салонов(id),
foreign key (Salon_id) references Салоны(id)
);

create table if not exists Салоны_Мастера
(
Master_id int,
Salon_id int,
primary key(Master_id, Salon_id),
foreign key (Master_id) references Мастера(id),
foreign key (Salon_id) references Салоны(id)
);

create table if not exists Салоны_Клиенты
(
Klient_id int,
Salon_id int,
primary key(Klient_id, Salon_id),
foreign key (Klient_id) references Клиенты(id),
foreign key (Salon_id) references Салоны(id)
);

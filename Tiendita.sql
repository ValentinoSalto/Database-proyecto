Create database Compu;   /*✔*/
use Compu  /*✔*/
create table Cliente(       /*✔*/
id_cliente  int  primary key,
Nombre_cliente  varchar(30)  not null,
Apellido varchar(30) not null,
DNI  int not null unique,
mail  varchar(30)  not null unique,
met_pago  varchar(30)  not null,
telefono  int,
direccion_env  varchar(30)  not null 
);   

create table Computadora(   /*✔*/
id_compu int  primary key,
tipo varchar(30) not null,
f_creacion date
);


create table Compra(    /*✔*/
Importe  float not null,
id_cliente int not null unique,
id_compu int not null unique,
constraint fk_id_cliente foreign key (id_cliente) references Cliente(id_cliente),
constraint fk_id_compu foreign key(id_compu) references Computadora(id_compu)
);



create table Componente(  /*✔*/
Modelo  varchar(30) primary key,
Tipo_comp varchar(30) not null,
Marca varchar(30),
Cantidad INT not null,
id_Compu INT not null,
constraint fk_id_compu2 foreign key(id_compu) references Computadora(id_compu)
);

/*Inserts 10 tuplas*/

INSERT INTO Cliente(id_cliente, nombre_cliente, apellido, DNI, mail, met_pago, telefono, direccion_env) VALUES      /*✔*/
(1, 'Juancito', 'Rodriguez', 46234122, 'xxjuancito-gamerxx@gmail.com', 'efectivo', '1157754219', 'Estevan echeverria 5858'),
(2,'Pedro', 'Ramirez', 24567430, 'pedrorami@gmail.com', 'debito', '1132456781', 'Cuenca 2880'),
(3,'Javier', 'Calamoto', 23456897, 'JaviFacherito@gmial.com', 'efectivo', '157474635', 'Santo Tome 654'),
(4,'Cinthia', 'Fernandez', 34567193, 'CinthiFern@gmail.com', 'debito', '1163489535', 'Avenida Libertador 1420'),
(5,'Malena', 'Tola', 46324789, 'Matola@gmail.com', 'debito', '118484362', 'Emilio Lamarca 465'),
(6,'Carolina', 'Matiz', 43576925, 'Cmatiz@gmail.com','1163478598', 'efectivo', 'Bahia 324'),
(7,'Estocolmo', 'Luxo', 36758946, 'Estocolmo666@gmail.com','1153467590', 'debito','Jonte 968'),
(8,'Maria','Vidal', 23456746,'MariaVidal@gmail.com','1123456798', 'efectivo', 'Av Nazca 2345'),
(9,'Matias','Mator', 45867093,'MatiasMator@gmail.com','114657837','debito','Av Rivadavia 5473'),
(10,'Maximo','San',46499222,'Machimo-san@gmail.com','1161102015', 'efectivo','San Nicolas 841');

INSERT INTO Computadora(id_compu, tipo, f_creacion) VALUES   /*✔*/
(1, "laptop", "2020-08-15"),
(2 ,"pc escritorio", "2015-01-03"),
(3 ,"laptop", "2012-12-06"),
(4 ,"pc escritorio", "2021-05-20"),
(5 ,"laptop", "2010-02-18"),
(6 ,"pc escritorio", "2019-09-23"),
(7 ,"laptop", "2011-10-28"),
(8 ,"pc escritorio", "2017-02-04"),
(9 ,"laptop", "2016-08-12"),
(10 ,"pc escritorio", "2018-06-11");

  INSERT INTO Compra (Importe, id_cliente, id_compu) VALUES  /*✔*/
  ("50000", 2, 1),
  ("70000", 5, 5),
  ("10000", 8, 3),
  ("25000", 6, 4),
  ("86000", 1, 7),
  ("44000", 9, 6),
  ("33000", 4, 9),
  ("12000", 3, 10),
  ("100000", 10, 2),
  ("99000", 7, 8);

  INSERT INTO Componente(Modelo, Tipo_comp, Marca, Cantidad, id_Compu) VALUES  /*✔*/
  ('GTX 1060', 'placa de video', 'msi', 1, 2),  
  ('GTX 1050 TI', 'placa de video', 'msi', 1, 3),  
  ('GTX 2060', 'placa de video', 'aorus', 1, 6),  
  ('Ryzen 5 1500x', 'procesador', 'amd', 1, 1),  
  ('i7 4thgen', 'procesador', 'intel', 1, 7),  
  ('I38100', 'placa de video', 'intel', 1, 9),  
  ('RTX 2080', 'placa de video', 'zotac', 1, 8),  
  ('GTX 1660', 'placa de video', 'evga', 1, 10),  
  ('Ryzen 7 3700x', 'procesador', 'amd', 1, 4),  
  ('Ryzen 5600g', 'procesador/integrada', 'amd', 1, 5);  


/* 8 A*/         /*X*/
Select DNI, mail,direccion_env
from Cliente
where met_pago LIKE ("efectivo") ;

Select Modelo, Tipo_comp, Cantidad    /*✔*/
from Componente
where id_compu between 2 and 7;


/* C */      /*✔*/
Select  nombre_cliente
from Cliente
where id_cliente > 5
group by nombre_cliente;

Select Modelo   /*X*/
from Componente
where id_compu < 4
group by Modelo;

/* D */   /*✔*/

Select nombre_cliente, apellido, DNI
from Cliente
order by nombre_cliente;

Select id_compu, tipo   /*✔*/
from Computadora
order by id_Compu;

/* E */   /*X*/

Select nombre_cliente, count(id_cliente)
from Cliente
where id_cliente > 7; 

Select avg (Importe) from Compra;   /*✔*/

/* F */    /*✔*/
Select tipo, Modelo, Tipo_comp
from Computadora INNER JOIN Componente
on Computadora.id_Compu = Componente.id_Compu;

/*G*/   /*X*/
Select Importe, id_cliente
from Compra
where Importe > (Select Importe
from Compra
where Importe = '80000');

Select Importe, id_Compu  /*✔*/
from Compra
where Importe <= (Select Importe
from Compra
where Importe = '50000');

Select Importe /*✔*/
from Compra
where Importe >= (Select Importe
from Compra
where Importe = '33000');
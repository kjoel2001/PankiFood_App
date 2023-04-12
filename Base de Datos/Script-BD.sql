create database PankiFood;

create table Cliente (
    Id int not null,
    Nombre varchar(32) not null,
    Telefono  varchar(9) not null,
    NumeroCuenta varchar(16) not null,
    primary key (Id)
);

create table Plato (
    Id int not null,
    Nombre varchar(32) not null,
    Descripcion varchar(60),
    Precio float not null,
    primary key (Id)
);

create table Empleado(
    Id int not null,
    Nombre varchar(32) not null,
    Telefono  varchar(9) not null,
    primary key (Id)
);
create table Local (
    Id int not null,
    Nombre varchar(32) not null,
    Direccion varchar(32) not null,
    Telefono  varchar(9) not null,
    primary key (Id)
);

create table CajeroTipo(
    Id int not null,
    Nombre varchar(20) not null,
    primary key (Id)
); --entrega rápida, encargado reserva de locales

create table Ventanilla(
    Id int not null,
    IdLocal int not null,
    primary key (Id),
    foreign key (IdLocal) references Local(Id)
);

CREATE TABLE Horario (
	Id INT NOT NULL,
	Inicio timestamp NOT NULL,
    Fin timestamp NOT NULL,
	primary key (Id)
);

create table Cajero (
    Id int not null,
    IdTipo int not null,
    IdHorario int not null,
    IdVentanilla int not null,
    primary key (Id),
    foreign key (Id) references Empleado(Id),
    foreign key (IdTipo) references CajeroTipo(Id),
    foreign key (IdHorario) references Horario(Id),
    foreign key (IdVentanilla) references Ventanilla(Id)
);

create table Encargado(
    Id int not null,
    primary key (Id),
    foreign key Id references Empleado(Id)
);

create table LocalEmpleados (
    IdLocal int not null,
    IdEmpleado int not null,
    foreign key (IdLocal) references Local (Id),
    foreign key (IdEmpleado) references Empleado (Id)
);

create table Orden (
    Id int not null,
    IdPlato int not null,
    IdLocal int not null,
    IdVentanilla int not null,
    IdCliente int not null,
    Fecha date not null,
    Hora timestamp not null,
    primary key (Id),
    foreign key (IdPlato) references Plato (Id),
    foreign key (IdLocal) references Local (Id),
    foreign key (IdVentanilla) references Ventanilla (Id),
    foreign key (IdCliente) references Cliente (Id)
);

create table OrdenPlatos (
    IdOrden int not null,
    IdPlato int not null,
    foreign key (IdOrden) references Orden (Id),
    foreign key (IdPlato) references Plato (Id)
);

create table Reserva (
    Id int not null,
    IdCliente int not null,
    IdLocal int not null,
    Fecha date not null,
    HoraInicio timestamp not null,
    HoraFin timestamp not null,
    PrecioFinal float not null,
    primary key (Id),
    foreign key (IdCliente) references Cliente (Id),
    foreign key (IdLocal) references Local (Id)
); -- PrecioFinal = PrecioMesa * (HoraFin - HoraInicio)

create table Mesa (
    Id int not null,
    primary key (Id)
);

create table LocalMesas (
    IdLocal int not null,
    IdMesa int not null,
    foreign key (IdLocal) references Local (Id),
    foreign key (IdMesa) references Mesa (Id)
);

create table ReservaMesas(
    IdReserva int not null,
    IdMesa int not null,
    foreign key (IdReserva) references Reserva (Id),
    foreign key (IdMesa) references Mesa (Id)
);


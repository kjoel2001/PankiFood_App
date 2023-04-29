create database PankiFood;

create TABLE Telefono ( 
    Id int not null,
    Numero varchar(9) not null unique,
    primary key(Id) 
);

create table Cliente ( 
    Id int not null,
    Nombre varchar(32) not null,
    IdTelefono int not null,  
    NumeroCuenta varchar(16) not null,
    primary key (Id),
    foreign key (IdTelefono) references Telefono (Id)
);

create table Alimento ( 
    Id int not null,
    Nombre varchar(32) not null,
    Descripcion varchar(60),
    Precio float not null,
    primary key (Id)
);

create table Local (
    Id int not null,
    Nombre varchar(32) not null,
    Direccion varchar(32) not null,
    Telefono  varchar(9) not null,
    primary key (Id)
);

create table Puesto( 
    Id int not null,
    Nombre varchar(20) not null,
    primary key (Id)
); 

--entrega rápida, encargado reserva de locales

create table Empleado( 
    Id int not null,
    Nombre varchar(32) not null,
    IdTelefono int not null,  
    IdLocal int not null,
    IdPuesto int not null,
    primary key (Id),
    foreign key (IdTelefono) references Telefono (Id),
    foreign key (IdLocal) references Local (Id),
    foreign key (IdPuesto) references Puesto(Id)
);

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

create table EmpleadoHorario ( 
    IdEmpleado int not null,
    IdHorario int not null,
    foreign key (IdEmpleado) references Empleado(Id),
    foreign key (IdHorario) references Horario(Id)
);

create table Cajero (
    Id int not null,
    IdVentanilla int not null,
    primary key (Id),
    foreign key (Id) references Empleado(Id),
    foreign key (IdVentanilla) references Ventanilla(Id)
);

create table Orden (
    Id int not null,
    IdVentanilla int not null,
    IdCliente int not null,
    Fecha date not null,
    Hora timestamp not null,
    primary key (Id),
    foreign key (IdVentanilla) references Ventanilla (Id),
    foreign key (IdCliente) references Cliente (Id)
);

create table OrdenAlimentos ( 
    IdOrden int not null,
    IdAlimento int not null,
    foreign key (IdOrden) references Orden (Id),
    foreign key (IdAlimento) references Alimento (Id)
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
); 
-- PrecioFinal = PrecioMesa * (HoraFin - HoraInicio)

create table Mesa ( 
    Id int not null,
    IdLocal int not null,
    primary key (Id),
    foreign key (IdLocal) references Local (Id)
);

create table ReservaMesas( 
    IdReserva int not null,
    IdMesa int not null,
    foreign key (IdReserva) references Reserva (Id),
    foreign key (IdMesa) references Mesa (Id)
);


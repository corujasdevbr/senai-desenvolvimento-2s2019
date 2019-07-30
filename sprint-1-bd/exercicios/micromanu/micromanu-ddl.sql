use MicroManu;

create table Clientes(
	IdCliente int identity not null primary key,
	Nome varchar(255) not null
);

create table Itens(
	IdItem int identity not null primary key,
	Descricao varchar(255) not null
);

create table TipoConsertos(
	IdTipo int identity not null primary key,
	Descricao varchar(255) not null
);

create table Colaboradores(
	IdColaborador int identity not null primary key,
	Nome varchar(255) not null,
	CPF varchar(11),
	Salario float(2) not null
);

create table Pedidos(
	IdPedido int identity not null primary key,
	NumeroEquipamento varchar(255) not null,
	Entrada date not null,
	Saida date,
	IdCliente int Foreign key references Clientes(IdCliente),
	IdItem int Foreign key references Itens(IdItem),
	IdTipo int foreign key references TipoConsertos(IdTipo)
);

create table PedidosColaboradores(
	IdPedido int Foreign key references Pedidos(IdPedido),
	IdColaborador int foreign key references Colaboradores(IdColaborador)
);

alter table PedidosColaboradores alter column IdPedido int not null
alter table PedidosColaboradores alter column IdColaborador int not null
alter table Pedidos alter column IdCliente int not null
alter table Pedidos alter column IdItem int not null
alter table Pedidos alter column IdTipo int not null
alter table Colaboradores alter column CPF varchar(11) not null
create database MALAMS;
use MALAMS;

create table clientes(
idCliente int auto_increment not null,
nomeCliente varchar(45) not null,
idadeCliente varchar (5),
celularCliente varchar(40) not null,
emailCliente varchar(40) not null,
cepCliente int (8),
numeroResidenciaCliente varchar(5),
cpfCliente varchar (40),
mesCadastroCliente date,
senhaCliente varchar(40) not null,
primary key(idCliente)
);

create table servicos(
idServico int(5) auto_increment not null,
descricaoServico varchar (100),
categoria varchar (50), 
preco decimal (5, 2) not null,
primary key(idServico)
);

create table funcionarios(
idFuncionario int auto_increment not null,
idServico int not null,
nomeFuncionario varchar(45) not null,
emailFuncionario varchar(45) not null, 
senhaFuncionario varchar(40) not null, 
celularFuncionario varchar(30), 
cpfFuncionario varchar(40),
tipoUsuario ENUM('admin', 'comum') not null,
primary key (idFuncionario),
foreign key (idServico) references servicos(idServico)
);

create table agendamentos(
idAgendamento int auto_increment not null,
idCliente int not null,
idFuncionario int not null,
idServico int not null,
dataAgendamento date not null,
hora time not null,
statusAgendamento varchar(20) not null,
confirmacao enum('sim', 'nao') not null,
primary key (idAgendamento),
foreign key (idCliente) references clientes(idCliente),
foreign key (idFuncionario) references funcionarios(idFuncionario),
foreign key (idServico) references servicos(idServico)
);

create table desconto(
idDesconto int auto_increment not null,
idCliente int not null,
frequencia float,
valorDesconto float,
primary key (idDesconto),
foreign key (idCliente) references clientes(idCliente)
);

insert into clientes(nomeCliente, idadeCliente, celularCliente, emailCliente, cepCliente, numeroResidenciaCliente, cpfCliente, mesCadastroCliente, senhaCliente) values
('Ana Silva', '28', '99999-0001', 'ana@gmail.com', 12345678, '123', '123.456.789-00', '2024-01-15', 'senha123'),
('Bruno Santos', '35', '99999-0002', 'bruno@gmail.com', 23456789, '456', '234.567.890-01', '2024-02-10', 'senha456'),
('Carla Oliveira', '22', '99999-0003', 'carla@gmail.com', 34567890, '789', '345.678.901-02', '2024-03-05', 'senha789'),
('Daniel Pereira', '40', '99999-0004', 'daniel@gmail.com', 45678901, '101', '456.789.012-03', '2024-04-20', 'senha321'),
('Eduarda Lima', '30', '99999-0005', 'eduarda@gmail.com', 56789012, '202', '567.890.123-04', '2024-05-25', 'senha654'),
('Felipe Costa', '27', '99999-0006', 'felipe@gmail.com', 67890123, '303', '678.901.234-05', '2024-06-15', 'senha987'),
('Gabriela Rocha', '31', '99999-0007', 'gabriela@gmail.com', 78901234, '404', '789.012.345-06', '2024-07-30', 'senha111'),
('Hugo Martins', '29', '99999-0008', 'hugo@gmail.com', 89012345, '505', '890.123.456-07', '2024-08-12', 'senha222'),
('Isabela Almeida', '26', '99999-0009', 'isabela@gmail.com', 90123456, '606', '901.234.567-08', '2024-09-18', 'senha333'),
('João Mendes', '34', '99999-0010', 'joao@gmail.com', 98765432, '707', '012.345.678-90', '2024-10-01', 'senha444');

insert into servicos(descricaoServico, categoria, preco) values
('Corte de Cabelo', 'Cabelo', 50.00),
('Coloração', 'Cabelo', 120.00),
('Penteado', 'Cabelo', 80.00),
('Manicure', 'Unhas', 30.00),
('Pedicure', 'Unhas', 35.00),
('Limpeza de Pele', 'Estética', 100.00),
('Massagem Relaxante', 'Bem-estar', 90.00),
('Alisamento de Cabelo', 'Cabelo', 150.00),
('Alongamento de Unhas', 'Unhas', 70.00),
('Depilação', 'Estética', 60.00);

insert into funcionarios(idServico, nomeFuncionario, emailFuncionario, senhaFuncionario, celularFuncionario, cpfFuncionario) values
(1, 'Lucas Martins', 'lucas@gmail.com', 'senhaLucas', '99999-0101', '123.456.789-01'),
(2, 'Mariana Ferreira', 'mariana@gmail.com', 'senhaMari', '99999-0102', '234.567.890-12'),
(3, 'Roberto Lima', 'roberto@gmail.com', 'senhaRobo', '99999-0103', '345.678.901-23'),
(1, 'Fernanda Sousa', 'fernanda@gmail.com', 'senhaFern', '99999-0104', '456.789.012-34'),
(2, 'Patrícia Silva', 'patricia@gmail.com', 'senhaPat', '99999-0105', '567.890.123-45'),
(3, 'Tiago Alves', 'tiago@gmail.com', 'senhaTiago', '99999-0106', '678.901.234-56'),
(1, 'Aline Costa', 'aline@gmail.com', 'senhaAline', '99999-0107', '789.012.345-67');

insert into agendamentos(idCliente, idFuncionario, idServico, dataAgendamento, hora, statusAgendamento, confirmacao) values
(1, 2, 1, '2024-10-25', '10:00:00', 'agendado', 'sim'),
(2, 1, 4, '2024-10-26', '14:30:00', 'agendado', 'sim'),
(3, 3, 5, '2024-10-27', '09:15:00', 'agendado', 'sim'),
(4, 4, 8, '2024-10-28', '16:00:00', 'agendado', 'nao'),
(5, 5, 7, '2024-10-29', '13:45:00', 'agendado', 'nao');

insert into desconto(idCliente, frequencia, valorDesconto) values
(1, 100.00, 20.00),
(2, 50.00, 10.00),
(3, 75.00, 15.00),
(4, 25.00, 5.00);

show tables;
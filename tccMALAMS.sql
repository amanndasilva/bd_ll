create database MALAMS;
use MALAMS;

create table clientes (
idCliente int auto_increment not null,
	nomeCliente varchar(45) not null,
	idadeCliente varchar (5),
	celularCliente varchar(40) NOT NULL,
	emailCliente varchar(40) NOT NULL,
	cepCliente int (8),
	numeroResidenciaCliente varchar(5),
	cpfCliente varchar (40),
	mesCadastroCliente date,
	senhaCliente varchar(40) NOT NULL,
	primary key(idCliente)
);

create table servicos (
idServico int(5) auto_increment not null,
	descricaoServico varchar (100),
	categoria varchar (50), 
	preco decimal (5, 2) NOT NULL,
	PRIMARY KEY(idServico)
);

create table funcionarios (
idFuncionario INT AUTO_INCREMENT NOT NULL,
	idServico INT NOT NULL,
	nomeFuncionario VARCHAR(45) NOT NULL,
	emailFuncionario VARCHAR(45) NOT NULL, 
	senhaFuncionario VARCHAR(40) NOT NULL, 
	celularFuncionario VARCHAR(30), 
	cpfFuncionario VARCHAR(40),
	PRIMARY KEY (idFuncionario),
	FOREIGN KEY (idServico) REFERENCES servicos(idServico)
);

create table agendamentos (
 idAgendamento INT AUTO_INCREMENT NOT NULL,
    idCliente INT NOT NULL,
    idFuncionario INT NOT NULL,
    idServico INT NOT NULL,
    data DATE NOT NULL,
    hora TIME NOT NULL,
    status VARCHAR(20) NOT NULL,
    PRIMARY KEY (idAgendamento),
    FOREIGN KEY (idCliente) REFERENCES clientes(idCliente),
    FOREIGN KEY (idFuncionario) REFERENCES funcionarios(idFuncionario),
    FOREIGN KEY (idServico) REFERENCES servicos(idServico)
);

INSERT INTO clientes (nomeCliente, idadeCliente, celularCliente, emailCliente, cepCliente, numeroResidenciaCliente, cpfCliente, mesCadastroCliente, senhaCliente) VALUES
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

INSERT INTO servicos (descricaoServico, categoria, preco) VALUES
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

INSERT INTO funcionarios (idServico, nomeFuncionario, emailFuncionario, senhaFuncionario, celularFuncionario, cpfFuncionario) VALUES
(1, 'Lucas Martins', 'lucas@gmail.com', 'senhaLucas', '99999-0101', '123.456.789-01'),
(2, 'Mariana Ferreira', 'mariana@gmail.com', 'senhaMari', '99999-0102', '234.567.890-12'),
(3, 'Roberto Lima', 'roberto@gmail.com', 'senhaRobo', '99999-0103', '345.678.901-23'),
(1, 'Fernanda Sousa', 'fernanda@gmail.com', 'senhaFern', '99999-0104', '456.789.012-34'),
(2, 'Patrícia Silva', 'patricia@gmail.com', 'senhaPat', '99999-0105', '567.890.123-45'),
(3, 'Tiago Alves', 'tiago@gmail.com', 'senhaTiago', '99999-0106', '678.901.234-56'),
(1, 'Aline Costa', 'aline@gmail.com', 'senhaAline', '99999-0107', '789.012.345-67');

INSERT INTO agendamentos (idCliente, idFuncionario, idServico, data, hora, status) VALUES
(1, 2, 1, '2024-10-25', '10:00:00', 'agendado'),
(2, 1, 4, '2024-10-26', '14:30:00', 'agendado'),
(3, 3, 5, '2024-10-27', '09:15:00', 'agendado'),
(4, 4, 8, '2024-10-28', '16:00:00', 'agendado'),
(5, 5, 7, '2024-10-29', '13:45:00', 'agendado');

show tables;




create database MALAMS; -- Criação do Banco de Dados
use MALAMS; -- Utilizar o Banco para poder criar tabelas e inserir dados

set autocommit = 0; -- Desabilita o commit automático durante o desenvolvimento do Banco
start transaction; -- Inicia o protejo do Banco de Dados

-- Criação de tabela com informações úteis e necessárias para cadastro dos clientes
create table clientes(
idCliente int auto_increment not null, -- Cria um número de ID automático e não nulo
nomeCliente varchar(45) not null, -- Identificação do cliente
cpfCliente varchar (40), -- O registro do CPF evita que o sistema crie clientes em duplicidade
idadeCliente varchar (5), -- Identificação para envio de mensagens de parabéns ao cliente
celularCliente varchar(40) not null, -- Comunicação com o cliente, confirmação de presença nos agendamentos
emailCliente varchar(40) not null, -- Confirmação de cadastro
cepCliente int (8), -- Acesso rápido ao cliente em casos de esquecimento de pertence e afins
numeroResidenciaCliente varchar(5), -- Acesso rápido ao cliente em casos de esquecimento de pertence e afins
mesCadastroCliente date, -- Controle de tempo do cliente utilizando o sistema
senhaCliente varchar(40) not null, -- Proteção do login do cliente
primary key(idCliente) -- Definindo o que o idCliente é uma PK
);

-- Criação de tabela com informações úteis e necessárias para cadastro dos serviços oferecidos
create table servicos(
idServico int(5) auto_increment not null, -- Cria um número de ID automático e não nulo
categoria varchar (50), -- Nome das categorias de cada serviço prestado
descricaoServico varchar (100), -- Descrição de cada serviço oferecido, com detalhes específicos
preco decimal (5, 2) not null, -- Permite que o preço definico no sistema seja em decimal, tendo 5 casas antes da vírgula e 2 após
primary key(idServico) -- Definindo o que o idServico é uma PK
);

-- Criação de tabela com informações úteis e necessárias para cadastro dos funcionários
create table funcionarios(
idFuncionario int auto_increment not null, -- Cria um número de ID automático e não nulo
idServico int not null, -- Insere o ID de uma tabela que faz conexão com a tabela atual, FK
nomeFuncionario varchar(45) not null, -- Identificação de um funcionário
emailFuncionario varchar(45) not null,  -- Confirmação de cadastro do sistema e comunicação com o funcionário com atualizações na plataforma ou avisos do salão
celularFuncionario varchar(30), -- Confirmação de cadastro e contato com o cliente caso seja necessário
cpfFuncionario varchar(40), -- O registro do CPF evita que o sistema crie funcionários em duplicidade
senhaFuncionario varchar(40) not null, -- Proteção do login do funcionário
tipoUsuario ENUM('admin', 'comum') not null, -- Permissões dos funcionários dentro da plataforma, define as funções
primary key (idFuncionario), -- Definindo o que o idFuncionario é uma PK
foreign key (idServico) references servicos(idServico) -- Definindo o que o idServico é uma FK nesta tabela
);

-- Criação de tabela com informações úteis e necessárias para cadastro do formato de agendamentos
create table agendamentos(
idAgendamento int auto_increment not null, -- Cria um número de ID automático e não nulo
idServico int not null, -- Insere o ID de uma tabela que faz conexão com a tabela atual, FK
idFuncionario int not null, -- Insere o ID de uma tabela que faz conexão com a tabela atual, FK
idCliente int not null, -- Insere o ID de uma tabela que faz conexão com a tabela atual, FK
dataAgendamento date not null, -- Data 
hora time not null, -- Definição do horário marcado para cada atendimento/agendamento
statusAgendamento varchar(20) not null, -- Status de se o agendamento está ativo ou pendente, se o agendamento está completo
confirmacao enum('sim', 'nao') not null, -- Confirmação direta do cliente, o sim ou não final
primary key (idAgendamento), -- Definindo o que o idAgendamento é uma PK
foreign key (idCliente) references clientes(idCliente), -- Definindo o que o idCliente é uma FK nesta tabela
foreign key (idFuncionario) references funcionarios(idFuncionario), -- Definindo o que o idFuncionario é uma FK nesta tabela
foreign key (idServico) references servicos(idServico) -- Definindo o que o idServico é uma FK nesta tabela
);

-- Criação de tabela com informações úteis e necessárias para cadastro do formato de descontos
create table descontos(
idDesconto int auto_increment not null, -- Cria um número de ID automático e não nulo
idCliente int not null, -- Insere o ID de uma tabela que faz conexão com a tabela atual, FK
frequencia float, -- Definição da frequência da utilização dos serviços
valorDesconto float, -- Baseado na frequência do cliente, o valor de desconto é calculado
primary key (idDesconto), -- Definindo o que o idDesconto é uma PK
foreign key (idCliente) references clientes(idCliente) -- Definindo o que o idCliente é uma FK nesta tabela
);

-- Inserção de dados nas tabelas
insert into clientes(nomeCliente, cpfCliente, idadeCliente, celularCliente, emailCliente, cepCliente, numeroResidenciaCliente, mesCadastroCliente, senhaCliente) values
('Ana Silva', '123.456.789-00', '28', '99999-0001', 'ana@gmail.com', 12345678, '123', '2024-01-15', 'senha123'),
('Bruno Santos', '234.567.890-01', '35', '99999-0002', 'bruno@gmail.com', 23456789, '456', '2024-02-10', 'senha456'),
('Carla Oliveira', '345.678.901-02', '22', '99999-0003', 'carla@gmail.com', 34567890, '789', '2024-03-05', 'senha789'),
('Daniel Pereira', '456.789.012-03', '40', '99999-0004', 'daniel@gmail.com', 45678901, '101', '2024-04-20', 'senha321'),
('Eduarda Lima', '567.890.123-04', '30', '99999-0005', 'eduarda@gmail.com', 56789012, '202', '2024-05-25', 'senha654'),
('Felipe Costa', '678.901.234-05', '27', '99999-0006', 'felipe@gmail.com', 67890123, '303', '2024-06-15', 'senha987'),
('Gabriela Rocha', '789.012.345-06', '31', '99999-0007', 'gabriela@gmail.com', 78901234, '404', '2024-07-30', 'senha111'),
('Hugo Martins', '890.123.456-07', '29', '99999-0008', 'hugo@gmail.com', 89012345, '505', '2024-08-12', 'senha222'),
('Isabela Almeida', '901.234.567-08', '26', '99999-0009', 'isabela@gmail.com', 90123456, '606', '2024-09-18', 'senha333'),
('João Mendes', '012.345.678-90', '34', '99999-0010', 'joao@gmail.com', 98765432, '707', '2024-10-01', 'senha444');

insert into servicos(categoria, descricaoServico, preco) values
('Cabelo', 'Corte de Cabelo', 50.00),
('Cabelo', 'Coloração', 120.00),
('Cabelo', 'Penteado', 80.00),
('Unhas', 'Manicure', 30.00),
('Unhas', 'Pedicure', 35.00),
('Estética', 'Limpeza de Pele', 100.00),
('Bem-estar', 'Massagem Relaxante', 90.00),
('Cabelo', 'Alisamento de Cabelo', 150.00),
('Unhas', 'Alongamento de Unhas', 70.00),
('Depilação', 'Estética', 60.00);

insert into funcionarios(idServico, nomeFuncionario, emailFuncionario, celularFuncionario, cpfFuncionario, senhaFuncionario) values
(1, 'Lucas Martins', 'lucas@gmail.com', '99999-0101', '123.456.789-01', 'senhaLucas'),
(2, 'Mariana Ferreira', 'mariana@gmail.com', '99999-0102', '234.567.890-12', 'senhaMari'),
(3, 'Roberto Lima', 'roberto@gmail.com', '99999-0103', '345.678.901-23', 'senhaRobo'),
(1, 'Fernanda Sousa', 'fernanda@gmail.com', '99999-0104', '456.789.012-34', 'senhaFern'),
(2, 'Patrícia Silva', 'patricia@gmail.com', '99999-0105', '567.890.123-45', 'senhaPat'),
(3, 'Tiago Alves', 'tiago@gmail.com', '99999-0106', '678.901.234-56', 'senhaTiago'),
(1, 'Aline Costa', 'aline@gmail.com', '99999-0107', '789.012.345-67', 'senhaAline');

insert into agendamentos(idCliente, idFuncionario, idServico, dataAgendamento, hora, statusAgendamento, confirmacao) values
(1, 2, 1, '2024-10-25', '10:00:00', 'agendado', 'sim'),
(2, 1, 4, '2024-10-26', '14:30:00', 'agendado', 'sim'),
(3, 3, 5, '2024-10-27', '09:15:00', 'agendado', 'sim'),
(4, 4, 8, '2024-10-28', '16:00:00', 'agendado', 'nao'),
(5, 5, 7, '2024-10-29', '13:45:00', 'agendado', 'nao');

insert into descontos(idCliente, frequencia, valorDesconto) values
(1, 100.00, 20.00),
(2, 50.00, 10.00),
(3, 75.00, 15.00),
(4, 25.00, 5.00);

/* TESTE ROLLBACK E COMMIT
delete from clientes
where idCliente = 3;
*/

select * from clientes;

show tables; -- Mostra todas as tabelas criadas

rollback; -- Retorna/Desfaz alterações feitas

commit; -- Salva no disco alterações feitas, após utilizar ele, não é possível utilizar a ação rollback
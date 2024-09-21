create database livraria;
use livraria;

create table cliente (
id_cliente int not null auto_increment,
nome varchar (70),
sexo varchar (10),
email varchar (20),
celular varchar (12),
cep int (8),
numeroresidencia int (6),
cpf varchar (11),
datacadastro date,
primary key (id_cliente)
);

create table vendedor (
id_vendedor int not null auto_increment,
nome varchar (70),
email varchar (20),
celular varchar (12),
primary key (id_vendedor)
);

create table pedido (
id_pedido int not null auto_increment,
datapedido datetime,
preco varchar (30),
conteudo varchar (90),
primary key (id_pedido)
);

create table livro (
id_livro int not null auto_increment,
nome varchar (90),
preco varchar (10),
genero varchar (30),
editora varchar (30),
primary key (id_livro)
);

create table estoque (
id_estoque int not null auto_increment,
genero varchar (20),
quantidade varchar (10),
primary key (id_estoque)
);

create table notafiscal (
id_notafiscal int not null auto_increment,
chave varchar (45),
primary key (id_notafiscal)
);

create table livroPedido (
foreign key(id_cliente) references cliente (id_cliente),
foreign key(id_vendedor) references vendedor (id_vendedor),
foreign key(id_livro) references livro (id_livro),
foreign key(id_pedido) references pedido (id_pedido),
foreign key(id_notafiscal) references notafiscal (id_notafiscal)
);

insert into cliente (nome, sexo, idade, email, celular, cep, numeroresidencia, cpf, datacadastro)
values(
('Alice', 'Feminino', '28', 'alice.silva@gmail.com', '11923456789', 12345-678, '123', '12345678901', '2024-01-10'),
('Bruno', 'Masculino', '34', 'bruno.martins@hotmail.com', '11987654321', 23456-789, '456', '23456789012', '2024-01-15'),
('Carla', 'Feminino', '22', 'carla.nunes@yahoo.com', '11876543210', 34567-890, '789', '34567890123', '2024-02-01'),
('Daniel', 'Masculino', '30', 'daniel.souza@gmail.com', '11912345678', 45678-901, '321', '45678901234', '2024-02-20'),
('Fernanda', 'Feminino', '25', 'fernanda.pereira@gmail.com', '11923456780', 56789-012, '654', '56789012345', '2024-03-05'),
('Gustavo', 'Masculino', '40', 'gustavo.santos@hotmail.com', '11976543210', 67890-123, '987', '67890123456', '2024-03-15'),
('Juliana', 'Feminino', '31', 'juliana.rodrigues@yahoo.com', '11854321678', 78901-234, '135', '78901234567', '2024-04-10'),
('Lucas', 'Masculino', '29', 'lucas.melo@gmail.com', '11987654321', 89012-345, '246', '89012345678', '2024-04-25'),
('Mariana', 'Feminino', '26', 'mariana.silva@gmail.com', '11876543210', 90123-456, '369', '90123456789', '2024-05-15'),
('Ricardo', 'Masculino', '38', 'ricardo.santos@hotmail.com', '11923456789', 01234-567, '789', '01234567890', '2024-05-30')
);

insert into vendedor (nome, email, celular)
values(
('Thiago', 'thiago.vendas@gmail.com', '11923456789'),
('Sofia', 'sofia.loja@hotmail.com', '11987654321'),
('Gabriel', 'gabriel.souza@gmail.com', '11876543210'),
('Juliana', 'juliana.vendas@yahoo.com', '11912345678'),
('Ricardo', 'ricardo.nunes@gmail.com', '11923456780'),
('Laura', 'laura.oliveira@hotmail.com', '11854321678'),
('Marcos', 'marcos.rodrigues@gmail.com', '11976543210'),
('Carla', 'carla.santos@yahoo.com', '11865432109'),
('Fernando', 'fernando.vendas@gmail.com', '11987654321'),
('Natália', 'natalia.pereira@hotmail.com', '11876543210')
);

insert into pedido (datapedido, preco, conteudo)
values (
('2024-01-15', 49.90, '“A Menina que Roubava Livros” - Markus Zusak'),
('2024-01-20', 39.90, '“1984” - George Orwell'),
('2024-02-05', 29.90, '“O Alquimista” - Paulo Coelho'),
('2024-02-12', 45.00, '“Dom Casmurro” - Machado de Assis'),
('2024-03-03', 35.90, '“Sapiens: Uma Breve História da Humanidade” - Yuval Noah Harari'),
('2024-03-15', 54.90, '“Harry Potter e a Pedra Filosofal” - J.K. Rowling'),
('2024-04-10', 59.90, '“O Hobbit” - J.R.R. Tolkien'),
('2024-04-22', 42.50, '“O Diário de Anne Frank” - Anne Frank'),
('2024-05-05', 33.90, '“A Revolução dos Bichos” - George Orwell'),
('2024-05-12', 24.90, '“O Pequeno Príncipe” - Antoine de Saint-Exupéry')
);

insert into livro (nome, preco, genero, editora)
values (
('A Menina que Roubava Livros', 49.90, 'Ficção', 'Intrínseca'),
('1984', 39.90, 'Distopia', 'Companhia das Letras'),
('O Alquimista', 29.90, 'Ficção', 'HarperCollins'),
('Dom Casmurro', 45.00, 'Clássico', 'Editora Nova Fronteira'),
('Sapiens: Uma Breve História da Humanidade', 35.90, 'Não-ficção', 'Leya'),
('Harry Potter e a Pedra Filosofal', 54.90, 'Fantasia', 'Rocco'),
('O Hobbit', 59.90, 'Fantasia', 'HarperCollins'),
('O Diário de Anne Frank', 42.50, 'Biografia', 'Record'),
('A Revolução dos Bichos', 33.90, 'Fábula', 'Companhia das Letras'),
('O Pequeno Príncipe', 24.90, 'Infantil', 'Agir')
);

insert into estoque (genero, quantidade)
values (
('Ficção Científica', 20),
('Romance', 18),
('Terror', 12),
('Mistério', 15),
('Aventura', 25),
('Autoajuda', 30),
('História', 22),
('Biografia', 10),
('Poesia', 14),
('Infantil', 35)
);

insert into notafiscal (chave)
values (
('12345678901234567890123456789012345678901234'),
('23456789012345678901234567890123456789012345'),
('34567890123456789012345678901234567890123456'),
('45678901234567890123456789012345678901234567'),
('56789012345678901234567890123456789012345678'),
('67890123456789012345678901234567890123456789'),
('78901234567890123456789012345678901234567890'),
('89012345678901234567890123456789012345678901'),
('90123456789012345678901234567890123456789012'),
('01234567890123456789012345678901234567890123')
);

select * from cliente;

select nome from livro;

select count(*) from cliente
where datacadastro between '2024-04-01 00:00:00' and '2024-04-30 23:59:00';

update cliente set celular='11665478965' where id_cliente=2;

select * from cliente 
where nome_cliente like 'g%' and nome_cliente like '%a';

select * from cliente
where nome_cliente like '%a%'; -- mostra os nomes que contém A no meio do nome (em qualquer parte do nome)

select sexo, count(id_cliente) from cliente
group by sexo;

select idade, count(id_cliente) from cliente
where idade between 20 and 30
group by idade
order by idade asc;
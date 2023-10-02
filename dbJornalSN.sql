drop database dbJornalSN;

create database dbJornalSN;

use dbJornalSN;

create table tbTipos(
codTipos int not null auto_increment,
descricao varchar(30) not null,
primary key(codTipos)
);

insert into tbTipos(descricao) 
values('master');
insert into tbTipos(descricao) 
values('admcad');
insert into tbTipos(descricao) 
values('admnot');
insert into tbTipos(descricao) 
values('aluno');	
insert into tbTipos(descricao) 
values('docente');

create table tbTurmas(
codTurmas int not null auto_increment,
turma varchar(10),
primary key(codTurmas)
);

create table tbCategoria(
codCategoria int not null auto_increment,
categoria varchar(50) not null,
primary key(codCategoria)
);

insert into tbCategoria(categoria) 
values('Informática');
insert into tbCategoria(categoria) 
values('Administração');
insert into tbCategoria(categoria) 
values('Fotografia');
insert into tbCategoria(categoria) 
values('Estética');	
insert into tbCategoria(categoria) 
values('Enfermagem');
insert into tbCategoria(categoria) 
values('Senac');

create table tbNot(
codNot int not null auto_increment,
titulo varchar (50) not null,
tempo DATETIME not null,
autor varchar (30) not null,
codCategoria int not null,
primary key(codNot),
foreign key(codCategoria) references tbCategoria(codCategoria)
);	

create table tbFunc(
codFunc int not null auto_increment,
nome varchar(100) not null,
nascimento date not null,
turma varchar(10),
cpf varchar(14) unique not null,
telCel char(15) not null,
emailpessoal varchar(100) not null,
endereco varchar(100) not null,
numero varchar(10) not null,
bairro varchar(100) not null,
cidade varchar(100) not null,
estado char(2) not null,
cep char(9) not null,
responsavel varchar(100),
codTurmas int,
codTipos int not null,
primary key(codFunc),
foreign key(codTipos) references tbTipos(codTipos),
foreign key(codTurmas) references tbTurmas(codTurmas)
);

insert into tbFunc(nome,nascimento,turma,cpf,telCel,emailpessoal,endereco,numero,bairro,cidade,estado,cep,responsavel,codTipos) 
values('Willian Brito','1991/05/22','','403.180.848-80','(11) 96624-0614','willianhenriquevb@gmail.com','Av. João Caiaffa','40','Vila Sônia','São Paulo','SP','05742-100','',1);

insert into tbFunc(nome,nascimento,turma,cpf,telCel,emailpessoal,endereco,numero,bairro,cidade,estado,cep,responsavel,codTipos) 
values('Kaio Silva','2005/01/04','','403.180.848-70','(11) 96624-0614','willianhenriquevb@gmail.com','Av. João Caiaffa','40','Vila Sônia','São Paulo','SP','05742-100','',5);

insert into tbFunc(nome,nascimento,turma,cpf,telCel,emailpessoal,endereco,numero,bairro,cidade,estado,cep,responsavel,codTipos) 
values('Mathias Familia','2004/01/02','','403.180.848-60','(11) 96624-0614','willianhenriquevb@gmail.com','Av. João Caiaffa','40','Vila Sônia','São Paulo','SP','05742-100','',3);

insert into tbFunc(nome,nascimento,turma,cpf,telCel,emailpessoal,endereco,numero,bairro,cidade,estado,cep,responsavel,codTipos) 
values('Gabriel Pensador','2004/08/17','','403.180.848-00','(11) 96624-0614','willianhenriquevb@gmail.com','Av. João Caiaffa','40','Vila Sônia','São Paulo','SP','05742-100','',4);

insert into tbFunc(nome,nascimento,turma,cpf,telCel,emailpessoal,endereco,numero,bairro,cidade,estado,cep,responsavel,codTipos) 
values('Nicolas Nicolas','2004/08/14','','403.180.848-99','(11) 96624-0614','teste@gmail.com','Av. João Caiaffa','40','Vila Sônia','São Paulo','SP','05742-100','',5);

create table tbUsuario(
codAdm int not null auto_increment,
usuario varchar(30) not null,
senha varchar(14) not null,
codFunc int not null,
codTipos int not null,
codCategoria int not null,
primary key(codAdm),
foreign key(codFunc) references tbFunc(codFunc),
foreign key(codCategoria) references tbCategoria(codCategoria),
foreign key(codTipos) references tbTipos(codTipos)
);


insert into tbUsuario(usuario,senha,codFunc,codCategoria,codTipos) values('Master','Master@1',1,6,1);
insert into tbUsuario(usuario,senha,codFunc,codCategoria,codTipos) values('kaio.silva','123456',2,6,5);
insert into tbUsuario(usuario,senha,codFunc,codCategoria,codTipos) values('mathias.familia','123456',3,6,2);
insert into tbUsuario(usuario,senha,codFunc,codCategoria,codTipos) values('Gabriel.Pensador','123456',4,1,4);
insert into tbUsuario(usuario,senha,codFunc,codCategoria,codTipos) values('Nicolas.Nicolas','abcdef',5,6,5);

insert into tbNot(titulo,tempo,autor,codCategoria) values('Morte no Senac','2023/09/29','Mathias Familia',2);

--insert into tbNot(titulo,tempo,autor,codCategoria) values('Morte no Senac','2023/09/29','Mathias Familia',1);

--select admnot.nome,usu.usuario,tipo.descricao from tbUsuario as usu
--inner join tbAdmNot as admnot on usu.codFunc=admnot.codFunc
--inner join tbTipos as tipo on tipo.codTipos=usu.codTipos
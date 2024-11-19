create table usuario (id int not null primary key, nome varchar(100), email varchar(100), senha varchar(100));

insert into usuario (id, nome, email, senha) values (1, 'Gabriel', 'gabriel@mail.com', '123456')

insert into usuario (id, nome, email, senha) values (2, 'James', 'james@mail.com', '123456')

create table conta_bancaria (id_conta_bancaria SERIAL not NULL, saldo decimal(10,2), nome_banco varchar(100), id_usuario int, foreign key (id_usuario) references usuario(id))
drop table conta_bancaria
select * from conta_bancaria

select * from usuario

insert into conta_bancaria (saldo, nome_banco, id_usuario) values (3456.67, 'Caixa', 1);
insert into conta_bancaria (saldo, nome_banco, id_usuario) values (10000, 'Nubank', 1);
insert into conta_bancaria (saldo, nome_banco, id_usuario) values (2000, 'Nubank', 2);
insert into conta_bancaria (saldo, nome_banco, id_usuario) values (1500, 'Caixa', 2);
insert into conta_bancaria (saldo, nome_banco, id_usuario) values (800, 'Inter', 2);

insert into conta_bancaria values (null, null, null, null);

update conta_bancaria set saldo = 10000 where id_conta_bancaria = 1;

delete from conta_bancaria where id_conta_bancaria is null

alter table conta_bancaria add constraint FK_CONTA_BANCARIA_USUARIO foreign key (id_usuario) references usuario (id);

select sum(cb.saldo) from usuario u
join conta_bancaria cb on u.id = cb.id_usuario
where u.id = 2

select u.id, sum(cb.saldo) from usuario u
join conta_bancaria cb on u.id = cb.id_usuario
-- where u.id = 2 
group by u.id




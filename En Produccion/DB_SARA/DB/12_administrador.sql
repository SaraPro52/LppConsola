use sara;
select * from funcionario;
select * from rol;
select * from rol_funcionario;
insert into rol values(null,'administrador','mantiene el sistema a flote');
insert into funcionario values(null,1,1019,'admi','d','sara@gmail.com','Admi','0',null,2,1);
insert into rol_funcionario values(null,5,6);

use sara;
SELECT * FROM funcionario;
select * from rol;
select * from rol_funcionario;
insert into rol values(null,'administrador','mantiene el sistema a flote');
insert into funcionario values(null,1,1019,'admi','d','sara@gmail.com','Admi','0',null,2,1);
insert into rol_funcionario values(null,5,7);
/*
Contraseña encriptada				Desencriptada
e10adc3949ba59abbe56e057f20f883e	123456
81dc9bdb52d04dc20036dbd8313ed055	1234
*/

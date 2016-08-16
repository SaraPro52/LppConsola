USE SARApro;

CREATE VIEW Coordinador AS(

SELECT F.Id_Funcionario, Num_Documento, Nom_Funcionario, Apellidos , Correo ,Cargo, Ip_Sena ,Contraseña	,Id_Area_Centro,
	   Rl.Id_Rol_Funcionario,Rl.Id_Rol
FROM Funcionario F INNER JOIN Rol_Funcionario Rl ON F.Id_Funcionario = Rl.Id_Funcionario)

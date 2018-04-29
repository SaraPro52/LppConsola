-- MisProductos
-- 

/*

CALL MisProductos("5");

*/
DROP PROCEDURE IF EXISTS MisProductos;

DELIMITER ;;
CREATE PROCEDURE MisProductos(IN idFuncionario_Var VARCHAR(5))
BEGIN

    SELECT DISTINCT pv.Id_P_Virtual,pv.Nom_P_Virtual,v.Num_Version, e.Nom_Estado,v.Fecha_Envio ,v.Url_Version,f.Id_Funcionario
    FROM Version v 
    INNER JOIN Producto_Virtual pv ON v.Id_P_Virtual = pv.Id_P_Virtual
    INNER JOIN Autor a ON v.Id_Version = a.Id_Version 
    INNER JOIN Funcionario f ON a.Id_Funcionario = f.Id_Funcionario
    INNER JOIN Estado	e	 ON v.Id_Estado = e.Id_Estado
    WHERE f.Id_Funcionario = idFuncionario_Var;
END;;
DELIMITER ;


            
            

            
            
            
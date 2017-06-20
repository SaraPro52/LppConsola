USE SARA006;

CALL ConsultarNotificaciones("4~1~1");
CALL ConsultarNotificaciones("1~1~2");


SET @valore = "22";
SET @NomPVirtual 			= CONCAT("Producto Numero Version_",@valore);
SET @DesPVirtual 			= CONCAT("Producto Numero Version_",@valore);
SET @PalabrasClave 			= CONCAT("Producto Numero Version_",@valore);
SET @IdFormato 				= "16";
SET @UrlVersion 			= CONCAT("Producto_",@valore);
SET @UrlImg 				= CONCAT("Producto1_",@valore);
SET @InstInstalacion		= CONCAT("Producto Numero Version_",@valore);
SET @ReqstInstalacion 		= CONCAT("Producto Numero Version_",@valore);
SET @ArrayFuncionario 		= "1,5";
SET @ArrayTema 				= "1-1,2-0,3-1,4-0";

CALL Registrar_PV(CONCAT(
@NomPVirtual,"~",@DesPVirtual,"~",@PalabrasClave,"~",@IdFormato,"~",@UrlVersion,"~",@UrlImg,"~",@InstInstalacion,"~",@ReqstInstalacion,"~",@ArrayFuncionario,"~",@ArrayTema),@sal);
SELECT @sal;


-- -------------------------------------------------------------------------------------------------------------------------------------
-- EVALUAR PV

USE SARA006;


-- --------------------------------------------- EVALUACION EQUIPO TECNICO
CALL ConsultarNotificaciones("2~2~3");


SET @observacionG_1 	= "Observacion_1";
SET @resultado_1 	  	= "1";
SET @idVersion_1 	  	= "2";
SET @idLista_1 	  		= "1";
SET @idFuncionario_1 	= "2";
SET @fechaVigencia_1  	= "null";
SET @ArrayEvaItems_1 	= "1¤si cumple con el item¤3|1¤si cumple con el item¤4";

CALL RegistrarEvaluacion(CONCAT(@observacionG_1,"~",@resultado_1,"~",@idVersion_1,"~",@idLista_1 ,"~",@idFuncionario_1,"~",@fechaVigencia_1,"~",@ArrayEvaItems_1));

-- ------------------------------------------


-- --------------------------------------------- EVALUACION EQUIPO PEDAGOGICO


CALL ConsultarNotificaciones("3~3~3");

SET @observacionG_1 	= "Observacion_1";
SET @resultado_1 	  	= "1";
SET @idVersion_1 	  	= "13";
SET @idLista_1 	  		= "2";
SET @idFuncionario_1 	= "3";
SET @fechaVigencia_1  	= "null";
SET @ArrayEvaItems_1 	= "1¤si cumple con el item¤1|1¤si cumple con el item¤2|1¤si cumple con el item¤5";


CALL RegistrarEvaluacion(CONCAT(@observacionG_1,"~",@resultado_1,"~",@idVersion_1,"~",@idLista_1 ,"~",@idFuncionario_1,"~",@fechaVigencia_1,"~",@ArrayEvaItems_1));

-- ------------------------------------------

-- ------------------------------------------------------------------------------------------------
-- -----------APROBAR

CALL ConsultarNotificaciones("4~4~4");

SET @idCoordinador_1 	= "4";
SET @idVersion_1 		= "12";
CALL AprobarPV(CONCAT(@idCoordinador_1,"~",@idVersion_1),@sal_3);
SELECT @sal_3;



-- -------------------------------------------------------------------------------------------------------------------------------------------
-- --------------ACTUALIZAR PV


CALL ConsultarNotificaciones("16~1~5");

SET @valore_2 				= "1.1";
SET @idPro_2 				= "1";
SET @UrlVersion_2 			= CONCAT("Producto_",@valore_2);
SET @UrlImg_2 				= CONCAT("Producto1_",@valore_2);
SET @InstInstalacion_2		= CONCAT("Producto Numero Version_",@valore_2);
SET @ReqstInstalacion_2 	= CONCAT("Producto Numero Version_",@valore_2);
SET @ArrayFuncionario_2 	= "1";
SET @ArrayTema_2 			= "null";


CALL RegistarActualizacion(CONCAT(@idPro_2,"~",@UrlVersion_2,"~",@UrlImg_2,"~",@InstInstalacion_2,"~",@ReqstInstalacion_2,"~",@ArrayFuncionario_2,"~",@ArrayTema_2),@sal_2);

SELECT @sal_2;


-- -----------------------------------------------------------------------------
-- NOTIFICACIONES FUNCIONARIO INSTRUCTOR


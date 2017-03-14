<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script type="text/javascript" src="js/jquery.js"></script>
        <script type="text/javascript" src="js/jquery.form.js"></script>
        <script type="text/javascript" src="instructor/registroOA/js/imagenes.js"></script>
    </head>
    <body>
        <div>
            <a class='btn btn-info' href="DescargaArchivo?archivo=FullmetalAlchemistElric.jpg">jpg</a>
            <a class='btn btn-info' href="DescargaArchivo?archivo=fullMetal.png">png</a>
            <a class='btn btn-info' href="DescargaArchivo?archivo=docks.docx">docx</a>
            <a class='btn btn-info' href="DescargaArchivo?archivo=Jum.rar">rar</a>
            <a class='btn btn-info' href="DescargaArchivo?archivo=javamail1_4_5.zip">zip</a>            
            <a class='btn btn-info' href="DescargaArchivo?archivo=Libro1.xlsx">xlsx</a>
            <a class='btn btn-info' href="DescargaArchivo?archivo=googledrivesync.exe">exe</a>
            <a class='btn btn-info' href="DescargaArchivo?archivo=Presentacion2.pptx">pptx</a>
            <a class='btn btn-info' href="DescargaArchivo?archivo=Videotienda.csv">csv</a>
            <a class='btn btn-info' href="DescargaArchivo?archivo=gifanimado.gif">gif</a>
            <a class='btn btn-info' href="DescargaArchivo?archivo=pro.txt">txt</a>
            <a class='btn btn-info' href="DescargaArchivo?archivo=Procedimientos_08.sql">sql</a>
            <a class='btn btn-info' href="DescargaArchivo?archivo=PLAN_DE_CAPACITACION_FUNCIONAL_V_0.2.pdf">pdf</a>
            <a class='btn btn-info' href="DescargaArchivo?archivo=org.json.jar">jar</a>
        </div>
        <div class="form-group">
            <label for="Documento">Adjuntar OA</label>
            <form id="UploadForm" action="archivos" method="post" enctype="multipart/form-data">
                <input type="file" size="26120" id="myfile" class="inputs input-file form-control" name="myfile"> 
                <input type="submit" class=" btn btn-info  col-md-6"  value="Subir Produto virtual" id="subir_oa">
                <div id="progressbox">
                    <div id="progressbar"></div>
                    <div id="percent">0%</div>
                </div>
                <br />
                <div id="message"></div>
            </form>
        </div>
    </body>
</html>

package M_Util;

import M_Util.Elomac;
import M_Util.M_Procedure;
import java.sql.ResultSet;
import org.json.JSONArray;
import org.json.JSONObject;

public class EstructuraDB {
    
    public void Creacion(){
        try {
                JSONArray resultadoInfo = new JSONArray(Elomac.M_ResultSet("SARA001~1~0",11));
                JSONObject tablasTodoJO = new JSONObject();
                JSONObject tablaConteJO = null;
                for (int i = 0; i < resultadoInfo.length(); i++) {
                    String nombreKey = resultadoInfo.getJSONObject(i).getJSONArray("tablas").getString(0);
                    String posicion =  resultadoInfo.getJSONObject(i).getJSONArray("posicion").getString(0);
                    String tipoT =     resultadoInfo.getJSONObject(i).getJSONArray("tipoT").getString(0);
                    
                    tablaConteJO = new JSONObject();
                    tablaConteJO.put("Posicion", posicion);
                    tablaConteJO.put("TipoT", tipoT);
                    
                    try {
                        M_Procedure mp = new M_Procedure();
                        mp.rs = (ResultSet) mp.Registar("SARA001~2~"+nombreKey+"", 11);
                        
                        JSONObject registro = null;
                        JSONArray columnas = new JSONArray();
                        while (mp.rs.next()) {
                            registro = new JSONObject();
                            registro.append("Columna",mp.rs.getString("Columnas"));
                            registro.append("PosicionColum",mp.rs.getInt("PosicionColum"));
                            columnas.put(registro);
                        }
                        tablaConteJO.put("ColumnasTabla",columnas);
                    } catch (Exception e) {
                        System.out.println(e.getMessage());
                    }
                    
                    tablasTodoJO.put(nombreKey,tablaConteJO);
                }
                estructura = tablasTodoJO.toString();
                
                System.out.println(tablasTodoJO+"");
            
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }
    
    
    protected static String estructura = "{\n" +
"    \"detalles_area\": {\n" +
"        \"TipoT\": \"1\",\n" +
"        \"ColumnasTabla\": [{\n" +
"                \"PosicionColum\": [0],\n" +
"                \"Columna\": [\"Id_Detalles_Area\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [1],\n" +
"                \"Columna\": [\"Id_Area\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [2],\n" +
"                \"Columna\": [\"Id_Programa\"]\n" +
"            }],\n" +
"        \"Posicion\": \"8\"\n" +
"    },\n" +
"    \"estado\": {\n" +
"        \"TipoT\": \"1\", \n" +
"        \"ColumnasTabla\": [{\n" +
"                \"PosicionColum\": [0],\n" +
"                \"Columna\": [\"Id_Estado\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [1],\n" +
"                \"Columna\": [\"Nom_Estado\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [2],\n" +
"                \"Columna\": [\"Id_Tipo_Estado\"]\n" +
"            }],\n" +
"        \"Posicion\": \"15\"\n" +
"    },\n" +
"    \"area_centro\": {\n" +
"        \"TipoT\": \"1\",\n" +
"        \"ColumnasTabla\": [{\n" +
"                \"PosicionColum\": [0],\n" +
"                \"Columna\": [\"Id_Area_Centro\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [1],\n" +
"                \"Columna\": [\"Id_Area\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [2],\n" +
"                \"Columna\": [\"Id_Centro\"]\n" +
"            }],\n" +
"        \"Posicion\": \"2\"\n" +
"    },\n" +
"    \"38_v_notificaciones_ar\": {\n" +
"        \"TipoT\": \"2\",\n" +
"        \"ColumnasTabla\": [{\n" +
"                \"PosicionColum\": [0],\n" +
"                \"Columna\": [\"Id_Funcionario\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [1],\n" +
"                \"Columna\": [\"Nom_Funcionario\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [2],\n" +
"                \"Columna\": [\"Id_Rol\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [3],\n" +
"                \"Columna\": [\"Nom_Rol\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [4],\n" +
"                \"Columna\": [\"Id_Notificacion\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [5],\n" +
"                \"Columna\": [\"Fecha_Envio\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [6],\n" +
"                \"Columna\": [\"Conte_Notificacion\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [7],\n" +
"                \"Columna\": [\"Ides_Proceso\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [8],\n" +
"                \"Columna\": [\"Nom_P_Virtual\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [9],\n" +
"                \"Columna\": [\"Num_Version\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [10],\n" +
"                \"Columna\": [\"Id_FuncionarioEnvio\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [11],\n" +
"                \"Columna\": [\"Estado\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [12],\n" +
"                \"Columna\": [\"Id_Centro\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [13],\n" +
"                \"Columna\": [\"Id_Tipo_Notificacion\"]\n" +
"            }],\n" +
"        \"Posicion\": \"37\"\n" +
"    },\n" +
"    \"programa\": {\n" +
"        \"TipoT\": \"1\",\n" +
"        \"ColumnasTabla\": [{\n" +
"                \"PosicionColum\": [0],\n" +
"                \"Columna\": [\"Id_Programa\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [1],\n" +
"                \"Columna\": [\"Nom_Programa\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [2],\n" +
"                \"Columna\": [\"Nivel_Formacion\"]\n" +
"            }],\n" +
"        \"Posicion\": \"23\"\n" +
"    },\n" +
"    \"toquen\": {\n" +
"        \"TipoT\": \"1\",\n" +
"        \"ColumnasTabla\": [{\n" +
"                \"PosicionColum\": [0],\n" +
"                \"Columna\": [\"Numero_Toquen\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [1],\n" +
"                \"Columna\": [\"Funcionario\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [2],\n" +
"                \"Columna\": [\"FechaVigencia\"]\n" +
"            }],\n" +
"        \"Posicion\": \"31\"\n" +
"    },\n" +
"    \"16_v_items_lista\": {\n" +
"        \"TipoT\": \"2\",\n" +
"        \"ColumnasTabla\": [{\n" +
"                \"PosicionColum\": [0],\n" +
"                \"Columna\": [\"Id_Item_Lista\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [1],\n" +
"                \"Columna\": [\"Des_Item_Lista\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [2],\n" +
"                \"Columna\": [\"Tipo_Item\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [3],\n" +
"                \"Columna\": [\"Id_Lista_Chequeo\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [4],\n" +
"                \"Columna\": [\"Id_Detalles_Lista\"]\n" +
"            }],\n" +
"        \"Posicion\": \"15\"\n" +
"    },\n" +
"    \"36_v_estadisticacategoria2\": {\n" +
"        \"TipoT\": \"2\",\n" +
"        \"ColumnasTabla\": [{\n" +
"                \"PosicionColum\": [0],\n" +
"                \"Columna\": [\"Id_Categoria\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [1],\n" +
"                \"Columna\": [\"Nom_Categoria\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [2],\n" +
"                \"Columna\": [\"Canti\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [3],\n" +
"                \"Columna\": [\"Id_Centro\"]\n" +
"            }],\n" +
"        \"Posicion\": \"35\"\n" +
"    },\n" +
"    \"detalles_notificacion\": {\n" +
"        \"TipoT\": \"1\",\n" +
"        \"ColumnasTabla\": [{\n" +
"                \"PosicionColum\": [0],\n" +
"                \"Columna\": [\"Id_Detalles_Notificacion\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [1],\n" +
"                \"Columna\": [\"Id_Notificacion\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [2],\n" +
"                \"Columna\": [\"Id_Funcionario\"]\n" +
"            }],\n" +
"        \"Posicion\": \"12\"\n" +
"    },\n" +
"    \"07_v_version\": {\n" +
"        \"TipoT\": \"2\",\n" +
"        \"ColumnasTabla\": [{\n" +
"                \"PosicionColum\": [0],\n" +
"                \"Columna\": [\"Id_P_Virtual\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [1],\n" +
"                \"Columna\": [\"Nom_P_Virtual\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [2],\n" +
"                \"Columna\": [\"Des_P_Virtual\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [3],\n" +
"                \"Columna\": [\"Palabras_Clave\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [4],\n" +
"                \"Columna\": [\"Id_Formato\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [5],\n" +
"                \"Columna\": [\"Id_Version\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [6],\n" +
"                \"Columna\": [\"Fecha_Envio\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [7],\n" +
"                \"Columna\": [\"Fecha_Publicacion\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [8],\n" +
"                \"Columna\": [\"Num_Version\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [9],\n" +
"                \"Columna\": [\"Fecha_Vigencia\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [10],\n" +
"                \"Columna\": [\"Url_Version\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [11],\n" +
"                \"Columna\": [\"Url_Img\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [12],\n" +
"                \"Columna\": [\"Inst_Instalacion\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [13],\n" +
"                \"Columna\": [\"Reqst_Instalacion\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [14],\n" +
"                \"Columna\": [\"Id_Estado\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [15],\n" +
"                \"Columna\": [\"Nom_Estado\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [16],\n" +
"                \"Columna\": [\"Id_Tipo_Estado\"]\n" +
"            }],\n" +
"        \"Posicion\": \"6\"\n" +
"    },\n" +
"    \"17_v_productosevaluador\": {\n" +
"        \"TipoT\": \"2\",\n" +
"        \"ColumnasTabla\": [{\n" +
"                \"PosicionColum\": [0],\n" +
"                \"Columna\": [\"Id_P_Virtual\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [1],\n" +
"                \"Columna\": [\"Nom_P_Virtual\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [2],\n" +
"                \"Columna\": [\"Id_Version\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [3],\n" +
"                \"Columna\": [\"Num_Version\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [4],\n" +
"                \"Columna\": [\"Fecha_Vigencia\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [5],\n" +
"                \"Columna\": [\"Id_Estado\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [6],\n" +
"                \"Columna\": [\"Nom_Estado\"]\n" +
"            }],\n" +
"        \"Posicion\": \"16\"\n" +
"    },\n" +
"    \"28_v_consultacategoria\": {\n" +
"        \"TipoT\": \"2\",\n" +
"        \"ColumnasTabla\": [{\n" +
"                \"PosicionColum\": [0],\n" +
"                \"Columna\": [\"Id_P_Virtual\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [1],\n" +
"                \"Columna\": [\"Nom_P_Virtual\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [2],\n" +
"                \"Columna\": [\"Des_P_Virtual\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [3],\n" +
"                \"Columna\": [\"Id_Formato\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [4],\n" +
"                \"Columna\": [\"Fecha_Publicacion\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [5],\n" +
"                \"Columna\": [\"Id_Funcionario\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [6],\n" +
"                \"Columna\": [\"Id_Categoria\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [7],\n" +
"                \"Columna\": [\"Id_Version\"]\n" +
"            }],\n" +
"        \"Posicion\": \"27\"\n" +
"    },\n" +
"    \"funcionario\": {\n" +
"        \"TipoT\": \"1\",\n" +
"        \"ColumnasTabla\": [{\n" +
"                \"PosicionColum\": [0],\n" +
"                \"Columna\": [\"Id_Funcionario\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [1],\n" +
"                \"Columna\": [\"Id_Tipo_Documento\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [2],\n" +
"                \"Columna\": [\"Num_Documento\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [3],\n" +
"                \"Columna\": [\"Nom_Funcionario\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [4],\n" +
"                \"Columna\": [\"Apellidos\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [5],\n" +
"                \"Columna\": [\"Correo\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [6],\n" +
"                \"Columna\": [\"Cargo\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [7],\n" +
"                \"Columna\": [\"Ip_Sena\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [8],\n" +
"                \"Columna\": [\"Contraseña\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [9],\n" +
"                \"Columna\": [\"Id_Estado\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [10],\n" +
"                \"Columna\": [\"Id_Area_Centro\"]\n" +
"            }],\n" +
"        \"Posicion\": \"18\"\n" +
"    },\n" +
"    \"14_v_titulos\": {\n" +
"        \"TipoT\": \"2\",\n" +
"        \"ColumnasTabla\": [{\n" +
"                \"PosicionColum\": [0],\n" +
"                \"Columna\": [\"Id_P_Virtual\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [1],\n" +
"                \"Columna\": [\"Nom_P_Virtual\"]\n" +
"            }],\n" +
"        \"Posicion\": \"13\"\n" +
"    },\n" +
"    \"03_v_detalles_area\": {\n" +
"        \"TipoT\": \"2\",\n" +
"        \"ColumnasTabla\": [{\n" +
"                \"PosicionColum\": [0],\n" +
"                \"Columna\": [\"Id_Detalles_Area\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [1],\n" +
"                \"Columna\": [\"Id_Area\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [2],\n" +
"                \"Columna\": [\"Nom_Area\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [3],\n" +
"                \"Columna\": [\"Lider_Area\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [4],\n" +
"                \"Columna\": [\"Id_Programa\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [5],\n" +
"                \"Columna\": [\"Nom_Programa\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [6],\n" +
"                \"Columna\": [\"Nivel_Formacion\"]\n" +
"            }],\n" +
"        \"Posicion\": \"2\"\n" +
"    },\n" +
"    \"35_v_estadisticacategoria1\": {\n" +
"        \"TipoT\": \"2\",\n" +
"        \"ColumnasTabla\": [{\n" +
"                \"PosicionColum\": [0],\n" +
"                \"Columna\": [\"Id_Categoria\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [1],\n" +
"                \"Columna\": [\"Nom_Categoria\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [2],\n" +
"                \"Columna\": [\"Id_P_Virtual\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [3],\n" +
"                \"Columna\": [\"Fecha_Publicacion\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [4],\n" +
"                \"Columna\": [\"Id_Centro\"]\n" +
"            }],\n" +
"        \"Posicion\": \"34\"\n" +
"    },\n" +
"    \"area\": {\n" +
"        \"TipoT\": \"1\",\n" +
"        \"ColumnasTabla\": [{\n" +
"                \"PosicionColum\": [0],\n" +
"                \"Columna\": [\"Id_Area\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [1],\n" +
"                \"Columna\": [\"Nom_Area\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [2],\n" +
"                \"Columna\": [\"Lider_Area\"]\n" +
"            }],\n" +
"        \"Posicion\": \"1\"\n" +
"    },\n" +
"    \"08_v_funcionario\": {\n" +
"        \"TipoT\": \"2\",\n" +
"        \"ColumnasTabla\": [{\n" +
"                \"PosicionColum\": [0],\n" +
"                \"Columna\": [\"Id_Rol_Funcionario\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [1],\n" +
"                \"Columna\": [\"Id_Rol\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [2],\n" +
"                \"Columna\": [\"Nom_Rol\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [3],\n" +
"                \"Columna\": [\"Des_Rol\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [4],\n" +
"                \"Columna\": [\"Id_Funcionario\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [5],\n" +
"                \"Columna\": [\"Id_Tipo_Documento\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [6],\n" +
"                \"Columna\": [\"Nom_Tipo_Documento\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [7],\n" +
"                \"Columna\": [\"Num_Documento\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [8],\n" +
"                \"Columna\": [\"Nom_Funcionario\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [9],\n" +
"                \"Columna\": [\"Apellidos\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [10],\n" +
"                \"Columna\": [\"Correo\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [11],\n" +
"                \"Columna\": [\"Cargo\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [12],\n" +
"                \"Columna\": [\"Ip_Sena\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [13],\n" +
"                \"Columna\": [\"Contraseña\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [14],\n" +
"                \"Columna\": [\"Id_Estado\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [15],\n" +
"                \"Columna\": [\"Id_Area_Centro\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [16],\n" +
"                \"Columna\": [\"Id_Centro\"]\n" +
"            }],\n" +
"        \"Posicion\": \"7\"\n" +
"    },\n" +
"    \"29_v_consultaprograma\": {\n" +
"        \"TipoT\": \"2\",\n" +
"        \"ColumnasTabla\": [{\n" +
"                \"PosicionColum\": [0],\n" +
"                \"Columna\": [\"Id_P_Virtual\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [1],\n" +
"                \"Columna\": [\"Nom_P_Virtual\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [2],\n" +
"                \"Columna\": [\"Des_P_Virtual\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [3],\n" +
"                \"Columna\": [\"Id_Formato\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [4],\n" +
"                \"Columna\": [\"Fecha_Publicacion\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [5],\n" +
"                \"Columna\": [\"Id_Funcionario\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [6],\n" +
"                \"Columna\": [\"Id_Programa\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [7],\n" +
"                \"Columna\": [\"Id_Version\"]\n" +
"            }],\n" +
"        \"Posicion\": \"28\"\n" +
"    },\n" +
"    \"31_v_estadisticatipo1\": {\n" +
"        \"TipoT\": \"2\",\n" +
"        \"ColumnasTabla\": [{\n" +
"                \"PosicionColum\": [0],\n" +
"                \"Columna\": [\"Id_Formato\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [1],\n" +
"                \"Columna\": [\"Nom_Formato\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [2],\n" +
"                \"Columna\": [\"Id_P_Virtual\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [3],\n" +
"                \"Columna\": [\"Nom_P_Virtual\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [4],\n" +
"                \"Columna\": [\"Fecha_Publicacion\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [5],\n" +
"                \"Columna\": [\"Id_Centro\"]\n" +
"            }],\n" +
"        \"Posicion\": \"30\"\n" +
"    },\n" +
"    \"32_v_estadisticatipo2\": {\n" +
"        \"TipoT\": \"2\",\n" +
"        \"ColumnasTabla\": [{\n" +
"                \"PosicionColum\": [0],\n" +
"                \"Columna\": [\"Id_Formato\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [1],\n" +
"                \"Columna\": [\"Nom_Formato\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [2],\n" +
"                \"Columna\": [\"Cantidad\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [3],\n" +
"                \"Columna\": [\"Id_Centro\"]\n" +
"            }],\n" +
"        \"Posicion\": \"31\"\n" +
"    },\n" +
"    \"evaluacion_general\": {\n" +
"        \"TipoT\": \"1\",\n" +
"        \"ColumnasTabla\": [{\n" +
"                \"PosicionColum\": [0],\n" +
"                \"Columna\": [\"Id_Evaluacion_General\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [1],\n" +
"                \"Columna\": [\"Fecha_Evaluacion\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [2],\n" +
"                \"Columna\": [\"Observacion\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [3],\n" +
"                \"Columna\": [\"Resultado\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [4],\n" +
"                \"Columna\": [\"Id_Version\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [5],\n" +
"                \"Columna\": [\"Id_Lista_Chequeo\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [6],\n" +
"                \"Columna\": [\"Id_Funcionario\"]\n" +
"            }],\n" +
"        \"Posicion\": \"16\"\n" +
"    },\n" +
"    \"version\": {\n" +
"        \"TipoT\": \"1\",\n" +
"        \"ColumnasTabla\": [{\n" +
"                \"PosicionColum\": [0],\n" +
"                \"Columna\": [\"Id_Version\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [1],\n" +
"                \"Columna\": [\"Fecha_Envio\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [2],\n" +
"                \"Columna\": [\"Fecha_Publicacion\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [3],\n" +
"                \"Columna\": [\"Num_Version\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [4],\n" +
"                \"Columna\": [\"Fecha_Vigencia\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [5],\n" +
"                \"Columna\": [\"Url_Version\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [6],\n" +
"                \"Columna\": [\"Url_Img\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [7],\n" +
"                \"Columna\": [\"Inst_Instalacion\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [8],\n" +
"                \"Columna\": [\"Reqst_Instalacion\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [9],\n" +
"                \"Columna\": [\"Id_P_Virtual\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [10],\n" +
"                \"Columna\": [\"Id_Estado\"]\n" +
"            }],\n" +
"        \"Posicion\": \"32\"\n" +
"    },\n" +
"    \"01_v_detalles_lista\": {\n" +
"        \"TipoT\": \"2\",\n" +
"        \"ColumnasTabla\": [{\n" +
"                \"PosicionColum\": [0],\n" +
"                \"Columna\": [\"Id_Lista_Chequeo\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [1],\n" +
"                \"Columna\": [\"Nom_Lista_Chequeo\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [2],\n" +
"                \"Columna\": [\"Des_Lista_Chequeo\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [3],\n" +
"                \"Columna\": [\"Fecha_Creacion\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [4],\n" +
"                \"Columna\": [\"Id_Funcionario\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [5],\n" +
"                \"Columna\": [\"Id_Item_Lista\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [6],\n" +
"                \"Columna\": [\"Des_Item_Lista\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [7],\n" +
"                \"Columna\": [\"Tipo_Item\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [8],\n" +
"                \"Columna\": [\"Id_Detalles_Lista\"]\n" +
"            }],\n" +
"        \"Posicion\": \"0\"\n" +
"    },\n" +
"    \"autor\": {\n" +
"        \"TipoT\": \"1\",\n" +
"        \"ColumnasTabla\": [{\n" +
"                \"PosicionColum\": [0],\n" +
"                \"Columna\": [\"Id_Autor\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [1],\n" +
"                \"Columna\": [\"Id_Version\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [2],\n" +
"                \"Columna\": [\"Id_Funcionario\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [3],\n" +
"                \"Columna\": [\"Principal\"]\n" +
"            }],\n" +
"        \"Posicion\": \"3\"\n" +
"    },\n" +
"    \"02_v_area_centro\": {\n" +
"        \"TipoT\": \"2\",\n" +
"        \"ColumnasTabla\": [{\n" +
"                \"PosicionColum\": [0],\n" +
"                \"Columna\": [\"Id_Area_Centro\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [1],\n" +
"                \"Columna\": [\"Id_Centro\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [2],\n" +
"                \"Columna\": [\"Num_Centro\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [3],\n" +
"                \"Columna\": [\"Nom_Centro\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [4],\n" +
"                \"Columna\": [\"Direccion\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [5],\n" +
"                \"Columna\": [\"Id_Ciudad\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [6],\n" +
"                \"Columna\": [\"Nom_Ciudad\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [7],\n" +
"                \"Columna\": [\"Id_Area\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [8],\n" +
"                \"Columna\": [\"Nom_Area\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [9],\n" +
"                \"Columna\": [\"Lider_Area\"]\n" +
"            }],\n" +
"        \"Posicion\": \"1\"\n" +
"    },\n" +
"    \"39_v_listacategoria\": {\n" +
"        \"TipoT\": \"2\",\n" +
"        \"ColumnasTabla\": [{\n" +
"                \"PosicionColum\": [0],\n" +
"                \"Columna\": [\"Id_Categoria\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [1],\n" +
"                \"Columna\": [\"Nom_Categoria\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [2],\n" +
"                \"Columna\": [\"Fecha_Creacion\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [3],\n" +
"                \"Columna\": [\"Id_Centro\"]\n" +
"            }],\n" +
"        \"Posicion\": \"38\"\n" +
"    },\n" +
"    \"40_v_evaluaversion\": {\n" +
"        \"TipoT\": \"2\",\n" +
"        \"ColumnasTabla\": [{\n" +
"                \"PosicionColum\": [0],\n" +
"                \"Columna\": [\"Id_Evaluacion_General\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [1],\n" +
"                \"Columna\": [\"Nom_P_Virtual\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [2],\n" +
"                \"Columna\": [\"Num_Version\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [3],\n" +
"                \"Columna\": [\"Id_Version\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [4],\n" +
"                \"Columna\": [\"Url_Version\"]\n" +
"            }],\n" +
"        \"Posicion\": \"39\"\n" +
"    },\n" +
"    \"ciudad\": {\n" +
"        \"TipoT\": \"1\",\n" +
"        \"ColumnasTabla\": [{\n" +
"                \"PosicionColum\": [0],\n" +
"                \"Columna\": [\"Id_Ciudad\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [1],\n" +
"                \"Columna\": [\"Nom_Ciudad\"]\n" +
"            }],\n" +
"        \"Posicion\": \"6\"\n" +
"    },\n" +
"    \"detalles_lista\": {\n" +
"        \"TipoT\": \"1\",\n" +
"        \"ColumnasTabla\": [{\n" +
"                \"PosicionColum\": [0],\n" +
"                \"Columna\": [\"Id_Detalles_Lista\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [1],\n" +
"                \"Columna\": [\"Id_Lista_Chequeo\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [2],\n" +
"                \"Columna\": [\"Id_Item_Lista\"]\n" +
"            }],\n" +
"        \"Posicion\": \"11\"\n" +
"    },\n" +
"    \"rol_funcionario\": {\n" +
"        \"TipoT\": \"1\",\n" +
"        \"ColumnasTabla\": [{\n" +
"                \"PosicionColum\": [0],\n" +
"                \"Columna\": [\"Id_Rol_Funcionario\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [1],\n" +
"                \"Columna\": [\"Id_Rol\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [2],\n" +
"                \"Columna\": [\"Id_Funcionario\"]\n" +
"            }],\n" +
"        \"Posicion\": \"26\"\n" +
"    },\n" +
"    \"26_v_comentarios\": {\n" +
"        \"TipoT\": \"2\",\n" +
"        \"ColumnasTabla\": [{\n" +
"                \"PosicionColum\": [0],\n" +
"                \"Columna\": [\"Id_Comentario\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [1],\n" +
"                \"Columna\": [\"Comentario\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [2],\n" +
"                \"Columna\": [\"Id_Funcionario\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [3],\n" +
"                \"Columna\": [\"Nombre_Completo\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [4],\n" +
"                \"Columna\": [\"Id_Version\"]\n" +
"            }],\n" +
"        \"Posicion\": \"25\"\n" +
"    },\n" +
"    \"09_v_autor\": {\n" +
"        \"TipoT\": \"2\",\n" +
"        \"ColumnasTabla\": [{\n" +
"                \"PosicionColum\": [0],\n" +
"                \"Columna\": [\"Id_Autor\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [1],\n" +
"                \"Columna\": [\"Id_P_Virtual\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [2],\n" +
"                \"Columna\": [\"Nom_P_Virtual\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [3],\n" +
"                \"Columna\": [\"Des_P_Virtual\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [4],\n" +
"                \"Columna\": [\"Palabras_Clave\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [5],\n" +
"                \"Columna\": [\"Id_Formato\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [6],\n" +
"                \"Columna\": [\"Id_Version\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [7],\n" +
"                \"Columna\": [\"Fecha_Envio\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [8],\n" +
"                \"Columna\": [\"Fecha_Publicacion\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [9],\n" +
"                \"Columna\": [\"Num_Version\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [10],\n" +
"                \"Columna\": [\"Fecha_Vigencia\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [11],\n" +
"                \"Columna\": [\"Url_Version\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [12],\n" +
"                \"Columna\": [\"Url_Img\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [13],\n" +
"                \"Columna\": [\"Inst_Instalacion\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [14],\n" +
"                \"Columna\": [\"Reqst_Instalacion\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [15],\n" +
"                \"Columna\": [\"Id_Estado\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [16],\n" +
"                \"Columna\": [\"Nom_Estado\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [17],\n" +
"                \"Columna\": [\"Id_Tipo_Estado\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [18],\n" +
"                \"Columna\": [\"Id_Rol_Funcionario\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [19],\n" +
"                \"Columna\": [\"Id_Rol\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [20],\n" +
"                \"Columna\": [\"Nom_Rol\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [21],\n" +
"                \"Columna\": [\"Des_Rol\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [22],\n" +
"                \"Columna\": [\"Id_Funcionario\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [23],\n" +
"                \"Columna\": [\"Id_Tipo_Documento\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [24],\n" +
"                \"Columna\": [\"Nom_Tipo_Documento\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [25],\n" +
"                \"Columna\": [\"Num_Documento\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [26],\n" +
"                \"Columna\": [\"Nom_Funcionario\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [27],\n" +
"                \"Columna\": [\"Apellidos\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [28],\n" +
"                \"Columna\": [\"Correo\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [29],\n" +
"                \"Columna\": [\"Cargo\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [30],\n" +
"                \"Columna\": [\"Ip_Sena\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [31],\n" +
"                \"Columna\": [\"Contraseña\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [32],\n" +
"                \"Columna\": [\"Id_EstadoFun\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [33],\n" +
"                \"Columna\": [\"Id_Area_Centro\"]\n" +
"            }],\n" +
"        \"Posicion\": \"8\"\n" +
"    },\n" +
"    \"10_habilitar_p\": {\n" +
"        \"TipoT\": \"2\",\n" +
"        \"ColumnasTabla\": [{\n" +
"                \"PosicionColum\": [0],\n" +
"                \"Columna\": [\"Id_Version\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [1],\n" +
"                \"Columna\": [\"Nom_P_Virtual\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [2],\n" +
"                \"Columna\": [\"Num_Version\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [3],\n" +
"                \"Columna\": [\"Fecha_Vigencia\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [4],\n" +
"                \"Columna\": [\"Id_Centro\"]\n" +
"            }],\n" +
"        \"Posicion\": \"9\"\n" +
"    },\n" +
"    \"tipo_notificacion\": {\n" +
"        \"TipoT\": \"1\",\n" +
"        \"ColumnasTabla\": [{\n" +
"                \"PosicionColum\": [0],\n" +
"                \"Columna\": [\"Id_Tipo_Notificacion\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [1],\n" +
"                \"Columna\": [\"Nom_Tipo_Notif\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [2],\n" +
"                \"Columna\": [\"Des_Tipo_Notif\"]\n" +
"            }],\n" +
"        \"Posicion\": \"30\"\n" +
"    },\n" +
"    \"20_v_login\": {\n" +
"        \"TipoT\": \"2\",\n" +
"        \"ColumnasTabla\": [{\n" +
"                \"PosicionColum\": [0],\n" +
"                \"Columna\": [\"Id_Rol\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [1],\n" +
"                \"Columna\": [\"Id_Funcionario\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [2],\n" +
"                \"Columna\": [\"Nom_Funcionario\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [3],\n" +
"                \"Columna\": [\"Id_Centro\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [4],\n" +
"                \"Columna\": [\"Num_Documento\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [5],\n" +
"                \"Columna\": [\"Contraseña\"]\n" +
"            }],\n" +
"        \"Posicion\": \"19\"\n" +
"    },\n" +
"    \"19_v_temasformacion\": {\n" +
"        \"TipoT\": \"2\",\n" +
"        \"ColumnasTabla\": [{\n" +
"                \"PosicionColum\": [0],\n" +
"                \"Columna\": [\"Id_Tema\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [1],\n" +
"                \"Columna\": [\"Nom_Tema\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [2],\n" +
"                \"Columna\": [\"Id_Centro\"]\n" +
"            }],\n" +
"        \"Posicion\": \"18\"\n" +
"    },\n" +
"    \"rankin\": {\n" +
"        \"TipoT\": \"1\",\n" +
"        \"ColumnasTabla\": [{\n" +
"                \"PosicionColum\": [0],\n" +
"                \"Columna\": [\"Id_Rankin\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [1],\n" +
"                \"Columna\": [\"Puesto\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [2],\n" +
"                \"Columna\": [\"Num_Visitas\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [3],\n" +
"                \"Columna\": [\"Num_Descargas\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [4],\n" +
"                \"Columna\": [\"Cant_5\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [5],\n" +
"                \"Columna\": [\"Cant_4\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [6],\n" +
"                \"Columna\": [\"Cant_3\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [7],\n" +
"                \"Columna\": [\"Cant_2\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [8],\n" +
"                \"Columna\": [\"Cant_1\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [9],\n" +
"                \"Columna\": [\"Numero_Votos\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [10],\n" +
"                \"Columna\": [\"Id_Version\"]\n" +
"            }],\n" +
"        \"Posicion\": \"24\"\n" +
"    },\n" +
"    \"formato\": {\n" +
"        \"TipoT\": \"1\",\n" +
"        \"ColumnasTabla\": [{\n" +
"                \"PosicionColum\": [0],\n" +
"                \"Columna\": [\"Id_Formato\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [1],\n" +
"                \"Columna\": [\"Nom_Formato\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [2],\n" +
"                \"Columna\": [\"Des_Formato\"]\n" +
"            }],\n" +
"        \"Posicion\": \"17\"\n" +
"    },\n" +
"    \"admin\": {\n" +
"        \"TipoT\": \"1\",\n" +
"        \"ColumnasTabla\": [{\n" +
"                \"PosicionColum\": [0],\n" +
"                \"Columna\": [\"Usuario\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [1],\n" +
"                \"Columna\": [\"Clave\"]\n" +
"            }],\n" +
"        \"Posicion\": \"0\"\n" +
"    },\n" +
"    \"detalles_evaluacion\": {\n" +
"        \"TipoT\": \"1\",\n" +
"        \"ColumnasTabla\": [{\n" +
"                \"PosicionColum\": [0],\n" +
"                \"Columna\": [\"Id_Detalles_Evaluacion\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [1],\n" +
"                \"Columna\": [\"Valorizacion\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [2],\n" +
"                \"Columna\": [\"Observacion\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [3],\n" +
"                \"Columna\": [\"Id_Detalles_Lista\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [4],\n" +
"                \"Columna\": [\"Id_Evaluacion_General\"]\n" +
"            }],\n" +
"        \"Posicion\": \"10\"\n" +
"    },\n" +
"    \"rol\": {\n" +
"        \"TipoT\": \"1\",\n" +
"        \"ColumnasTabla\": [{\n" +
"                \"PosicionColum\": [0],\n" +
"                \"Columna\": [\"Id_Rol\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [1],\n" +
"                \"Columna\": [\"Nom_Rol\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [2],\n" +
"                \"Columna\": [\"Des_Rol\"]\n" +
"            }],\n" +
"        \"Posicion\": \"25\"\n" +
"    },\n" +
"    \"11_v_area\": {\n" +
"        \"TipoT\": \"2\",\n" +
"        \"ColumnasTabla\": [{\n" +
"                \"PosicionColum\": [0],\n" +
"                \"Columna\": [\"Id_Area\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [1],\n" +
"                \"Columna\": [\"Nom_Area\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [2],\n" +
"                \"Columna\": [\"Id_Centro\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [3],\n" +
"                \"Columna\": [\"Nom_Centro\"]\n" +
"            }],\n" +
"        \"Posicion\": \"10\"\n" +
"    },\n" +
"    \"detalles_tema\": {\n" +
"        \"TipoT\": \"1\",\n" +
"        \"ColumnasTabla\": [{\n" +
"                \"PosicionColum\": [0],\n" +
"                \"Columna\": [\"Id_Detalles_Tema\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [1],\n" +
"                \"Columna\": [\"Id_Tema\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [2],\n" +
"                \"Columna\": [\"Id_P_Virtual\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [3],\n" +
"                \"Columna\": [\"Tipo_Tema\"]\n" +
"            }],\n" +
"        \"Posicion\": \"14\"\n" +
"    },\n" +
"    \"centro\": {\n" +
"        \"TipoT\": \"1\",\n" +
"        \"ColumnasTabla\": [{\n" +
"                \"PosicionColum\": [0],\n" +
"                \"Columna\": [\"Id_Centro\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [1],\n" +
"                \"Columna\": [\"Num_Centro\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [2],\n" +
"                \"Columna\": [\"Nom_Centro\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [3],\n" +
"                \"Columna\": [\"Direccion\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [4],\n" +
"                \"Columna\": [\"Id_Ciudad\"]\n" +
"            }],\n" +
"        \"Posicion\": \"5\"\n" +
"    },\n" +
"    \"lista_chequeo\": {\n" +
"        \"TipoT\": \"1\",\n" +
"        \"ColumnasTabla\": [{\n" +
"                \"PosicionColum\": [0],\n" +
"                \"Columna\": [\"Id_Lista_Chequeo\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [1],\n" +
"                \"Columna\": [\"Nom_Lista_Chequeo\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [2],\n" +
"                \"Columna\": [\"Des_Lista_Chequeo\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [3],\n" +
"                \"Columna\": [\"Fecha_Creacion\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [4],\n" +
"                \"Columna\": [\"Id_Funcionario\"]\n" +
"            }],\n" +
"        \"Posicion\": \"20\"\n" +
"    },\n" +
"    \"06_v_detalles_tema\": {\n" +
"        \"TipoT\": \"2\",\n" +
"        \"ColumnasTabla\": [{\n" +
"                \"PosicionColum\": [0],\n" +
"                \"Columna\": [\"Id_P_Virtual\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [1],\n" +
"                \"Columna\": [\"Nom_P_Virtual\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [2],\n" +
"                \"Columna\": [\"Des_P_Virtual\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [3],\n" +
"                \"Columna\": [\"Palabras_Clave\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [4],\n" +
"                \"Columna\": [\"Id_Formato\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [5],\n" +
"                \"Columna\": [\"Nom_Formato\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [6],\n" +
"                \"Columna\": [\"Des_Formato\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [7],\n" +
"                \"Columna\": [\"Id_Detalles_Tema\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [8],\n" +
"                \"Columna\": [\"Id_Tema\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [9],\n" +
"                \"Columna\": [\"Nom_Tema\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [10],\n" +
"                \"Columna\": [\"Des_Tema\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [11],\n" +
"                \"Columna\": [\"Tipo_Tema\"]\n" +
"            }],\n" +
"        \"Posicion\": \"5\"\n" +
"    },\n" +
"    \"12_inabilitar_funcionario\": {\n" +
"        \"TipoT\": \"2\",\n" +
"        \"ColumnasTabla\": [{\n" +
"                \"PosicionColum\": [0],\n" +
"                \"Columna\": [\"Id_Funcionario\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [1],\n" +
"                \"Columna\": [\"NombreCompleto\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [2],\n" +
"                \"Columna\": [\"Ip_Sena\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [3],\n" +
"                \"Columna\": [\"Cargo\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [4],\n" +
"                \"Columna\": [\"Nom_Rol\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [5],\n" +
"                \"Columna\": [\"Nom_Estado\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [6],\n" +
"                \"Columna\": [\"Nom_Area\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [7],\n" +
"                \"Columna\": [\"Nom_Centro\"]\n" +
"            }],\n" +
"        \"Posicion\": \"11\"\n" +
"    },\n" +
"    \"producto_virtual\": {\n" +
"        \"TipoT\": \"1\",\n" +
"        \"ColumnasTabla\": [{\n" +
"                \"PosicionColum\": [0],\n" +
"                \"Columna\": [\"Id_P_Virtual\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [1],\n" +
"                \"Columna\": [\"Nom_P_Virtual\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [2],\n" +
"                \"Columna\": [\"Des_P_Virtual\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [3],\n" +
"                \"Columna\": [\"Palabras_Clave\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [4],\n" +
"                \"Columna\": [\"Id_Formato\"]\n" +
"            }],\n" +
"        \"Posicion\": \"22\"\n" +
"    },\n" +
"    \"34_v_estadisticaarea2\": {\n" +
"        \"TipoT\": \"2\",\n" +
"        \"ColumnasTabla\": [{\n" +
"                \"PosicionColum\": [0],\n" +
"                \"Columna\": [\"Id_Area\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [1],\n" +
"                \"Columna\": [\"Nom_Area\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [2],\n" +
"                \"Columna\": [\"Cantidad\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [3],\n" +
"                \"Columna\": [\"Id_Centro\"]\n" +
"            }],\n" +
"        \"Posicion\": \"33\"\n" +
"    },\n" +
"    \"27_v_autores\": {\n" +
"        \"TipoT\": \"2\",\n" +
"        \"ColumnasTabla\": [{\n" +
"                \"PosicionColum\": [0],\n" +
"                \"Columna\": [\"Id_Funcionario\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [1],\n" +
"                \"Columna\": [\"NombreCompleto\"]\n" +
"            }],\n" +
"        \"Posicion\": \"26\"\n" +
"    },\n" +
"    \"33_v_estadisticaarea1\": {\n" +
"        \"TipoT\": \"2\",\n" +
"        \"ColumnasTabla\": [{\n" +
"                \"PosicionColum\": [0],\n" +
"                \"Columna\": [\"Id_Area\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [1],\n" +
"                \"Columna\": [\"Nom_Area\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [2],\n" +
"                \"Columna\": [\"Id_P_Virtual\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [3],\n" +
"                \"Columna\": [\"Nom_P_Virtual\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [4],\n" +
"                \"Columna\": [\"Fecha_Publicacion\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [5],\n" +
"                \"Columna\": [\"Id_Centro\"]\n" +
"            }],\n" +
"        \"Posicion\": \"32\"\n" +
"    },\n" +
"    \"13_v_listas_chequeo\": {\n" +
"        \"TipoT\": \"2\",\n" +
"        \"ColumnasTabla\": [{\n" +
"                \"PosicionColum\": [0],\n" +
"                \"Columna\": [\"Id_Lista_Chequeo\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [1],\n" +
"                \"Columna\": [\"Nom_Lista_Chequeo\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [2],\n" +
"                \"Columna\": [\"Des_Lista_Chequeo\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [3],\n" +
"                \"Columna\": [\"Fecha_Creacion\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [4],\n" +
"                \"Columna\": [\"Id_Funcionario\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [5],\n" +
"                \"Columna\": [\"Id_Rol\"]\n" +
"            }],\n" +
"        \"Posicion\": \"12\"\n" +
"    },\n" +
"    \"categoria\": {\n" +
"        \"TipoT\": \"1\",\n" +
"        \"ColumnasTabla\": [{\n" +
"                \"PosicionColum\": [0],\n" +
"                \"Columna\": [\"Id_Categoria\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [1],\n" +
"                \"Columna\": [\"Nom_Categoria\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [2],\n" +
"                \"Columna\": [\"Des_Categoria\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [3],\n" +
"                \"Columna\": [\"Fecha_Creacion\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [4],\n" +
"                \"Columna\": [\"Id_Funcionario\"]\n" +
"            }],\n" +
"        \"Posicion\": \"4\"\n" +
"    },\n" +
"    \"detalles_programa\": {\n" +
"        \"TipoT\": \"1\",\n" +
"        \"ColumnasTabla\": [{\n" +
"                \"PosicionColum\": [0],\n" +
"                \"Columna\": [\"Id_Detalles_Programa\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [1],\n" +
"                \"Columna\": [\"Id_Tema\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [2],\n" +
"                \"Columna\": [\"Id_Programa\"]\n" +
"            }],\n" +
"        \"Posicion\": \"13\"\n" +
"    },\n" +
"    \"item_lista\": {\n" +
"        \"TipoT\": \"1\",\n" +
"        \"ColumnasTabla\": [{\n" +
"                \"PosicionColum\": [0],\n" +
"                \"Columna\": [\"Id_Item_Lista\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [1],\n" +
"                \"Columna\": [\"Des_Item_Lista\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [2],\n" +
"                \"Columna\": [\"Tipo_Item\"]\n" +
"            }],\n" +
"        \"Posicion\": \"19\"\n" +
"    },\n" +
"    \"comentario\": {\n" +
"        \"TipoT\": \"1\",\n" +
"        \"ColumnasTabla\": [{\n" +
"                \"PosicionColum\": [0],\n" +
"                \"Columna\": [\"Id_Comentario\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [1],\n" +
"                \"Columna\": [\"Comentario\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [2],\n" +
"                \"Columna\": [\"Id_Funcionario\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [3],\n" +
"                \"Columna\": [\"Id_Version\"]\n" +
"            }],\n" +
"        \"Posicion\": \"7\"\n" +
"    },\n" +
"    \"detalles_categoria\": {\n" +
"        \"TipoT\": \"1\",\n" +
"        \"ColumnasTabla\": [{\n" +
"                \"PosicionColum\": [0],\n" +
"                \"Columna\": [\"Id_Detalles_Categoria\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [1],\n" +
"                \"Columna\": [\"Id_Categoria\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [2],\n" +
"                \"Columna\": [\"Id_Tema\"]\n" +
"            }],\n" +
"        \"Posicion\": \"9\"\n" +
"    },\n" +
"    \"37_v_evaluaciongeneral\": {\n" +
"        \"TipoT\": \"2\",\n" +
"        \"ColumnasTabla\": [{\n" +
"                \"PosicionColum\": [0],\n" +
"                \"Columna\": [\"Id_Evaluacion_General\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [1],\n" +
"                \"Columna\": [\"Id_Lista_Chequeo\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [2],\n" +
"                \"Columna\": [\"Nom_Lista_Chequeo\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [3],\n" +
"                \"Columna\": [\"Valorizacion\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [4],\n" +
"                \"Columna\": [\"Observacion\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [5],\n" +
"                \"Columna\": [\"Id_Item_Lista\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [6],\n" +
"                \"Columna\": [\"Des_Item_Lista\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [7],\n" +
"                \"Columna\": [\"Observacion_General\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [8],\n" +
"                \"Columna\": [\"Resultado\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [9],\n" +
"                \"Columna\": [\"Fecha_Evaluacion\"]\n" +
"            }],\n" +
"        \"Posicion\": \"36\"\n" +
"    },\n" +
"    \"notificacion\": {\n" +
"        \"TipoT\": \"1\",\n" +
"        \"ColumnasTabla\": [{\n" +
"                \"PosicionColum\": [0],\n" +
"                \"Columna\": [\"Id_Notificacion\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [1],\n" +
"                \"Columna\": [\"Fecha_Envio\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [2],\n" +
"                \"Columna\": [\"Conte_Notificacion\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [3],\n" +
"                \"Columna\": [\"Ides_Proceso\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [4],\n" +
"                \"Columna\": [\"Id_Tipo_Notificacion\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [5],\n" +
"                \"Columna\": [\"Id_Funcionario\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [6],\n" +
"                \"Columna\": [\"Estado\"]\n" +
"            }],\n" +
"        \"Posicion\": \"21\"\n" +
"    },\n" +
"    \"15_v_subir_autores\": {\n" +
"        \"TipoT\": \"2\",\n" +
"        \"ColumnasTabla\": [{\n" +
"                \"PosicionColum\": [0],\n" +
"                \"Columna\": [\"Id_Funcionario\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [1],\n" +
"                \"Columna\": [\"Nom_Funcionario\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [2],\n" +
"                \"Columna\": [\"Id_Centro\"]\n" +
"            }],\n" +
"        \"Posicion\": \"14\"\n" +
"    },\n" +
"    \"tema\": {\n" +
"        \"TipoT\": \"1\",\n" +
"        \"ColumnasTabla\": [{\n" +
"                \"PosicionColum\": [0],\n" +
"                \"Columna\": [\"Id_Tema\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [1],\n" +
"                \"Columna\": [\"Nom_Tema\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [2],\n" +
"                \"Columna\": [\"Des_Tema\"]\n" +
"            }],\n" +
"        \"Posicion\": \"27\"\n" +
"    },\n" +
"    \"tipo_documento\": {\n" +
"        \"TipoT\": \"1\",\n" +
"        \"ColumnasTabla\": [{\n" +
"                \"PosicionColum\": [0],\n" +
"                \"Columna\": [\"Id_Tipo_Documento\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [1],\n" +
"                \"Columna\": [\"Nom_Tipo_Documento\"]\n" +
"            }],\n" +
"        \"Posicion\": \"28\"\n" +
"    },\n" +
"    \"tipo_estado\": {\n" +
"        \"TipoT\": \"1\",\n" +
"        \"ColumnasTabla\": [{\n" +
"                \"PosicionColum\": [0],\n" +
"                \"Columna\": [\"Id_Tipo_Estado\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [1],\n" +
"                \"Columna\": [\"Nom_Tipo_Estado\"]\n" +
"            }],\n" +
"        \"Posicion\": \"29\"\n" +
"    },\n" +
"    \"21_v_asignarrol\": {\n" +
"        \"TipoT\": \"2\",\n" +
"        \"ColumnasTabla\": [{\n" +
"                \"PosicionColum\": [0],\n" +
"                \"Columna\": [\"Id_Funcionario\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [1],\n" +
"                \"Columna\": [\"NombreCompleto\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [2],\n" +
"                \"Columna\": [\"Cargo\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [3],\n" +
"                \"Columna\": [\"Id_Centro\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [4],\n" +
"                \"Columna\": [\"Nom_Centro\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [5],\n" +
"                \"Columna\": [\"Id_Area\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [6],\n" +
"                \"Columna\": [\"Nom_Area\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [7],\n" +
"                \"Columna\": [\"Id_Ciudad\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [8],\n" +
"                \"Columna\": [\"Nom_Ciudad\"]\n" +
"            }],\n" +
"        \"Posicion\": \"20\"\n" +
"    },\n" +
"    \"24_v_toquen\": {\n" +
"        \"TipoT\": \"2\",\n" +
"        \"ColumnasTabla\": [{\n" +
"                \"PosicionColum\": [0],\n" +
"                \"Columna\": [\"Numero_Toquen\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [1],\n" +
"                \"Columna\": [\"Funcionario\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [2],\n" +
"                \"Columna\": [\"FechaVigencia\"]\n" +
"            }],\n" +
"        \"Posicion\": \"23\"\n" +
"    },\n" +
"    \"25_v_evaluarproductosv\": {\n" +
"        \"TipoT\": \"2\",\n" +
"        \"ColumnasTabla\": [{\n" +
"                \"PosicionColum\": [0],\n" +
"                \"Columna\": [\"Id_Funcionario\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [1],\n" +
"                \"Columna\": [\"Nom_Funcionario\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [2],\n" +
"                \"Columna\": [\"Id_Rol\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [3],\n" +
"                \"Columna\": [\"Nom_Rol\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [4],\n" +
"                \"Columna\": [\"Id_Notificacion\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [5],\n" +
"                \"Columna\": [\"Fecha_Envio\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [6],\n" +
"                \"Columna\": [\"Conte_Notificacion\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [7],\n" +
"                \"Columna\": [\"Ides_Proceso\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [8],\n" +
"                \"Columna\": [\"Id_FuncionarioEnvio\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [9],\n" +
"                \"Columna\": [\"Estado\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [10],\n" +
"                \"Columna\": [\"Id_Centro\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [11],\n" +
"                \"Columna\": [\"Id_Tipo_Notificacion\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [12],\n" +
"                \"Columna\": [\"Url_Version\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [13],\n" +
"                \"Columna\": [\"Producto\"]\n" +
"            }],\n" +
"        \"Posicion\": \"24\"\n" +
"    },\n" +
"    \"30_v_consultanormal\": {\n" +
"        \"TipoT\": \"2\",\n" +
"        \"ColumnasTabla\": [{\n" +
"                \"PosicionColum\": [0],\n" +
"                \"Columna\": [\"Id_P_Virtual\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [1],\n" +
"                \"Columna\": [\"Nom_P_Virtual\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [2],\n" +
"                \"Columna\": [\"Des_P_Virtual\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [3],\n" +
"                \"Columna\": [\"Palabras_Clave\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [4],\n" +
"                \"Columna\": [\"Fecha_Publicacion\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [5],\n" +
"                \"Columna\": [\"Id_Version\"]\n" +
"            }],\n" +
"        \"Posicion\": \"29\"\n" +
"    },\n" +
"    \"04_v_detalles_programa\": {\n" +
"        \"TipoT\": \"2\",\n" +
"        \"ColumnasTabla\": [{\n" +
"                \"PosicionColum\": [0],\n" +
"                \"Columna\": [\"Id_Detalles_Programa\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [1],\n" +
"                \"Columna\": [\"Id_Programa\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [2],\n" +
"                \"Columna\": [\"Nom_Programa\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [3],\n" +
"                \"Columna\": [\"Nivel_Formacion\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [4],\n" +
"                \"Columna\": [\"Id_Tema\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [5],\n" +
"                \"Columna\": [\"Nom_Tema\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [6],\n" +
"                \"Columna\": [\"Des_Tema\"]\n" +
"            }],\n" +
"        \"Posicion\": \"3\"\n" +
"    },\n" +
"    \"18_v_notificaciones\": {\n" +
"        \"TipoT\": \"2\",\n" +
"        \"ColumnasTabla\": [{\n" +
"                \"PosicionColum\": [0],\n" +
"                \"Columna\": [\"Id_Funcionario\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [1],\n" +
"                \"Columna\": [\"Nom_Funcionario\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [2],\n" +
"                \"Columna\": [\"Id_Rol\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [3],\n" +
"                \"Columna\": [\"Nom_Rol\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [4],\n" +
"                \"Columna\": [\"Id_Notificacion\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [5],\n" +
"                \"Columna\": [\"Fecha_Envio\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [6],\n" +
"                \"Columna\": [\"Conte_Notificacion\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [7],\n" +
"                \"Columna\": [\"Ides_Proceso\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [8],\n" +
"                \"Columna\": [\"Id_FuncionarioEnvio\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [9],\n" +
"                \"Columna\": [\"Estado\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [10],\n" +
"                \"Columna\": [\"Id_Centro\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [11],\n" +
"                \"Columna\": [\"Id_Tipo_Notificacion\"]\n" +
"            }],\n" +
"        \"Posicion\": \"17\"\n" +
"    },\n" +
"    \"05_v_detalles_categoria\": {\n" +
"        \"TipoT\": \"2\",\n" +
"        \"ColumnasTabla\": [{\n" +
"                \"PosicionColum\": [0],\n" +
"                \"Columna\": [\"Id_Categoria\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [1],\n" +
"                \"Columna\": [\"Nom_Categoria\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [2],\n" +
"                \"Columna\": [\"Des_Categoria\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [3],\n" +
"                \"Columna\": [\"Fecha_Creacion\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [4],\n" +
"                \"Columna\": [\"Id_Funcionario\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [5],\n" +
"                \"Columna\": [\"Id_Detalles_Categoria\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [6],\n" +
"                \"Columna\": [\"Id_Tema\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [7],\n" +
"                \"Columna\": [\"Nom_Tema\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [8],\n" +
"                \"Columna\": [\"Des_Tema\"]\n" +
"            }],\n" +
"        \"Posicion\": \"4\"\n" +
"    },\n" +
"    \"23_v_consultar\": {\n" +
"        \"TipoT\": \"2\",\n" +
"        \"ColumnasTabla\": [{\n" +
"                \"PosicionColum\": [0],\n" +
"                \"Columna\": [\"Id_P_Virtual\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [1],\n" +
"                \"Columna\": [\"Nom_P_Virtual\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [2],\n" +
"                \"Columna\": [\"Des_P_Virtual\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [3],\n" +
"                \"Columna\": [\"Palabras_Clave\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [4],\n" +
"                \"Columna\": [\"Fecha_Publicacion\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [5],\n" +
"                \"Columna\": [\"Fecha_Vigencia\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [6],\n" +
"                \"Columna\": [\"Inst_Instalacion\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [7],\n" +
"                \"Columna\": [\"Reqst_Instalacion\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [8],\n" +
"                \"Columna\": [\"Url_Version\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [9],\n" +
"                \"Columna\": [\"Id_Version\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [10],\n" +
"                \"Columna\": [\"Num_Version\"]\n" +
"            }],\n" +
"        \"Posicion\": \"22\"\n" +
"    },\n" +
"    \"22_v_autor_simple\": {\n" +
"        \"TipoT\": \"2\",\n" +
"        \"ColumnasTabla\": [{\n" +
"                \"PosicionColum\": [0],\n" +
"                \"Columna\": [\"Id_Funcionario\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [1],\n" +
"                \"Columna\": [\"NombreCompleto\"]\n" +
"            }, {\n" +
"                \"PosicionColum\": [2],\n" +
"                \"Columna\": [\"Id_Version\"]\n" +
"            }],\n" +
"        \"Posicion\": \"21\"\n" +
"    }\n" +
"}";
    
}

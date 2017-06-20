<div id="ContenedoraBody">
  <link rel="stylesheet" type="text/css" href="css/multi-select.css">
  <link href="assets/css/estilo_1.css" rel="stylesheet" type="text/css"/>
  <div class="content">
      <div class="container-fluid">
          <div class="row">
              <div class="col-md-12">
                  <section class="col-md-12">
                      <article class="col-md-6">
                          <form id="AgregarCate" class="col-md-12">
                              <div class="col-md-12">
                                  <label   style="color:#60B359;">Crear Categor�a </label>
                              </div>
                              <div class="col-md-12">
                                  <label for="NombreCategoria" >Nombre de la Categor�a:</label>
                              </div>
                              <div class="col-md-12"><input type="text" class="form-control inputsC" id="NombreCategoria" placeholder=" Digite Nombre de la categor�a"></div>
                              <label for="DescripcionCategoria" class="col-md-12">Descripci�n de la Categor�a:</label>
                              <div class="col-md-12"><input type="text" class="form-control inputsC" id="DescripcionCategoria" placeholder="Digite Nombre de la descripci�n"></div>
                          </form>
                      </article>
                      <article class="col-md-6">
                          <form class="col-md-12" id="agregarTema">
                              <div class="col-md-12">
                                  <label style="color: #60B359;">Crear Tema</label>
                              </div>
                              <label for="NombreTema" class="col-md-12">Nombre del tema:</label>
                              <input type="text" class="form-control inputs" id="NombreTema" placeholder="Digite Nombre del Tema">
                              <label for="DescripcionCategoria" class="col-md-12">Descripci�n del Tema:</label>
                              <input type="text" class="form-control inputs" id="DescripcionTema" placeholder="Digite Descripci�n del Tema">
                              <button type="button" id="btnTema" class="btn btn-info">Guardar Tema</button>
                          </form>
                      </article>
                      <article class="col-md-6">
                          <div id="SelectTemasDiv" class="col-md-12">
                              <label for="itemCategoria">Temas de la Categor�a</label>
                              <div>
                                  <select required  id="itemCategoria" class="itemCategorias"  multiple='multiple' title="Busca una categoria.." >
                                      <option value="A0">Null</option>
                                  </select>
                              </div>
                          </div>
                          <div class="col-md-12">
                              <button type="button" id="btnCategoria" class="btn btn-info">Guardar categor�a</button>
                          </div>
                      </article>
                  </section>
              </div>

          </div>
      </div>
  </div>
  <script type="text/javascript" src="js/jquery.multi-select.js"></script></script>
  <script type="text/javascript" src="js/jquery.quicksearch.js"></script></script>
  <script type="text/javascript" src="js/notify.js"></script>
  <script type="text/javascript" src="coordinador/Categorias/js/categorias.js"></script>
</div>

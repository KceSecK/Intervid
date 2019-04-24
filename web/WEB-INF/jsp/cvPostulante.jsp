<%-- 
    Document   : cvPostulante
    Created on : abr 22, 2019, 6:19:48 p.m.
    Author     : Saitam
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title> 
        <link rel="stylesheet" href="css/stylesheet.css" type="text/css" charset="utf-8" />
        <link href="css/custom.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
    </head>


    <body>

        <!-- Navbar-->
        <nav class="navbar navbar-expand-sm colorbg sticky-top">
            <div class="container">
                <!-- Logo -->
                <a class="navbar-brand img-fluid" href="index.htm">
                    <img id="logo" src="img/letra 5mm.png" alt="InterVid">
                </a>
                <!--             Toggle icon 
                            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
                                <img src="img/Menu_32.png">
                            </button>-->
                <div class="ml-5 collapse navbar-collapse" id="collapsibleNavbar">
                    <ul class="navbar-nav ml-auto">
                        <li class="nav-item">
                            <a class="alink nav-link border-link" href="index.html">Inicio</a>
                        </li>

                        <li class="nav-item">
                            <a class="alink nav-link border-link" href="productos.html">Productos e é</a>
                        </li>
                        <li class="nav-item">
                            <a class="alink nav-link border-link" href="nosotros.html">Sobre Nosotros</a>
                        </li>
                        <li class="nav-item">
                            <a class="alink nav-link border-link" href="contacto.php">Contáctanos</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>



        <div class="container-fluid">
            <div class="row flex-xl-nowrap">
                <!--Lado Derecho-->
                <div class="col-12 col-md-3 col-xl-2 height100 perfil">
                    <div class="container ">
                        One of three columns
                    </div>
                </div>
                <!--Lado Izquierdo-->

                <div class="col-12 col-md-9 col-xl-8 py-md-3 pl-md-5 ">

                    <div class="container">

                        <!--Primer cuadro-->
                        <div class="row mt-2"><p class="letraMediaPerfil">Mi CV</p></div>
                        
                            <div class="card col-lg-12 ">
                                <div class="card-body ">
                                   
                                        
               <div class="container">
               <div class="row">
               <div class="col-sm-3 col-md-2">
			<div class="progress" data-percentage="20">
				<span class="progress-left">
					<span class="progress-bar"></span>
				</span>
				<span class="progress-right">
					<span class="progress-bar"></span>
				</span>
				<div class="progress-value">
					<div>
						20%<br>
						<span>completed</span>
					</div>
				</div>
			</div>
			</div>
			</div>
		</div>
		
                                        
              
                                </div>
                            </div>
                      

                        
                        <!--Segundo cuadro-->
                        <div class="row mt-2"><p class="letraMediaPerfil">Datos Personales</p></div>


                        <div class="card col-md-9">
                            <div class="card-body ">

                                <div class="col-lg-9">
                                    <div class="container">


                                        <form method="POST"> 
                                            <div class="form-group ">
                                                <label class="col-form-label text-intervid">Nombre(s):</label>

                                                <input type="text"  name="nombre" class="form-control">

                                            </div>
                                            <div class="form-group">
                                                <label class="text-intervid">Apellido(s):</label><input type="text" name="apellido" class="form-control">
                                            </div>

                                            <div class="form-row">
                                                <div class="form-group">
                                                    <label class="text-intervid">Género:</label>
                                                    <div class="form-check form-check-inline">
                                                        <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio1" value="option1">
                                                        <label class="form-check-label" for="inlineRadio1">Masculino</label>
                                                    </div>
                                                    <div class="form-check form-check-inline">
                                                        <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio2" value="option2">
                                                        <label class="form-check-label" for="inlineRadio2">Femenino</label>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="form-row">

                                                <label class="text-intervid">Nacionalidad</label>
                                                <select name="" class="form-control">
                                                    <option selected>Cosa</option>
                                                </select>
                                            </div>

                                            <div class="form-row">

                                                <label class="text-intervid">Tipo de Identificación</label>
                                                <div class="col-md-3"></div>
                                                <div class="form-group col-md-6">

                                                    <select name="" class="form-control">
                                                        <option selected>Cosa</option>
                                                    </select>
                                                </div>
                                                <div class="form-group col-md-6">
                                                    <input type="text" name="identificacion" class="form-control">
                                                </div>

                                            </div>

                                            <div class="form-row">

                                                <label class="text-intervid">Fecha de nacimiento</label>
                                                <div class="col-md-6"></div>
                                                <div class="form-group col-md-3">
                                                    <select name="" class="form-control">
                                                        <option selected>Dia</option>
                                                    </select>
                                                </div>
                                                <div class="form-group col-md-6">
                                                    <select name="" class="form-control">
                                                        <option selected>Mes</option>
                                                    </select>
                                                </div>
                                                <div class="form-group col-md-3">
                                                    <select name="" class="form-control">
                                                        <option selected>Año</option>
                                                    </select>
                                                </div>

                                            </div>

                                            <div class="form-row ">
                                                <label class="col-form-label text-intervid">Estado Civil:</label>
                                                <div class="col-md-6"></div>
                                                <div class="form-group col-md-8">
                                                    <select name="" class="form-control ">
                                                        <option selected>Terrible solo</option>
                                                    </select>
                                                </div>
                                                <div class="form-check col-md-4">

                                                    <div class="form-check"><input class="form-check-input" type="checkbox" id="gridCheck">
                                                        Mostrar en CV
                                                    </div>
                                                </div>
                                            </div>


                                            <div class="form-row">
                                                <!--licencias a--> 
                                                <label class="col-form-label text-intervid">Licencia de Conducir:</label>
                                                <div class="col-md-6"></div>
                                                <div class="form-group col-lg-12">


                                                    <div class="form-check form-check-inline">
                                                        <input class="form-check-input" type="checkbox" id="inlineCheckbox1" value="option1">
                                                        <label class="form-check-label" for="inlineCheckbox1">A1</label>
                                                    </div>
                                                    <div class="form-check form-check-inline">
                                                        <input class="form-check-input" type="checkbox" id="inlineCheckbox2" value="option2">
                                                        <label class="form-check-label" for="inlineCheckbox2">A2</label>
                                                    </div>
                                                    <div class="form-check form-check-inline">
                                                        <input class="form-check-input" type="checkbox" id="inlineCheckbox2" value="option2">
                                                        <label class="form-check-label" for="inlineCheckbox2">A3</label>
                                                    </div>

                                                    <div class="form-check form-check-inline">
                                                        <input class="form-check-input" type="checkbox" id="inlineCheckbox2" value="option2">
                                                        <label class="form-check-label" for="inlineCheckbox2">A4</label>
                                                    </div>

                                                    <div class="form-check form-check-inline">
                                                        <input class="form-check-input" type="checkbox" id="inlineCheckbox2" value="option2">
                                                        <label class="form-check-label" for="inlineCheckbox2">A5</label>
                                                    </div>
                                                </div>
                                                <!--licencias b-->
                                                <div class="form-group col-lg-12">



                                                    <div class="form-check form-check-inline">
                                                        <input class="form-check-input" type="checkbox" id="inlineCheckbox1" value="option1">
                                                        <label class="form-check-label" for="inlineCheckbox1">B</label>
                                                    </div>
                                                    <div class="form-check form-check-inline">
                                                        <input class="form-check-input" type="checkbox" id="inlineCheckbox2" value="option2">
                                                        <label class="form-check-label" for="inlineCheckbox2">C</label>
                                                    </div>
                                                    <div class="form-check form-check-inline">
                                                        <input class="form-check-input" type="checkbox" id="inlineCheckbox2" value="option2">
                                                        <label class="form-check-label" for="inlineCheckbox2">D</label>
                                                    </div>

                                                    <div class="form-check form-check-inline">
                                                        <input class="form-check-input" type="checkbox" id="inlineCheckbox2" value="option2">
                                                        <label class="form-check-label" for="inlineCheckbox2">E</label>
                                                    </div>

                                                    <div class="form-check form-check-inline">
                                                        <input class="form-check-input" type="checkbox" id="inlineCheckbox2" value="option2">
                                                        <label class="form-check-label" for="inlineCheckbox2">F</label>
                                                    </div>
                                                    <div class="form-check form-check-inline">
                                                        <input class="form-check-input" type="checkbox" id="inlineCheckbox2" value="option2">
                                                        <label class="form-check-label" for="inlineCheckbox2">No tengo</label>
                                                    </div>
                                                </div>

                                            </div>

                                            <div class="form-row">
                                                <div class="form-group">
                                                    <label class="text-intervid">Vehículo propio:</label>
                                                    <div class="form-check form-check-inline">
                                                        <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio1" value="option1">
                                                        <label class="form-check-label" for="inlineRadio1">Si</label>
                                                    </div>
                                                    <div class="form-check form-check-inline">
                                                        <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio2" value="option2">
                                                        <label class="form-check-label" for="inlineRadio2">No</label>
                                                    </div>
                                                </div>
                                            </div>


                                            <div class="form-check"><input class="form-check-input" type="checkbox" id="gridCheck">
                                                <label class="form-check-label" for="inlineRadio1">Poseeo algún tipo de discapacidad</label>
                                            </div>
                                            <input type="submit" value="Crear Cuenta" class="btn btn-success">  <button type="button" class="btn btn-primary">Cancelar</button>
                                        </form>
                                    </div>
                                </div>


                            </div>
                        </div> 

                        <!--Tercer cuadro-->
                        <div class="row mt-2"><p class="letraMediaPerfil">Datos de Contacto</p></div>

                        <div class="card col-md-9 ">
                            <div class="card-body ">
                                <form method="POST"> 
                                    <div class="form-row">

                                        <label class="text-intervid">País de residencia</label>
                                        <select name="" class="form-control">
                                            <option selected>Cosa</option>
                                        </select>
                                    </div>

                                    <div class="form-row">

                                        <label class="text-intervid">Región/Estado</label>
                                        <select name="" class="form-control">
                                            <option selected>Cosa</option>
                                        </select>
                                    </div>

                                    <div class="form-row">

                                        <label class="text-intervid">Comuna/Municipio</label>
                                        <select name="" class="form-control">
                                            <option selected>Cosa</option>
                                        </select>
                                    </div>

                                    <div class="form-row">

                                        <label class="text-intervid">Dirección</label>
                                        <select name="" class="form-control">
                                            <option selected>Cosa</option>
                                        </select>
                                    </div>

                                    <div class="form-group ">
                                        <label class="col-form-label text-intervid">Correo electrónico:</label>

                                        <input type="email"  name="correo" class="form-control">
                                    </div>


                                    <div class="form-row">
                                        <label class="text-intervid">Télefono</label>
                                        <div class="col-md-6"></div>
                                        <div class="form-group col-md-6">

                                            <select name="" class="form-control">
                                                <option selected>Cosa</option>
                                            </select>
                                        </div>
                                        <div class="form-group col-md-6">
                                            <input type="text" name="identificacion" class="form-control">
                                        </div>

                                    </div>
                                    <a href="">+Añadir otro télefono</a>
                                    <div class="col-md-6"></div>
                                    <input type="submit" value="Crear Cuenta" class="btn btn-success">  
                                    <button type="button" class="btn btn-primary">Cancelar</button>
                                </form>
                            </div>

                        </div> 


                        <!--Cuerto cuadro-->
                        <div class="row mt-2"><p class="letraMediaPerfil">Educación</p></div>

                        <div class="card col-md-9 ">
                            <div class="card-body ">
                                <div class="form-group ">
                                    <label class="col-form-label text-intervid">Institución:</label>
                                    <input type="text"  name="correo" class="form-control">
                                </div>

                                <div class="form-row">

                                    <label class="text-intervid">Nivel de estudios:</label>
                                    <select name="" class="form-control">
                                        <option selected>Medio</option>
                                    </select>
                                </div>
                                <div class="form-row">

                                    <label class="text-intervid">Estado:</label>
                                    <select name="" class="form-control">
                                        <option selected>Cosa</option>
                                    </select>
                                </div>

                                <div class="form-row">
                                    <label class="text-intervid">Período: </label>
                                    <div class="col-md-11"></div>
                                    <div class="form-group col-md-2">
                                        <select name="" class="form-control">
                                            <option selected>Mes</option>
                                        </select>
                                    </div>
                                    <div class="form-group col-md-2">
                                        <select name="" class="form-control">
                                            <option selected>Año</option>
                                        </select>
                                    </div>
                                    -
                                    <div class="form-group col-md-2">
                                        <select name="" class="form-control">
                                            <option selected>Mes</option>
                                        </select>
                                    </div>
                                    <div class="form-group col-md-2">
                                        <select name="" class="form-control">
                                            <option selected>Año</option>
                                        </select>
                                    </div>
                                    <div class="form-check col-md-3">

                                        <div class="form-check"><input class="form-check-input" type="checkbox" id="gridCheck">
                                            A la actualidad
                                        </div>
                                    </div>


                                </div><input type="submit" value="Añadir" class="btn btn-success">  
                                <button type="button" class="btn btn-primary">Cancelar</button>
                            </div>

                        </div> 

                        <!--Quinto cuadro-->
                        <div class="row mt-2"><p class="letraMediaPerfil">Expectativas Laborales</p></div>
                        <div class="row">
                            <div class="card col-md-9 ">
                                <div class="card-body ">

                                  <div class="form-group ">
                                    <label class="col-form-label text-intervid">Expectativas de renta:</label>
                                    <input type="text"  name="correo" class="form-control">
                                </div>
                                    <div class="form-row">

                                        <label class="text-intervid">Moneda:</label>
                                        <select name="" class="form-control">
                                            <option selected>Cosa</option>
                                        </select>
                                    </div>

                                    <div class="form-row">

                                        <label class="text-intervid">Region/Estado preferente para trabajar:</label>
                                        <select name="" class="form-control">
                                            <option selected>Cosa</option>
                                        </select>
                                    </div>

                                    <div class="form-row">

                                        <label class="text-intervid">Jornada:</label>
                                        <select name="" class="form-control">
                                            <option selected>Cosa</option>
                                        </select>
                                    </div>

                                    <div class="form-row">
                                        <div class="form-group">
                                            <label class="text-intervid">Disponibilidad para viajar:</label>
                                            <div class="form-check form-check-inline">
                                                <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio1" value="option1">
                                                <label class="form-check-label" for="inlineRadio1">Si</label>
                                            </div>
                                            <div class="form-check form-check-inline">
                                                <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio2" value="option2">
                                                <label class="form-check-label" for="inlineRadio2">No</label>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="form-row">
                                        <div class="form-group">
                                            <label class="text-intervid">Disponibilidad para cambiar de residencia:</label>
                                            <div class="form-check form-check-inline">
                                                <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio1" value="option1">
                                                <label class="form-check-label" for="inlineRadio1">Si</label>
                                            </div>
                                            <div class="form-check form-check-inline">
                                                <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio2" value="option2">
                                                <label class="form-check-label" for="inlineRadio2">No</label>
                                            </div>
                                        </div>
                                    </div>

                                    <input type="submit" value="Añadir" class="btn btn-success">  
                                    <button type="button" class="btn btn-primary">Cancelar</button>
                                </div>

                            </div>
                        </div> 

                        <!--Sexto cuadro-->
                        <div class="row mt-2"><p class="letraMediaPerfil">Experiencia Profesional</p></div>
                        <div class="row">
                            <div class="card col-md-9 ">
                                <div class="card-body ">
                                   
                                     <div class="form-group ">
                                    <label class="col-form-label text-intervid">Empresa:</label>
                                    <input type="text"  name="correo" class="form-control">
                                </div>
                                    <div class="form-group">

                                        <label class="text-intervid">Área:</label>
                                        <select name="" class="form-control">
                                            <option selected>Categorias</option>
                                        </select>
                                    </div>
                                    
                                     <div class="form-group ">
                                    <label class="col-form-label text-intervid">Cargo:</label>
                                    <input type="text"  name="correo" class="form-control">
                                </div>
                                    
                                     <div class="form-row">
                                    <label class="text-intervid">Período: </label>
                                    <div class="col-md-11"></div>
                                    <div class="form-group col-md-2">
                                        <select name="" class="form-control">
                                            <option selected>Mes</option>
                                        </select>
                                    </div>
                                    <div class="form-group col-md-2">
                                        <select name="" class="form-control">
                                            <option selected>Año</option>
                                        </select>
                                    </div>
                                    -
                                    <div class="form-group col-md-2">
                                        <select name="" class="form-control">
                                            <option selected>Mes</option>
                                        </select>
                                    </div>
                                    <div class="form-group col-md-2">
                                        <select name="" class="form-control">
                                            <option selected>Año</option>
                                        </select>
                                    </div>
                                    
                                     <div class="form-group col-lg-12">
                                    <label class="col-form-label text-intervid">Funciones y logros del cargo:</label>
                                    <textarea  name="funcionLogros" class="form-control txtarea"></textarea>
                                </div>


                                </div>
                                    
                                    <input type="submit" value="Añadir" class="btn btn-success">  
                                <button type="button" class="btn btn-primary">Cancelar</button>
                                </div>  
                              
                            </div>
                        </div> 

                        <!--Septimo cuadro-->
                        <div class="row mt-2"><p class="letraMediaPerfil">Idiomas</p></div>
                        <div class="row">
                            <div class="card col-md-9 ">
                                <div class="card-body ">
                                                             <div class="form-row ">
                                                <label class="col-form-label text-intervid">Idioma:</label>
                                                <div class="col-md-6"></div>
                                                <div class="form-group col-md-8">
                                                    <select name="idioma" class="form-control ">
                                                        <option selected>Español</option>
                                                    </select>
                                                </div>
                                                <div class="form-check col-md-4">

                                                    <div class="form-check"><input class="form-check-input" type="checkbox" id="gridCheck">
                                                        Nativo
                                                    </div>
                                                </div>
                                            </div>
                                    
                                                        <div class="form-group">

                                        <label class="text-intervid">Escrito:</label>
                                        <select name="escrito" class="form-control">
                                            <option selected>Categorias</option>
                                        </select>
                                    </div>
                                    
                                                        <div class="form-group">

                                        <label class="text-intervid">Hablado:</label>
                                        <select name="hablado" class="form-control">
                                            <option selected>Categorias</option>
                                        </select>
                                    </div>
                            
                                      <input type="submit" value="Añadir" class="btn btn-success">  
                                <button type="button" class="btn btn-primary">Cancelar</button>
                                
                                </div>
                            </div>
                        </div> 

                        <!--Segundo cuadro-->
                        <div class="row mt-2"><p class="letraMediaPerfil">Otros Conocimientos</p></div>
                        <div class="row">
                            <div class="card col-md-9 ">
                                <div class="card-body ">
                                    <div class="form-group ">
                                        
                                    <label class="col-form-label text-intervid">Conocimientos o habilidades:</label>
                                    <input type="text"  name="correo" class="form-control">
                                </div>
                                      <input type="submit" value="Añadir" class="btn btn-success">  
                                <button type="button" class="btn btn-primary">Cancelar</button>
                                </div>
                            </div>
                        </div> 

                    </div>    
                </div>
            </div>
        </div>


<!--                 FOOTER                  --> 
        <div id="footer" class="container-fluid bg-black">
            <div class="container-fluid">
                <div class="row pt-4 ">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-3 mt-1">
                                <h5 class="text-white">Postulantes</h5>
                                <hr class="hr-custom-white" />
                                <a class="alink nav-link border-link pb-0" href="contacto.php">Contáctanos</a>
                                <a class="alink nav-link border-link pb-0" href="nosotros.html">Sobre Nosotros</a>
                                <a class="alink nav-link border-link pb-0" href="nosotros.html">Sobre Nosotros</a>
                            </div>
                            <div class="col-lg-3 mt-1">
                                <h5 class="text-white">Reclutadores</h5>
                                <hr class="hr-custom-white" />

                                <a class="alink nav-link border-link pb-0" href="contacto.php">Contáctanos</a>
                                <a class="alink nav-link border-link pb-0" href="nosotros.html">Sobre Nosotros</a>
                                <a class="alink nav-link border-link pb-0" href="nosotros.html">Sobre Nosotros</a>
                            </div>
                            <div class="col-lg-3 mt-1">
                                <h5 class="text-white">Empresas</h5>
                                <hr class="hr-custom-white" />
                                <a class="alink nav-link border-link pb-0" href="contacto.php">Contáctanos</a>
                                <a class="alink nav-link border-link pb-0" href="nosotros.html">Sobre Nosotros</a>
                                <a class="alink nav-link border-link pb-0" href="nosotros.html">Sobre Nosotros</a>
                            </div>
                            <div class="col-lg-3 mt-3 text-right">
                                <img class="mb-3" src="img/letra 5mm_render.png" alt=""/>
                                <div class="text-white p-12">INVID Ltda</div>
                                <div class="text-white p-12">Santiago, Chile</div>
                                <div class="text-white p-12"><a href="mailto:contacto@inter-vid.com">contacto@inter-vid.com</a></div>
                            </div>
                        </div>
                        <div class="row mt-1">
                            <div class="col-lg-12">
                                <hr class="hr-custom-white"/>
                            </div>
                            <div class="col-lg-12">
                                <p class="text-white p-12">
                                    &copy; 2019 InterVid . Todos los derechos reservados.
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </body>
</html>

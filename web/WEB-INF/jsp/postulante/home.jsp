<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<mvc:view-controller path="jsp/postulante" view-name="jsp/postulante"/>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/stylesheet.css" type="text/css" charset="utf-8" />
        <link href="css/custom.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
        <title>Welcome to Spring Web MVC project</title>
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
    <div class="container ">
        <div class="row">
            <div class="col-lg-4">
                <p>Hola</p>
            </div>
            <div class="col-lg-4">
                <p>Hola</p>
            </div>
            <div class="col-lg-4">
                <p>Hola</p> 
            </div>
        </div>

    </div>
    <table class="table" border="1">
        <c:forEach var="dato" items="${lista}">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Correo</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td><a class="border-link">${dato.CorreoUsuario}</a></td>
                    <td>${dato.CorreoUsuario}</td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                </tr>
            </tbody>
        </c:forEach>
    </table>
</body>
</html>

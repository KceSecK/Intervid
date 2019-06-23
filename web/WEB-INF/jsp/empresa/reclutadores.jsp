<%-- 
    Document   : reclutadores
    Created on : 22-06-2019, 15:57:50
    Author     : sdasd
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <title>Intervid - Mis Reclutadores</title> 
        <link rel="shortcut icon" type="image/x-icon" href="icon/inter2-favicon.ico" />
        <link rel="stylesheet" href="css/stylesheet.css" type="text/css" charset="utf-8" />
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="css/custom.css" rel="stylesheet" type="text/css"/>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/scrolling.js" type="text/javascript"></script>
        <script src="js/validaremail.js" type="text/javascript"></script>
        <script src="js/compararpass.js" type="text/javascript"></script>
        <script src="js/validarpass.js" type="text/javascript"></script>
    </head>
    <body>
        <jsp:include page="headerempresa.jsp"></jsp:include>
            <!--Container principal-->
            <div class="container-fluid div-principal">

                <div class="row">
                    <!--Nav lateral-->
                    <div class="col-lg-2 bg-intervid intervid-fixed-nav">
                        <div class="container mt-4">
                            <ul class="list-unstyled static ">
                                <li>
                                    <a class="alink nav-link border-link" href="#cuenta">Cuenta</a>
                                </li>
                                <li>
                                    <a class="alink nav-link border-link" href="#contraseña">Contraseña</a>
                                </li>
                            </ul>
                        </div>
                    </div>

                <jsp:include page="agregarreclutador.jsp"></jsp:include>
            </div>
        </div>

        <jsp:include page="../footer.jsp" ></jsp:include>
    </body>
</html>

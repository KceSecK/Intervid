<%@page import="org.springframework.security.core.userdetails.User"%>
<%@page import="org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder"%>
<%@page import="org.springframework.security.crypto.password.PasswordEncoder"%>
<%@page import="org.springframework.security.core.Authentication"%>
<%@page import="org.springframework.security.core.context.SecurityContextHolder"%>
<%@page import="org.springframework.security.core.context.SecurityContext"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<%
    SecurityContext ctx = SecurityContextHolder.getContext();
    Authentication auth = ctx.getAuthentication();
    String username = auth.getName();
    String rol = auth.getAuthorities().toString();

%>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <title>Intervid - Curriculum de usuario</title> 
        <link rel="shortcut icon" type="image/x-icon" href="icon/inter2-favicon.ico" />
        <link rel="stylesheet" href="css/stylesheet.css" type="text/css" charset="utf-8" />
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="css/custom.css" rel="stylesheet" type="text/css"/>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/scrolling.js" type="text/javascript"></script>
        <script src="js/validaremail.js" type="text/javascript"></script>
        <script src="js/compararpass.js" type="text/javascript"></script>
    </head>
    <body>
        <jsp:include page="headerempresa.jsp"></jsp:include>

        <!--Container principal-->
        <div class="container-fluid div-principal">

            <div class="row">
                <!--Nav lateral-->
                <div class="col-lg-2 bg-intervid intervid-fixed-nav minh">
                    <div class="container">
                        <ul class="list-unstyled static ">
                            <h3 class="text-white mt-3">Mi cuenta</h3>
                            <hr class="hr-custom-white"/>
                            <li>
                                <a class="alink nav-link border-link" href="#cuenta">Cuenta</a>
                            </li>
                            <li>
                                <a class="alink nav-link border-link" href="#contraseña">Contraseña</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>

        <jsp:include page="../footer.jsp" ></jsp:include>
    </body>
</html>
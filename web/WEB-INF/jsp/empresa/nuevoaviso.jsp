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
%>
<html>
    <head>
        <title>Intervid - Nuevo Aviso Laboral</title> 
        <jsp:include page="../head.jsp" flush="true"></jsp:include>
        <!--<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>-->
    </head>
    <body>
        <jsp:include page="headerempresa.jsp"></jsp:include>

        <!--Container principal-->
        <div class="container-fluid div-principal">

            <div class="row">
                <!--Nav lateral-->
                <div class="col-lg-2 bg-intervid intervid-fixed-nav minh d-none d-lg-block">
                    <div class="container">
                        <ul class="list-unstyled static mt-4 ">
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
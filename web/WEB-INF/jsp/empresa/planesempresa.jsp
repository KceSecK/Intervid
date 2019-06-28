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
            <jsp:include page="../planes.jsp"></jsp:include>
                <div class="row">
                <jsp:include page="../footer.jsp" ></jsp:include>
            </div>
        </div>

    </body>
</html>
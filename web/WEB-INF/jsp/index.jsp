<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome to Spring Web MVC project</title>
    </head>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
    <body>
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
    <c:forEach var="dato" items="${lista}">
        <table class="table" border="1">
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
        </table>

    </c:forEach>
</body>
</html>

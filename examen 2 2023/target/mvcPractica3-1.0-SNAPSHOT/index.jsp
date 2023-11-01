<%@page import="com.emergentes.modelo.Categoria"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.emergentes.modelo.Libro"%>
<%

    if(session.getAttribute("biblioteca")==null)
    {
        ArrayList<Libro> lisaux = new ArrayList<Libro>();
        session.setAttribute("biblioteca", lisaux);
    }
    if(session.getAttribute("cates")==null)
    {
        ArrayList<Categoria> liscat = new ArrayList<Categoria>();
        
        liscat.add(new Categoria(1,"Novela"));
        liscat.add(new Categoria(2,"Historia"));
        liscat.add(new Categoria(3,"Cuento"));
        session.setAttribute("cates",liscat);
    }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Juan Ángel Mamani Vargas</title>
        <link rel="stylesheet" type="text/css" href="estilos.css">
    </head>
    <body>
        <div class="contenedor">
            <h1>Biblioteca</h1>
            <ul>

                <li><a href="Libros.jsp">Libros</a></li>
                <li><a href="categorias.jsp">Categorias</a></li>
            </ul>   
        </div>

    </body>
</html>

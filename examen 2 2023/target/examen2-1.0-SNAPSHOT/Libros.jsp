<%@page import="java.util.List"%>
<%@page import="com.emergentes.modelo.Libro"%>
<%
    List<Libro> libros = (List<Libro>)session.getAttribute("biblioteca");
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Libros | </title>
        <link rel="stylesheet" type="text/css" href="estilos.css">
    </head>
    <body>
        <div class="contenedor2">
            <h1>Libros</h1>
            <p><a href="LibrosController?op=nuevo">Agregar Nuevo Libro -></a></p>
            <table border="1">
                <tr>
                    <th>ID</th>
                    <th>TITULO</th>
                    <th>AUTOR</th>
                    <th>DISPONIBLE</th>
                    <th>CATEGORIA</th>
                    <th></th>
                    <th></th>
                </tr>
                <%
                    if (libros != null) {
                        for (Libro item : libros) {
                %>
                <tr>
                    <td><%= item.getId()%></td>
                    <td><%= item.getTitulo()%></td>
                    <td><%= item.getAutor()%></td>
                    <td><%= item.getDisponibilidad()%></td>
                    <td><%= item.getCate().getDescripcion()%></td>
                    <td><a href="LibrosController?op=editar&id=<%= item.getId()%>">Editar</a></td>
                    <td><a href="LibrosController?op=eliminar&id=<%= item.getId()%>">Eliminar</a></td>
                </tr>
                <%
                        }
                    }
                %>
            </table>
            <p><a href="index.jsp"><- Volver al menu</a></p>
        </div>
    </body>
</html>

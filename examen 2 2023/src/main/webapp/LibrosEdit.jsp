<%@page import="com.emergentes.modelo.Categoria"%>
<%@page import="java.util.List"%>
<%@page import="com.emergentes.modelo.Libro"%>
<%
    Libro lib = (Libro)request.getAttribute("lib");
    List<Categoria> categorias = (List<Categoria>)request.getAttribute("categorias");
    String tipo = (String)request.getAttribute("tipo");
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>NUEVO | EDITAR</title>
        <link rel="stylesheet" type="text/css" href="estilos.css">
    </head>
    <body>
        <div class="contenedor3">
            <h1><%= (tipo == "new") ? "Nuevo " : "Editar "%>Libro</h1>
            <form action="LibrosController" method="POST">
                <input type="hidden" name="tipo" value="<%=tipo%>">
                <table>
                    <tr>
                        <td class="titulo">Id</td>
                        <td class="texto"><input type="text" name="id" value="<%= lib.getId()%>"></td>
                    </tr>
                    <tr>
                        <td class="titulo">Titulo</td>
                        <td class="texto"><input type="text" name="titulo" value="<%= lib.getTitulo()%>"></td>
                    </tr>
                    <tr>
                        <td class="titulo">Autor</td>
                        <td class="texto"><input type="text" name="autor" value="<%= lib.getAutor()%>"></td>
                    </tr>
                    <tr>
                        <td class="titulo">Disponible</td>
                        <td class="texto"><input type="text" name="disponibilidad" value="<%= lib.getDisponibilidad()%>"></td>
                    </tr>
                    <tr>
                        <td class="titulo">Categoria</td>
                        <td class="texto"><select name="idcat"> 
                                <%
                                    for (Categoria c : categorias) {
                                %>
                                <option value="<%= c.getId()%>"<%= (c.getId() == lib.getCate().getId()) ? "selected" : ""%>>
                                    <%= c.getDescripcion()%>
                                </option>
                                <%
                                    }
                                %>                        
                            </select></td>
                    </tr>
                    <tr>
                        <td class="titulo"></td>
                        <td class="texto"><input type="submit" value="Registrar"></td>
                    </tr>
                </table>
            </form>
            <p><a href="Libros.jsp"><- volver</a></p>
        </div>
    </body>
</html>

<%@page import="com.emergentes.modelo.Categoria"%>
<%
    Categoria item = (Categoria)request.getAttribute("item");
    String tipo = (String)request.getAttribute("tipo");
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>EDITAR | NUEVO</title>
        <link rel="stylesheet" type="text/css" href="estilos.css">
    </head>
    <body>
        <div class="contenedor3">
            <h1><%= (tipo == "new") ? "Nueva " : "Editar "%>Categoria</h1>
            <form action="CategoriaController" method="POST">
                <input type="hidden" name="tipo" value="<%=tipo%>">
                <table>
                    <tr>
                        <td class="titulo">ID</td>
                        <td class="texto"><input type="text" name="id" value="<%=item.getId()%>"></td>
                    </tr>
                    <tr>
                        <td class="titulo">Descripcion</td>
                        <td class="texto"><input type="text" name="descripcion" value="<%=item.getDescripcion()%>"></td>
                    </tr>
                    <tr>
                        <td class="titulo"></td>
                        <td class="texto"><input type="submit" value="Registrar"></td>
                    </tr>
                </table>    
            </form>
            <p><a href="categorias.jsp"><- volver</a></p>
        </div>
    </body>
</html>

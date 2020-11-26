<%-- 
    Document   : index
    Created on : 16-nov-2020, 10:36:03
    Author     : sjimenez
--%>
<%@page import="java.sql.ResultSet"%>
<%@page import = "dbconexion.DbMysql"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>gestion de productos</title>
    </head>
    <body>
          <%
            String sql="Select * from categorias ORDER BY descripcion";
            DbMysql.Open();
            ResultSet regcat=DbMysql.Query(sql);
        %>
        <h1>Sistema de registro de productos</h1>
        <hr>
        <form name="frmproductos" method="post" action ="guardarproductos.jsp">
            <table >
                <tr>
                    <td>Descripción</td>
                    <td> <input type ="text" name="descripcion"> </td>
                </tr>
                <tr>
                    <td>Precio</td>
                    <td> <input type ="text" name="precio"> </td>
                </tr>
                <tr>
                    <td>Cantidad</td>
                    <td> <input type ="text" name="cantidad"> </td>
                </tr>
                <tr>
                    <td>Descuento</td>
                    <td> <input type ="text" name="descuento"> </td>
                </tr>
                <tr>
                    <td>iva</td>
                    <td> <input type ="text" name="iva"> </td>
                </tr>
                <tr>
                    <td>Categoria</td>
                    <td> 
                        <select name="categoria">
                           <% while(regcat.next()){%> 
                           <option value="<%= regcat.getString("id") %>"><%= regcat.getString("descripcion") %></option>
                           <% }%> 
                        </select>
                    </td>
                </tr>
                <tr>
                    <td><input type ="reset" value="cancelar"></td>
                    <td> <input type ="submit" value="enviar"> </td>
                </tr>
            </table>
       </form> 
        <%
            sql="Select * from productos ORDER BY descripcion";
            ResultSet reg=DbMysql.Query(sql);
        %>
        <table border="1">
            <thead>
                <tr>
                    <th> DESCRIPCIÓN </th>
                    <th> PRECIO </th>
                    <th> CANTIDAD </th>
                    <th> DESCUENTO </th>
                    <th> IVA </th>
                </tr>
            </thead>
            <tbody>
                <% while(reg.next()){%>
                <tr>
                    <td><%=reg.getString("descripcion")%> </td>  
                    <td><%=reg.getString("precio")%> </td>
                    <td><%=reg.getString("cantidad")%> </td>
                    <td><%=reg.getString("descuento")%> </td>
                    <td><%=reg.getString("iva")%> </td>
                </tr>
               <% }%> 
            </tbody>
            
        </table>
    </body>
</html>

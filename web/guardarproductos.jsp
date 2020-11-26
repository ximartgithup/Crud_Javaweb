<%-- 
    Document   : guardarproductos
    Created on : 16-nov-2020, 11:15:32
    Author     : sjimenez
--%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import = "dbconexion.DbMysql"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>recibiendo datos!</h1>
        <%
         String descripcion=request.getParameter("descripcion").toUpperCase();
         String precio=request.getParameter("precio");
         String cantidad=request.getParameter("cantidad");
         String descuento=request.getParameter("descuento");
         String iva=request.getParameter("iva");
         String categoria=request.getParameter("categoria");
          Date date= new Date();
          String DATE_FORMAT = "yyyy/MM/dd"; 
          SimpleDateFormat sdf = new SimpleDateFormat(DATE_FORMAT); 
          String fecha=sdf.format(date).toString();
          DbMysql.Open();//abre la conexion BD
         String sql="insert into productos(descripcion,precio,cantidad,descuento,iva,categorias_id,created,modified) values('"+
                 descripcion+"',"+precio+","+cantidad+","+descuento+","+iva+","+categoria+",'"+fecha+"','"+fecha+"')";
         if(DbMysql.Execute(sql))
             out.println("<h1>Registro guardado correctamente </h1>");
         else
            out.println("<h1>Error no se pudo guardar</h1>");
        %>
    </body>
</html>

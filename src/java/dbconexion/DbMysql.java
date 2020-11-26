package dbconexion;
/**
 * @author Mgs. Sergio Jimenez Martinez
 *info: sjimenez@unisimonbolivar.edu.co
 */
import java.sql.*;
public  class DbMysql {
  public static String url; //ubicacin del ODBC
  public static String usuario; //usuario de la Base de datos
  public static String password; //Contrasea de la Base de Datos
  public static String database; //Nombre d ela Base de datos
  public static Statement stmt; //variable para crear la conexion
  public static  Connection conexion;
  // Funcion que Abre la base de Datos
  public static void Open()
  {
    url="localhost"; 
    usuario="root";
    password="";
    database ="facturacion";
    stmt = null;
    try
     {
       //Carga del driver
       Class.forName("com.mysql.jdbc.Driver");
        String connectionUrl = "jdbc:mysql://"+url+"/"+database+"?" +
                                   "user="+usuario+"&password="+password;
          conexion = DriverManager.getConnection(connectionUrl);
          stmt = conexion.createStatement();
     }
      catch (SQLException e) {
            System.out.println("SQL Exception: "+ e.toString());
        }
    catch(java.lang.ClassNotFoundException ex)
    {
      System.err.print("Problemas al cargar el driver");
      System.err.println(ex.getMessage());
     }
   }//end funcin open
  //----------------------------------------------------------
   // funcion para ejecutar consulta en la base de Datos (Select )
    public static ResultSet Query(String SQLquery)
    {
       try {
          //Creando la conexion a la BD

          ResultSet cursor = stmt.executeQuery(SQLquery);
           return cursor;
      }
      // Si se presenta Un Error
      catch(SQLException exc)
      {
        System.err.println(exc.getMessage());
        return null;
      }
    }
 //--------------------------------------------------------
 // para realizar operacioned de actualizacion como:
 //------ INSERT, DELETE Y UPDATE-------
    public static boolean Execute(String registro)
    {
       boolean ok = true;
        try
      {
         stmt.executeUpdate(registro);
       }catch(SQLException exc)
        {
            System.err.println(exc.getMessage());
            ok= false;
        }
        return ok;
    } // end execute
}// en class dtabase


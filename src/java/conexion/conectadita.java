package conexion;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class conectadita implements Serializable {
    private static final String USER = "root";
    private static final String PASSWORD = "1234";
    private static final String PASSWORD1 = "n0m3l0";
    private static final String DB = "kokua";
    private static final String PORT = "3306";

    public boolean testDriver() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            return true;
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
            return false;
        }
    }

    public Connection getConnection(String user, String password, String db, String server) {
        if (user == null || password == null || db == null || server == null || user.isEmpty() || password.isEmpty() || db.isEmpty() || server.isEmpty()) {
            throw new IllegalArgumentException("Invalid connection parameters");
        }

        String url = String.format("jdbc:mysql://%s:%s/%s?user=%s&password=%s", server, PORT, db, user, password);

        try {
            if (!testDriver()) {
                return null;
            }
            return DriverManager.getConnection(url);
        } catch (SQLException ex) {
            ex.printStackTrace();
            return null;
        }
    }

    public Connection getConnection() {
        
        return getConnection(USER, PASSWORD1, DB, "localhost");
    }

    public void closeConnection(Connection connection) {
        try {
            if (connection != null && !connection.isClosed()) {
                connection.close();
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }
}
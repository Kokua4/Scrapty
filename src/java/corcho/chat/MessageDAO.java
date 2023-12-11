package corcho.chat;

import conexion.conectadita;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

public class MessageDAO {

    public String user = "root";
    public String password = "1234";
    public String db = "kokua";
    public String port = "3306";
    public String dbURL = "jdbc:mysql://localhost:3306/kokua";

    public List<Message> getMessages(int idPG, int tipoUser) {
        List<Message> messages = new ArrayList<>();

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            
            Connection con = null;
            conectadita conecttion = new conectadita();
            con = conecttion.getConnection();

            String query = "select * from mensajes where tipo_usuario = ? and idPG = ?";
            PreparedStatement preparedStatement = con.prepareStatement(query);
            preparedStatement.setInt(1, tipoUser);
            preparedStatement.setInt(2, idPG);
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                String sender = resultSet.getString("usuario_envia");
                String content = resultSet.getString("mensaje");
                String time = resultSet.getString("hora_men");
                int id_admin = resultSet.getInt("odPG");

                messages.add(new Message(sender, content, time, id_admin));
            }

            resultSet.close();
            preparedStatement.close();
            con.close();
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }

        return messages;
    }

    public void saveMessage(String sender, String content, int tipoUser, int id_user, int idAdmin, String time) throws ParseException {
        // Definir el formato de fecha y hora
        SimpleDateFormat formatoFechaHora = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        java.util.Date utilDate = formatoFechaHora.parse(time);
        java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());

        // Convertir a java.sql.Timestamp (puedes usar java.sql.Date si no necesitas la parte de tiempo)
        Timestamp timestamp = new Timestamp(sqlDate.getTime());

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

             Connection con = null;
            conectadita conecttion = new conectadita();
            con = conecttion.getConnection();

            String query = "insert into mensajes (usuario_envia, mensaje, tipo_usuario, idPGs, hora_men) VALUES (?, ?, ?, ?, ?)";
            PreparedStatement preparedStatement = con.prepareStatement(query);
            preparedStatement.setString(1, sender);
            preparedStatement.setString(2, content);
            preparedStatement.setInt(3, tipoUser);
            preparedStatement.setInt(4, id_user);
            preparedStatement.setTimestamp(5, timestamp);
            preparedStatement.executeUpdate();

            preparedStatement.close();
            con.close();
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
    }

    public List<AdminUser> getAdminUsers() {
        List<AdminUser> adminUsers = new ArrayList<>();

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            
             Connection con = null;
            conectadita conecttion = new conectadita();
            con = conecttion.getConnection();
            
            String query = "select * from mensajes";
            PreparedStatement preparedStatement = con.prepareStatement(query);
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                int userId = resultSet.getInt("idPG");
                int tipoUser = resultSet.getInt("tipo_usuario");
                String userName = resultSet.getString("usuario_envia");

                AdminUser adminUser = new AdminUser(userId, tipoUser, userName);
                adminUser.setMessages(getMessagesForUser(userId)); // Obtener mensajes para este usuario

                adminUsers.add(adminUser);
            }
            resultSet.close();
            preparedStatement.close();
            con.close();
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }

        return adminUsers;
    }

    private List<MessageA> getMessagesForUser(int userId) {
        List<MessageA> messages = new ArrayList<>();

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

             Connection con = null;
            conectadita conecttion = new conectadita();
            con = conecttion.getConnection();

            String query = "select * from mensajes where idPG = ?";
            PreparedStatement preparedStatement = con.prepareStatement(query);
            preparedStatement.setInt(1, userId);

            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                int messageId = resultSet.getInt("id_mens");
                String content = resultSet.getString("mensaje");
                String sender = resultSet.getString("usuario_envia");
                String time = resultSet.getString("hora_men");
                int id_admin = resultSet.getInt("tipo_usuario");
                int id_hog = resultSet.getInt("idPG");

                System.out.println(content);
                MessageA message = new MessageA(messageId, content, sender, time, id_admin, id_hog);
                messages.add(message);
            }

            resultSet.close();
            preparedStatement.close();
            con.close();
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }

        return messages;
    }

}

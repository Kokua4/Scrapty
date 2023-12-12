package modelo;

import conexion.conectadita;
import org.mindrot.jbcrypt.BCrypt;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class operaciones {

    public class Usuario {
        private String hashAlmacenado;
        private int idTipoUsuario;

        public Usuario(String hashAlmacenado, int idTipoUsuario) {
            this.hashAlmacenado = hashAlmacenado;
            this.idTipoUsuario = idTipoUsuario;
        }

        public String getHashAlmacenado() {
            return hashAlmacenado;
        }

        public int getIdTipoUsuario() {
            return idTipoUsuario;
        }
    }

    private final conectadita connectionManager;

    public operaciones() {
        this.connectionManager = new conectadita();
    }

    public Usuario loguear(String us, String contra) {
        Usuario usuario = null;

        try (Connection con = connectionManager.getConnection();
             PreparedStatement pst = con.prepareStatement("SELECT * FROM publicoG WHERE nombrePG=?")) {

            pst.setString(1, us);
            ResultSet rs = pst.executeQuery();

            if (rs.next()) {
                String hashAlmacenado = rs.getString("contraseña");
                int idTipo = rs.getInt("idTipoUsuario");

                usuario = new Usuario(hashAlmacenado, idTipo);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return usuario;
    }
}

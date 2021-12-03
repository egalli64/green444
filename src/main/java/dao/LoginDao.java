package dao;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.sql.DataSource;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

public class LoginDao implements AutoCloseable {
    private static final Logger log = LogManager.getLogger(LoginDao.class);
    private static final String GET_USER = "SELECT first_name FROM utenti WHERE username=? AND password=?";
    private Connection conn;

    public LoginDao(DataSource ds) {
        log.trace("called");

        try {
            this.conn = ds.getConnection();
        } catch (SQLException se) {
            throw new IllegalStateException("Database issue " + se.getMessage());
        }
    }

    public boolean checkUser(Login login) {
        log.trace("called");

        try (PreparedStatement stmt = conn.prepareStatement(GET_USER)) {
            stmt.setString(1, login.getName());
            stmt.setString(2, login.getPassword());

            try (ResultSet rs = stmt.executeQuery(GET_USER)) {
                return rs.next();
            }
        } catch (SQLException se) {
            log.error("Can't get users: " + se.getMessage());
            throw new IllegalStateException("Database issue " + se.getMessage());
        }
    }

    @Override
    public void close() throws IOException {
        try {
            conn.close();
        } catch (SQLException se) {
            throw new IllegalStateException("Database issue " + se.getMessage());
        }
    }
}

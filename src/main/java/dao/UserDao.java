package dao;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

public class UserDao implements AutoCloseable {
    private static final Logger log = LogManager.getLogger(UserDao.class);
    private static final String GET_ALL = "SELECT utente_id, nome, cognome FROM utenti";
    private Connection conn;

    public UserDao(DataSource ds) {
        log.trace("called");

        try {
            this.conn = ds.getConnection();
        } catch (SQLException se) {
            throw new IllegalStateException("Database issue " + se.getMessage());
        }
    }

    public List<User> getAll() {
        log.trace("called");
        List<User> results = new ArrayList<>();

        try (Statement stmt = conn.createStatement(); //
                ResultSet rs = stmt.executeQuery(GET_ALL)) {
            while (rs.next()) {
                User cur = new User(rs.getInt(1), rs.getString(2), rs.getString(3));
                results.add(cur);
            }
        } catch (SQLException se) {
            log.error("Can't get coders: " + se.getMessage());
            throw new IllegalStateException("Database issue " + se.getMessage());
        }

        return results;
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

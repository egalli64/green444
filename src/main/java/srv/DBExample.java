package srv;

import java.io.IOException;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import dao.UserDao;

@SuppressWarnings("serial")
@WebServlet("/user/all")
public class DBExample extends HttpServlet {
    private static final Logger log = LogManager.getLogger(DBExample.class);

    @Resource(name = "jdbc/green")
    private DataSource ds;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        log.trace("enter");

        try (UserDao dao = new UserDao(ds)) {
            request.setAttribute("users", dao.getAll());
            request.getRequestDispatcher("all.jsp").forward(request, response);
        }
    }
}

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

import dao.Login;
import dao.LoginDao;
import dao.UserDao;

@SuppressWarnings("serial")
@WebServlet("/user/check")
public class CheckLogin extends HttpServlet {
    private static final Logger log = LogManager.getLogger(CheckLogin.class);

    @Resource(name = "jdbc/green")
    private DataSource ds;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        log.trace("enter");

        Login login = new Login();
        // TODO: get parameters

        try (LoginDao dao = new LoginDao(ds)) {
            dao.checkUser(login);
            // TODO: check result from dao
//            request.getRequestDispatcher("all.jsp").forward(request, response);
        }
    }
}

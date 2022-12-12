package jobtc_test;

import java.io.IOException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = "/abc")

public class MainServlet extends HttpServlet{

    RequestDispatcher rd;

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
      System.out.println("get실행");
      rd = req.getRequestDispatcher("index.jsp");
      rd.forward(req,resp);

    }

}

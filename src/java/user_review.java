import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

//CURRENT SERVLET REDIRECTS TO HOMEPAGES, OLD "homepage"
@WebServlet("/user_review")
public class user_review extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

        HttpSession session = request.getSession();
        session.getAttribute("user_type");
        response.sendRedirect("/user_profile.jsp");
        
        RequestDispatcher rd = getServletContext().getRequestDispatcher("user_profile.jsp");
        rd.forward(request, response);           
            
    }
}

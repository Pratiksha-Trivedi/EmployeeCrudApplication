package controler;


import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.EmployeeService;

/**
 * Servlet implementation class Initializer
 */
@WebServlet("/Initializer")
public class Initializer extends HttpServlet {
	private static final long serialVersionUID = 1L;
  private EmployeeService employeeService=new EmployeeService();
    /**
     * Default constructor. 
     */
    public Initializer() {
       System.out.println("Initilaizer");
    }
    @Override
	public void init() throws ServletException {
		
		System.out.println("Default load");
		employeeService.initialEmp();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out =  response.getWriter();
		out.println("<html>");
		out.println("<body>");
		out.println("<h1>Default Servlet</h1>");
		out.println("</body>");
		out.println("</html>");
		}
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

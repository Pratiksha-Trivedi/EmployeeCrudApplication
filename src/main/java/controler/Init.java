package controler;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.Servlet;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import entity.Employee;
import service.EmployeeService;

/**
 * Servlet implementation class Init
 */
@WebServlet("/Init")
public class Init extends HttpServlet {
	private static final long serialVersionUID = 1L;
	EmployeeService ec = new EmployeeService();

	/**
	 * Default constructor.
	 */
	public Init() {
		// TODO Auto-generated constructor stub
		System.out.println("Init");
	}

	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	RequestDispatcher requestDispatcher;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		// doGet(request, response);
		System.out.println("Inside dopost of login");
		String userName = request.getParameter("username");
		String password = request.getParameter("password");
		Employee employee = ec.login(userName, password);
		if (employee != null) 
		{
			HttpSession session = request.getSession(true);
			if (employee.isAdmin()) {
				// session.setAttribute("employee", employee);
				System.out.println("Emp is admin");
				List<Employee> employeeList = ec.getList();
				System.out.println("List in login::");
				employeeList.forEach(System.out::println);
				session.setAttribute("employeeList", employeeList);
				session.setAttribute("employee", employee);
				response.sendRedirect("Admin.jsp");
				//requestDispatcher = request.getRequestDispatcher("Admin.jsp");
				//requestDispatcher.include(request, response);

			} else {
				session.setAttribute("employee", employee);
				//requestDispatcher = request.getRequestDispatcher("user.jsp");
			response.sendRedirect("user.jsp");
			}

			// request.setAttribute("employee", employee);
			// requestDispatcher.include(request, response);
		} else {
			RequestDispatcher requestDispatcher = request.getRequestDispatcher("Login.jsp");
			request.setAttribute("message", "Invalid Credentials");
			requestDispatcher.forward(request, response);
		}
	}

}

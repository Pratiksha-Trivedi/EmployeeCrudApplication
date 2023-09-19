package controler;

import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import entity.Employee;
import service.EmployeeService;
;/**

 * Servlet implementation class Detilas
 */
@WebServlet("/Detilas")
public class Detilas extends HttpServlet {
	private static final long serialVersionUID = 1L;
	  EmployeeService employeeService = EmployeeService.getEmployeeService();   
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Detilas() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int id = 0;
		String firstname = null;
		String lastname = null;
		String username = null;
		String password = null;
		String admin = null;
		boolean isAdmin = false;
		String  details= (String) request.getParameter("details");
		if(details != null && details.equals("Delete") ) 
		{	
		id = Integer.parseInt((String) request.getParameter("id"));
		employeeService.deleteEmployee(id);
		//request.getRequestDispatcher("Admin.jsp").include(request, response);
		response.sendRedirect("Admin.jsp");
		
		}
		//String  detailsedit= (String) request.getParameter("detailsedit");
		
		if( details != null && details.equals("Edit")) 
		{
			id = Integer.parseInt( (String)request.getParameter("id"));
		
			
		employeeService.editEmployee(id, firstname, lastname, username, password, isAdmin);
		 response.sendRedirect("Admin.jsp");
		}
		
		if( details != null && details.equals("Logout")) 
		{
			HttpSession session=request.getSession(false);	
			if(session!=null)
			{
				session.invalidate();
				   response.sendRedirect("Login.jsp");
			}
		
		}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("Inside detail");
		int id = 0;
		String firstname = null;
		String lastname = null;
		String username = null;
		String password = null;
		String admin = null;
		boolean isAdmin = false;
		String  details= (String) request.getParameter("details");
		System.out.println("details in::"+details);
		if(details != null && (details.equals("Add") || details.equals("Edit") || details.equals("Edit Details")))
		{
			id = Integer.parseInt( request.getParameter("id"));
			firstname = (String) request.getParameter("firstname");
			lastname = (String) request.getParameter("lastname");
			username = (String) request.getParameter("username");
			password = (String) request.getParameter("password");
			admin= (String) request.getParameter("isAdmin");
			isAdmin = admin != null && admin.equals("yes") ? true : false;
			System.out.println(id+firstname+lastname+password+admin+isAdmin);
			}
			
		if(details != null && details.equals("Add") ) 
		{	
		employeeService.addEmployee(id, firstname, lastname, username, password, isAdmin);
		   response.sendRedirect("Admin.jsp");
		  // request.getRequestDispatcher("Admin.jsp").forward(request, response);
		}	
		if( details != null && details.equals("Edit")) 
		{
			
		employeeService.editEmployee(id, firstname, lastname, username, password, isAdmin);
		//request.getRequestDispatcher("Admin.jsp").forward(request, response);
		response.sendRedirect("Admin.jsp");
		}
		if( details != null && details.equals("Edit Details")) 
		{
		employeeService.editEmployee(id, firstname, lastname, username, password, isAdmin);
		HttpSession session = request.getSession();
		session.removeAttribute("employee");
		Employee employee = new Employee(id, firstname, lastname, username, password, isAdmin);		
		session.setAttribute("employee",employee);
		response.sendRedirect("user.jsp");
		}	
		
	}
	
}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	**/
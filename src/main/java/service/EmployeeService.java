package service;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

import entity.Employee;

public class EmployeeService {

	static List<Employee> empList = new ArrayList<>();
	static EmployeeService employeeService; 
	public void initialEmp()
	{
		Employee e1 = new Employee();
		e1.setId(1);
		e1.setAdmin(true);
		e1.setFirstName("Pratiksha");
		e1.setLastName("Trivedi");
		e1.setUserName("riya");
		e1.setPassword( "123");
		empList.add(e1);
		Employee e2= new Employee();
		e2.setId(2);
		e2.setAdmin(false);
		e2.setFirstName("Niraj");
		e2.setLastName("Kaushal");
		e2.setUserName("nrj");
		e2.setPassword( "4321");
		empList.add(e2);
		Employee e3= new Employee();
		e3.setId(3);
		e3.setAdmin(false);
		e3.setFirstName("Jiya");
		e3.setLastName("Soni");
		e3.setUserName("ram");
		e3.setPassword( "321");
		empList.add(e3);
		
		System.out.println(empList);

	}
	public EmployeeService() {
			}

	public static EmployeeService getEmployeeService() {
		if(employeeService == null)
		{
			employeeService	= new EmployeeService();	
		}
		return employeeService;
	}
	public List<Employee> getList() {
		System.out.println("getting list of emp");
		empList.forEach(System.out::println);
		return empList;
	}


	public Employee login(String userName, String password) {
	Optional<Employee> authenticEmp= empList.stream().filter(employee -> employee.getUserName().equals(userName)  && employee.getPassword().equals(password)).findFirst();	
	if(authenticEmp.isPresent())
	{
	return 	authenticEmp.get();
	}
		return null;
	}

	  private List<Employee> employees;

	  public void addEmployee(int id, String firstName, String lastName, String userName, String password, boolean isAdmin)
		{
		Employee e = new Employee( id,  firstName,  lastName,  userName,  password, isAdmin);
		System.out.println("details::"+e);
		empList.add(e);
		}
		

		public void editEmployee(int id, String firstName, String lastName, String userName, String password, boolean isAdmin )
		{
			empList.forEach(employee -> {
	            if (employee.getId() == id) {	
	            employee.setFirstName(firstName);
	            employee.setLastName(lastName);
	            employee.setUserName(userName);
	            employee.setPassword(password);
	            employee.setAdmin(isAdmin);
	               }
			});
		}
			

		public void deleteEmployee(int id)
		{	
		boolean Admin = empList.stream().anyMatch(e -> e.getId() == id && e.isAdmin());	
		if(!Admin)
		{
		empList.removeIf(employee -> employee.getId() == id);
		}
		}
		public Employee getEmpById(int id)
		{
			Optional<Employee> emp=empList.stream().filter(a->a.getId()==id).findFirst();
			if(emp.isPresent())
			{
				return emp.get();
			}
			else
				return null;
		}
	}
package in.pranjal.main.services;

import java.util.List;

import in.pranjal.main.entity.Employee;

public interface EmpServices {
	
	public Employee auth(String email);
	public boolean addEmpService(Employee details);
	public List<Employee> getAllEmployeeService();
	public boolean deleteEmployeeService(String email);
	public boolean updateEmpService(Employee details);

}

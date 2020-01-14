package spring.ladybug.ladybugapp.services;

import spring.ladybug.ladybugapp.pojos.Employee;

public interface EmployeeService {

	public Employee authenticateEmp(Employee emp);
	
	public boolean registerNewEmp(Employee emp);
	
	
}

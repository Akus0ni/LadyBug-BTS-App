package spring.ladybug.ladybugapp.services;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Example;
import org.springframework.stereotype.Service;

import spring.ladybug.ladybugapp.daos.EmployeeDao;
import spring.ladybug.ladybugapp.pojos.Employee;

@Service
public class EmployeeServiceImpl implements EmployeeService {

	@Autowired
	private EmployeeDao empDao;
	
	@Override
	public Employee authenticateEmp(Employee emp) {
		Employee temp = new Employee();
		temp.setEmpId(emp.getEmpId());
		temp.setEmpPassword(emp.getEmpPassword());
		
		Example<Employee> exampleEmp = Example.of(temp);
		
		//Returns the result for the below query:
		// SELECT * FROM employees e WHERE e.emp_id=? and e.emp_password=?;
		Optional<Employee> optional = empDao.findOne(exampleEmp);
		if(optional.isPresent()) {
			return optional.get();
		}
		
		return null;
	}

	@Override
	public boolean registerNewEmp(Employee emp) {
		//Validations here.....
		empDao.save(emp);
		return true;
	}

}

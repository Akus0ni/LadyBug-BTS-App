package spring.ladybug.ladybugapp.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import spring.ladybug.ladybugapp.pojos.Employee;
import spring.ladybug.ladybugapp.services.EmployeeService;

@RestController
public class EmployeeController {

	@Autowired
	private EmployeeService empService;
	
	@RequestMapping(value="/authenticate",method = RequestMethod.POST)
	public ResponseEntity<?> m1(@RequestBody Employee emp)
	{
		Employee temp = empService.authenticateEmp(emp);
		
		if(temp != null){
			return new ResponseEntity<Employee>(temp,HttpStatus.OK);
		}
		
		return new ResponseEntity<String>("Authentication Failed: Invalid Email and Password",HttpStatus.OK);
		
	}
	
	@RequestMapping(value = "/register",method = RequestMethod.POST)
	public ResponseEntity<?> m2(@RequestBody Employee emp){
		
		empService.registerNewEmp(emp);
		
		return new ResponseEntity<String>("User Created Successfully!!",HttpStatus.OK);
		
	}
	
}
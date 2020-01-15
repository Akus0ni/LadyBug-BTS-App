package spring.ladybug.ladybugapp.pojos;



import javax.persistence.*;

@Entity
@Table(name = "employees")
public class Employee {

	private String empId;
	private String empName;
	private String empEmail;
	private String empPassword;
	private String empRole;
	private String empUserName;
	private Employee manager;
	//private Set<Employee> subordinates = new HashSet<>();
	
	
	public Employee() {
		
	}


	public Employee(String empId,String empName, String empEmail, String empPassword, String empRole, String empUserName) {
		super();
		this.empId = empId;
		this.empName = empName;
		this.empEmail = empEmail;
		this.empPassword = empPassword;
		this.empRole = empRole;
		this.empUserName = empUserName;
	}


	@Id
	@Column(name="emp_id")
	public String getEmpId() {
		return empId;
	}


	public void setEmpId(String empId) {
		this.empId = empId;
	}


	@Column(name="emp_name")
	public String getEmpName() {
		return empName;
	}


	public void setEmpName(String empName) {
		this.empName = empName;
	}

	@Column(name="emp_email", unique = true, nullable = false)
	public String getEmpEmail() {
		return empEmail;
	}


	public void setEmpEmail(String empEmail) {
		this.empEmail = empEmail;
	}

	@Column(name="emp_password",nullable = false)
	public String getEmpPassword() {
		return empPassword;
	}


	public void setEmpPassword(String empPassword) {
		this.empPassword = empPassword;
	}

	@Column(name="emp_role")
	public String getEmpRole() {
		return empRole;
	}


	public void setEmpRole(String empRole) {
		this.empRole = empRole;
	}

	@Column(name="emp_username")
	public String getEmpUserName() {
		return empUserName;
	}


	public void setEmpUserName(String empUserName) {
		this.empUserName = empUserName;
	}


	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "mgr_id")
	public Employee getManager() {
		return manager;
	}


	public void setManager(Employee manager) {
		this.manager = manager;	
	}
	
//	@OneToMany(mappedBy = "manager")
//	public Set<Employee> getSubordinates() {
//		return subordinates;
//	}
//
//
//	public void setSubordinates(Set<Employee> subordinates) {
//		this.subordinates = subordinates;
//	}

	
	
	
	
}

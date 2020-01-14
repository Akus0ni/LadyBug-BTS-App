package spring.ladybug.ladybugapp.daos;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import spring.ladybug.ladybugapp.pojos.Employee;

@Repository
public interface EmployeeDao extends JpaRepository<Employee, Long>{

}

package in.pranjal.main.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import in.pranjal.main.entity.Employee;


@Transactional
public interface EmpRespository extends JpaRepository<Employee, Integer> {

	 Employee findByEmail(String email);
	 void deleteByEmail(String email);

}

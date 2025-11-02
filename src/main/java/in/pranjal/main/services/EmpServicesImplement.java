package in.pranjal.main.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import in.pranjal.main.entity.Employee;
import in.pranjal.main.repository.EmpRespository;


@Service
public class EmpServicesImplement implements EmpServices {

	@Autowired
	EmpRespository empRepository;
	@Override
	public boolean addEmpService(Employee details) {
	
		boolean status = false;
		try {
			empRepository.save(details);
			status =true;
		}
		catch (Exception e) {
			status = false;
			e.printStackTrace();
		}
		return status;
	}
	@Override
	public List<Employee> getAllEmployeeService() {
		
		return empRepository.findAll();
	}
	
	@Override
	public Employee auth(String email) {
		// TODO Auto-generated method stub
		Employee emp =  empRepository.findByEmail(email);
		return emp;
		
	}
	@Override
	public boolean deleteEmployeeService(String email) {
		
		boolean status = false;
	try {
		empRepository.deleteByEmail(email);
		status = true;
	}
	catch(Exception e) {
		status = false;
		e.printStackTrace();
	}
	return status;
	}
	@Override
	public boolean updateEmpService(Employee details) {
		boolean status = false;
		try {
			Employee existingEmp = empRepository.findByEmail(details.getEmail());
			
			if(existingEmp != null) {
				existingEmp.setName(details.getName());
				existingEmp.setEmail(details.getEmail());
				existingEmp.setPassword(details.getPassword());
				existingEmp.setPhone(details.getPhone());
				existingEmp.setAge(details.getAge());
				existingEmp.setGender(details.getGender());
				existingEmp.setAddress(details.getAddress());
				existingEmp.setRole(details.getRole());
				
				empRepository.save(existingEmp);
				status = true;

			}
		}
		catch(Exception e) {
			e.printStackTrace();
			status = false;
		}
		return status; 
	}

}

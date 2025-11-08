package in.pranjal.main.controller;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import in.pranjal.main.entity.Employee;
import in.pranjal.main.services.EmpServices;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;


@Controller
public class EmployeeController {

    @Autowired
	EmpServices empServices;
    
   

    
	@GetMapping("/")
	public String openIndexPage() {
		return"home";
	}
	
	@GetMapping("/home")
	public String openHomePage() {
		return"home";
	}
	
	@GetMapping("/adminlogin")
	public String openLoginPage() {
		return"login";
	}
	
	
	@PostMapping("/loginform")
	public String loginForm(@RequestParam("email") String email,
	                        @RequestParam("password") String password,
	                        Model model,
	                        HttpSession session
	                        ) {
	    String page = "error";  
	    
	    if (email.equals("admin@gmail.com") && password.equals("admin123")) {
	        page = "admin-profile-dashboard";
	    }
	    else {
	    	 
	    	Employee emp = empServices.auth(email);
	    	if(emp != null && emp.getPassword().equals(password)) {
	    		session.setAttribute("session_employee", emp);
	    		page = "profileEmployee";
	    	}
	    	else {
	    		model.addAttribute("model_message", "Email id and Password does not match");
	    		model.addAttribute("model_pagename", "reglogin");
	    		
	    		page =" error";
	    	}
       }
	    
	    return page; 
	 }
	
	@GetMapping("/admindashboard")
	public String openDashboardPage() {
		return"admin-profile-dashboard";
	}
	
	
	@GetMapping("/empManager")
	public String openEmployeeManagerPage( @RequestParam(name = "success", required = false) String success,
			                               @RequestParam(name = "error", required = false) String error,
			                               @RequestParam(defaultValue = "0") int page,   // current page, default 0
	                                       @RequestParam(defaultValue = "5") int size,   // page size, default 5
	                                       Model model) {

	    List<Employee> allEmployees = empServices.getAllEmployeeService();

	    int totalEmployees = allEmployees.size();
	    int start = page * size;
	    int end = Math.min(start + size, totalEmployees);

	    List<Employee> list_emp = allEmployees.subList(start, end);

	    int totalPages = (int) Math.ceil((double) totalEmployees / size);

	    model.addAttribute("model_list_emp", list_emp);
	    model.addAttribute("currentPage", page);
	    model.addAttribute("totalPages", totalPages);
	    model.addAttribute("pageSize", size);
	    
	    model.addAttribute("success", success);
	    model.addAttribute("error", error);
		return "employeeDetails";
	}
	
	@GetMapping("/empAdd")
	public String openEmployeeAddPage(Model model) {
		model.addAttribute("modelEmpAttr",new Employee());
		return"employeeAdd";
	}
	
	@PostMapping("/addEmpForm")
	public String registerEmployeeForm( @Valid @ModelAttribute("modelEmpAttr") Employee details,
			                             BindingResult result,
			                             Model model
			                            ) {
		

	    if (!result.hasErrors()) {
	    	boolean status = empServices.addEmpService(details);
			
			if(status)model.addAttribute("success", true);	 
			else model.addAttribute("error", true);
				
			details.setName("");
			details.setEmail("");
			details.setPassword("");
			details.setAge(null);
			details.setGender("");
			details.setAddress("");
			details.setRole("");
	    }
		return "employeeAdd"; 
		
	}
	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "login";
	}
	
	@GetMapping("/deleteEmployee")
	public String deleteEmployee(@RequestParam("email")String email,RedirectAttributes redAtt) {
		
//		System.out.println("Email :"+ email);
		
		boolean status = empServices.deleteEmployeeService(email);
		
		if(status)redAtt.addAttribute("success", true);	 
		else redAtt.addAttribute("error", true);
		
		return "redirect:/empManager";
	}
	@PostMapping("/updateForm")
	public String updateEmployeeForm( @Valid @ModelAttribute("modelEmpAttr") Employee details,
			                             RedirectAttributes redAtt
			                            ) {
		 boolean updated = empServices.updateEmpService(details);

		if (updated) {
			redAtt.addAttribute("success", true);	
	    } else {
	    	redAtt.addAttribute("success", true);	
	    }
	    return "redirect:/empManager";
		
	}
	
	
}

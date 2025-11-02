package in.pranjal.main.entity;



import jakarta.persistence.*;   // If you’re on Spring Boot 3+
import jakarta.validation.constraints.*;
import lombok.*;               // Optional if you want Lombok

@Entity
@Table(name = "emp_register")   // matches your DB table
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class Employee {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;   // primary key

    
    @NotBlank(message = "Name is required")
    private String name;

    @Column( nullable = false, unique = true) 
    @Email(message = "Invalid email format")
    @NotBlank(message = "Email is required")
    private String email;   // 👈 matches DB column "email"

    @Size(min = 6, message = "Password must be at least 6 characters")
    private String password;

    @Min(value = 18, message = "Age must be at least 18")
    @Max(value = 65, message = "Age must be less than or equal to 65")
    private Integer age;

//    @NotBlank(message = "Gender is required")
    private String gender;
    
    @NotBlank(message = "Address is required")
    private String address;

    @NotBlank(message = "Role is required")
    private String role;

    @Pattern(regexp = "^[0-9]{10}$", message = "Phone number must be 10 digits")
    private String phone;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Integer getAge() {
		return age;
	}

	public void setAge(Integer age) {
		this.age = age;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	
}

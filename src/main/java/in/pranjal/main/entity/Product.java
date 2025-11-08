package in.pranjal.main.entity;

import org.springframework.web.multipart.MultipartFile;

import in.pranjal.main.url.OtherUrl;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name ="product")
@Data
@NoArgsConstructor
public class Product {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@Column(name = "product_name")
	private String productname;
	
	@Column(name= "description")
	private String description;
	
	@Column(name = "price")
	private String price;
	
	@Column(name= " category")
	private String category;
	
	@Column(name= "product_image_url" )
	private String productimage;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getProductname() {
		return productname;
	}
	public void setProductname(String productname) {
		this.productname = productname;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getProductimage() {
		return productimage;
	}
	public void setProductimage(MultipartFile file) {
		this.productimage = OtherUrl.IMAGE_UPLOAD_URL +  file.getOriginalFilename();
	}
	
}

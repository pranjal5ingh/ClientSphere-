package in.pranjal.main.controller;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import in.pranjal.main.entity.Product;
import in.pranjal.main.services.ProductServices;
import in.pranjal.main.url.OtherUrl;

@Controller
public class ProductController {

	 @Autowired
	 ProductServices productServices;
	 
	 
	 @GetMapping("/productAdd")
	 public String openProductsAddPage(Model model){
			
			 if (!model.containsAttribute("productAttr")) {
			        model.addAttribute("productAttr", new Product());
			 }
			 
			return "productsAdd";
		}
		
		@PostMapping("/addProductForm")
		public String addProductForm(
				@ModelAttribute("productAttr") Product product,
				@RequestParam("productimage") MultipartFile productImage,
				RedirectAttributes redAtt) {
			
			boolean statusImg = saveImage(productImage);
			if (!statusImg) {
		        redAtt.addFlashAttribute("error", true);
		        return "redirect:/productAdd";
		    }
			
			
			boolean status =  productServices.addProductService(product);
			
			if(status) redAtt.addFlashAttribute("success", true);
			else redAtt.addFlashAttribute("error", true);
			
			return "redirect:/productAdd";
		}
		
		private boolean saveImage(MultipartFile file) {
			
			boolean status = false;
			
			try {
				String fileName = file.getOriginalFilename();
			    Path filePath = Paths.get(OtherUrl.IMAGE_UPLOAD_FOLDER, fileName);
			    Files.copy(file.getInputStream(),filePath, StandardCopyOption.REPLACE_EXISTING);
			    status = true;
			}
			catch(Exception e) {
				status = false;
				e.printStackTrace();
			}
			return status;
		}
		
		@GetMapping("/productList")
		public String openProductsListPage(@RequestParam(value = "category", required = false) String category,
	                                       Model model){
			List<Product> productList ;
			
			if (category != null && !category.equalsIgnoreCase("all")) {
				productList = productServices.findByCategory(category);
	        } else {
	        	productList = productServices.getAllProductsListService();
	        }
			
			 // ✅ Fetch unique categories (from the same table)
	        List<String> categories = productServices.getAllCategories();
	        
	        
	        model.addAttribute("selectedCategory", category != null ? category : "all");
	        model.addAttribute("categories", categories);
	        model.addAttribute("model_products_list", productList);
	        
			return "productsList";
		}

}

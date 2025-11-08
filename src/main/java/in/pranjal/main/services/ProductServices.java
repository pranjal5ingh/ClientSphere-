package in.pranjal.main.services;

import java.util.List;

import in.pranjal.main.entity.Product;

public interface ProductServices {

	public boolean addProductService(Product product);
	public List<Product> getAllProductsListService();
    // ✅ Fetch all products by category
    List<Product> findByCategory(String category);
    
    List<String> getAllCategories();
    
}

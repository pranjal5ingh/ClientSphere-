package in.pranjal.main.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import in.pranjal.main.entity.Product;
import in.pranjal.main.repository.ProductRespository;

@Service
public class ProductServicesImplement implements ProductServices {
	
	@Autowired
	ProductRespository productrepository;
	
	@Override
	public boolean addProductService(Product product) {
		boolean status = false;
		try {
			productrepository.save(product);
			status = true;
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return status;
	}

	@Override
	public List<Product> getAllProductsListService() {
	
		return productrepository.findAll();
	}

	@Override
	public List<Product> findByCategory(String category) {

		return productrepository.findByCategory(category);
	}

	@Override
	public List<String> getAllCategories() {
		
		return productrepository.findAllCategories();
	}


}

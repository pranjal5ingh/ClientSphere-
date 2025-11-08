package in.pranjal.main.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import in.pranjal.main.entity.Product;

public interface ProductRespository extends JpaRepository<Product, Integer> {
	 List<Product> findByCategory(String category);
	 
	 
	 @Query("SELECT DISTINCT p.category FROM Product p ORDER BY p.category ASC")
	    List<String> findAllCategories();
}

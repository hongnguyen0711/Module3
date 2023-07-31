package product_management.repository;

import product_management.model.Product;

import java.util.Map;

public interface IProductRepository {
    void insertProduct(Product product);
    void updateProduct(int id, Product product);
    void deleteProduct(int id,boolean available);
    Map<Integer, Product> findAll();
    Product findById(int id);
}

package product_management.service;

import product_management.model.Product;

import java.util.Map;

public interface IProductService {
    Map<Integer, Product> findAll();
    void save(Product product);
    Product findById(int id);
    void update(int id, Product product);
    void remove(int id, boolean available);
    Product searchProduct(String name);
}

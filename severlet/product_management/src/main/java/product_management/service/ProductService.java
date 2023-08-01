package product_management.service;

import product_management.model.Product;
import product_management.repository.IProductRepository;
import product_management.repository.ProductRepository;

import java.util.Map;

public class ProductService implements IProductService {
    IProductRepository repository = new ProductRepository();

    @Override
    public Map<Integer, Product> findAll() {
        return repository.findAll();
    }

    @Override
    public void save(Product product) {
        repository.insertProduct(product);
    }

    @Override
    public Product findById(int id) {
        return repository.findById(id);
    }

    @Override
    public void update(int id, Product product) {
        repository.updateProduct(id,product);
    }

    @Override
    public void remove(int id, boolean available) {
        repository.deleteProduct(id, available);
    }

    @Override
    public Product searchProduct(String name) {
        return repository.searchProduct(name);
    }
}

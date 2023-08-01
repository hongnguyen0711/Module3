package product_management.repository;

import product_management.model.Product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ProductRepository implements IProductRepository {
    public static final String INSERT = "insert into product (name, price, description, producer, status) value (?,?,?,?,?)";
    public static final String SELECT_ALL = "select * from product where status = ?";
    public static final String DELETE = "update product set status = 1 where id = ?";
    public static final String AVAILABLE = "update product set status = 0 where id = ?";
    public static final String UPDATE = "update product set " +
                                        "name = ?," +
                                        "price = ?," +
                                        "description = ?," +
                                        "producer = ?," +
                                        "status = ? " +
                                        " where id = ?";
    public static final String SEARCH = "select * from product where name = ?";

    @Override
    public void insertProduct(Product product) {
        Connection connection = Base.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT);
            preparedStatement.setString(1, product.getName());
            preparedStatement.setDouble(2, product.getPrice());
            preparedStatement.setString(3, product.getDescription());
            preparedStatement.setString(4, product.getProducer());
            preparedStatement.setInt(5, product.getStatus());
            preparedStatement.executeUpdate();
            connection.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }

    @Override
    public void updateProduct(int id, Product product) {
        Connection connection = Base.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(UPDATE);
            preparedStatement.setString(1, product.getName());
            preparedStatement.setDouble(2, product.getPrice());
            preparedStatement.setString(3, product.getDescription());
            preparedStatement.setString(4, product.getProducer());
            preparedStatement.setInt(5, product.getStatus());
            preparedStatement.setInt(6, id);

            preparedStatement.executeUpdate();
            connection.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }

    @Override
    public void deleteProduct(int id, boolean available) {
        Connection connection = Base.getConnection();
        try {
            PreparedStatement preparedStatement;
            if (available) {
                preparedStatement = connection.prepareStatement(DELETE);
                preparedStatement.setInt(1, id);
            } else {
                preparedStatement = connection.prepareStatement(AVAILABLE);
                preparedStatement.setInt(1, id);
            }
            preparedStatement.executeUpdate();
            connection.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public Map<Integer, Product> findAll() {
        Map<Integer, Product> product = new HashMap<>();
        Connection connection = Base.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL);
            preparedStatement.setInt(1,0);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                double price = resultSet.getDouble("price");
                String description = resultSet.getString("description");
                String producer = resultSet.getString("producer");
                int status = resultSet.getInt("status");

                product.put(id, new Product(id, name, price, description, producer, status));
            }
            connection.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return product;
    }


    @Override
    public Product findById(int id) {
        return findAll().get(id);
    }
    @Override
    public Product searchProduct(String name) {
        Connection connection = Base.getConnection();
        Product product = null;
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SEARCH);
            preparedStatement.setString(1, name);

            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String nameSearch = resultSet.getString("name");
                double price = resultSet.getDouble("price");
                String description = resultSet.getString("description");
                String producer = resultSet.getString("producer");
                int status = resultSet.getInt("status");

                product = new Product(id, nameSearch, price, description, producer, status);
            }
            connection.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return product;
    }
}

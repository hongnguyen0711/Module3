package repository;

import model.User;

import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class UserRepository implements IUserRepository {
    private static final String INSERT_USERS_SQL = "{call insert_user(?,?,?)}";

    private static final String SELECT_USER_BY_ID = "{call get_user_by_id(?)}";
    private static final String SELECT_ALL_USERS = "call get_all_users()";
    private static final String DELETE_USERS_SQL = "call sp_delete_user(?)";
    private static final String UPDATE_USERS_SQL = "call sp_update_user(?,?,?,?)";
    private static final String SEARCH_USERS = "select * from users where country = ?;";
    private static final String SORT_BY_NAME = "select * from users order by name;";

    @Override
    public void insertUser(User user) {
        Connection connection = Base.getConnection();
        try {
            CallableStatement callableStatement = connection.prepareCall(INSERT_USERS_SQL);
            callableStatement.setString(1, user.getName());
            callableStatement.setString(2, user.getEmail());
            callableStatement.setString(3, user.getCountry());
            callableStatement.executeUpdate();
            connection.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public User selectUser(int id) {

        return selectAllUsers().get(id);
    }

    @Override
    public Map<Integer, User> selectAllUsers() {
        Connection connection = Base.getConnection();
        Map<Integer, User> userMap = new HashMap<>();
        try {
            CallableStatement callableStatement = connection.prepareCall(SELECT_ALL_USERS);
            ResultSet resultSet = callableStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                String email = resultSet.getString("email");
                String country = resultSet.getString("country");
                User user = new User(id, name, email, country);
                userMap.put(id, user);
            }
            connection.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return userMap;
    }

    @Override
    public void deleteUser(int id) {
        Connection connection = Base.getConnection();
        try {
            CallableStatement callableStatement = connection.prepareCall(DELETE_USERS_SQL);
            callableStatement.setInt(1, id);
            callableStatement.executeUpdate();
            connection.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }

    @Override
    public void updateUser(int id, User user) {
        Connection connection = Base.getConnection();
        try {
            CallableStatement callableStatement = connection.prepareCall(UPDATE_USERS_SQL);
            callableStatement.setString(1, user.getName());
            callableStatement.setString(2, user.getEmail());
            callableStatement.setString(3, user.getCountry());
            callableStatement.setInt(4, id);

            callableStatement.executeUpdate();
            connection.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }

    @Override
    public User search(String country) {
        Connection connection = Base.getConnection();
        User user = null;
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SEARCH_USERS);
            preparedStatement.setString(1, country);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                String email = resultSet.getString("email");
                user = new User(id, name, email, country);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return user;
    }

    @Override
    public List<User> sortByName() {
        Connection connection = Base.getConnection();
        List<User> list = new ArrayList<>();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SORT_BY_NAME);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                String email = resultSet.getString("email");
                String country = resultSet.getString("country");

                list.add(new User(id,name,email,country));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return list;
    }
}

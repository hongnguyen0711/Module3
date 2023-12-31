package repository;

import model.Account;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

public class AccountRepository implements IAccountRepository {
    public static final String SELECT_ACCOUNT = "select * from accounts where account_username = ? and account_password = ? and is_delete = ?;";
    public static final String INSERT_ACCOUNT = "insert into accounts(account_username, account_password, is_delete, role_id) value (?,?,0,2)";
    public static final String CHECK_ACCOUNT = "select * from accounts where account_username = ? ";
    public static final String SELECT_ALL = "select * from accounts ;";
    public static final String UPDATE_ACCOUNT = "update accounts set account_username = ?, account_password = ?, is_delete = ?, role_id = ? where account_id = ? ";

    public static final String FIND_BY_ID = "select * from accounts where account_id = ?";
    public static final String CREATE_ACCOUNT = "insert into accounts (account_username, account_password, is_delete, role_id) value(?,?,?,?) ";
    public static final String FIND_BY_USERNAME = "select * from accounts where account_username = ?";
    public static final String DELETE = "update accounts set is_delete = 1 where account_id = ?";
    public static final String AVAILABLE = "update accounts set is_delete = 0 where account_id = ?";

    @Override
    public Account login(String user, String password) {
        Connection connection = Base.getConnection();

        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ACCOUNT);
            preparedStatement.setString(1, user);
            preparedStatement.setString(2, password);
            preparedStatement.setInt(3, 0);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                return new Account(resultSet.getInt(1),
                        resultSet.getString(2),
                        resultSet.getString(3),
                        resultSet.getInt(4),
                        resultSet.getInt(5));
            }
            connection.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return null;
    }

    @Override
    public void insertAccount(String userName, String passWord) {
        Connection connection = Base.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_ACCOUNT);
            preparedStatement.setString(1, userName);
            preparedStatement.setString(2, passWord);
            preparedStatement.executeUpdate();
            connection.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public Account findById(int id) {
        Connection connection = Base.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(FIND_BY_ID);
            preparedStatement.setInt(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                String userName = resultSet.getString(2);
                String pass = resultSet.getString(3);
                int status = resultSet.getInt(4);
                int role = resultSet.getInt(5);
                return new Account(id, userName, pass, status, role);
            }
            connection.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return null;
    }

    @Override
    public Account checkAccount(String userName) {
        Connection connection = Base.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(CHECK_ACCOUNT);
            preparedStatement.setString(1, userName);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt(1);
                String pass = resultSet.getString(3);
                int status = resultSet.getInt(4);
                int role = resultSet.getInt(5);
                return new Account(id, userName, pass, status, role);
            }
            connection.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return null;
    }

    @Override
    public Map<String, Account> getAll() {
        Map<String, Account> accounts = new HashMap<>();
        Connection connection = Base.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt(1);
                String userName = resultSet.getString(2);
                String passWord = resultSet.getString(3);
                int status = resultSet.getInt(4);
                int role = resultSet.getInt(5);
                accounts.put(userName, new Account(id, userName, passWord, status, role));
            }
            connection.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return accounts;
    }

    public void editAccount(int id, Account account) {
        Connection connection = Base.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_ACCOUNT);
            preparedStatement.setString(1, account.getUsername());
            preparedStatement.setString(2, account.getPassword());
            preparedStatement.setInt(3, account.getStatus());
            preparedStatement.setInt(4, account.getRole());
            preparedStatement.setInt(5, id);

            preparedStatement.executeUpdate();
            connection.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public void createAccount(Account account) {
        Connection connection = Base.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(CREATE_ACCOUNT);
            preparedStatement.setString(1, account.getUsername());
            preparedStatement.setString(2, account.getPassword());
            preparedStatement.setInt(3, account.getStatus());
            preparedStatement.setInt(4, account.getRole());

            preparedStatement.executeUpdate();
            connection.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public Account findByName(String userName) {
        Connection connection = Base.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(FIND_BY_USERNAME);
            preparedStatement.setString(1, userName);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                return new Account(userName, resultSet.getString(3), resultSet.getInt(4), resultSet.getInt(5));
            }
            connection.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return null;
    }

    public void deleteAccount(int id, boolean available) {
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
}


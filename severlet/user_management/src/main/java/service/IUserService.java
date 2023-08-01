package service;

import model.User;

import java.util.Map;

public interface IUserService {
    public void insertUser(User user);

    public User selectUser(int id);

    public Map<Integer,User> selectAllUsers();

    public void deleteUser(int id);

    public void updateUser(int id,User user);
    public User search(String country);
}

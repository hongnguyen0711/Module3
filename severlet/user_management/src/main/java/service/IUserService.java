package service;

import model.User;

import java.awt.*;
import java.util.List;
import java.util.Map;

public interface IUserService {
     void insertUser(User user);

     User selectUser(int id);

     Map<Integer,User> selectAllUsers();

     void deleteUser(int id);

     void updateUser(int id,User user);
     User search(String country);

     List<User> sortByName();

}

package repository;

import model.User;

import java.util.List;
import java.util.Map;

public interface IUserRepository {
     void insertUser(User user);

     User selectUser(int id);

     Map<Integer,User> selectAllUsers();

     void deleteUser(int id);

     void updateUser(int id,User user);
     User search(String name);
    List<User> sortByName();
}

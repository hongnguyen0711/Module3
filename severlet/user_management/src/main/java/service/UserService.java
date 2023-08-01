package service;

import model.User;
import repository.IUserRepository;
import repository.UserRepository;

import java.util.Map;

public class UserService implements IUserService {
    IUserRepository repository = new UserRepository();

    @Override
    public void insertUser(User user) {
        repository.insertUser(user);
    }

    @Override
    public User selectUser(int id) {
        return repository.selectUser(id);
    }

    @Override
    public Map<Integer, User> selectAllUsers() {
        return repository.selectAllUsers();
    }

    @Override
    public void deleteUser(int id) {
        repository.deleteUser(id);
    }

    @Override
    public void updateUser(int id, User user) {
        repository.updateUser(id, user);
    }

    @Override
    public User search(String country) {
       return repository.search(country);
    }
}

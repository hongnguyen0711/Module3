package repository;

import model.Account;

import java.util.Map;

public interface IAccountRepository {
    Map<String, Account> getAll();

    Account login(String user, String password);

    Account checkAccount(String userName);

    void insertAccount(String userName, String password);

    Account findById(int id);

    void editAccount(int id, Account account);

    void createAccount(Account account);

    Account findByName(String userName);

    void deleteAccount(int id, boolean b);
}

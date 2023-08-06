package service;

import model.Account;
import repository.AccountRepository;
import repository.IAccountRepository;

import java.util.Map;

public class AccountService implements IAccountService {

    IAccountRepository repository = new AccountRepository();

    @Override
    public Map<String, Account> getAll() {
        return repository.getAll();
    }

    @Override
    public Account login(String user, String password) {
        return repository.login(user,password);
    }

    @Override
    public Account checkAccount(String userName) {
        return repository.checkAccount(userName);
    }

    @Override
    public void signUp(String userName, String password) {
        repository.insertAccount(userName,password);
    }

    @Override
    public Account findById(int id) {
        return repository.findById(id);
    }

    @Override
    public void editAccount(int id, Account account) {
        repository.editAccount(id, account);
    }

    @Override
    public void createAcction(Account account) {
        repository.createAccount(account);
    }

    @Override
    public Account findByName(String userName) {
        return repository.findByName(userName);
    }

    @Override
    public void deleteAccount(int id, boolean b) {
        repository.deleteAccount(id, b);
    }
}

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
}

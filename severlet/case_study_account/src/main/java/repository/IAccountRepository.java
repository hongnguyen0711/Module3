package repository;

import model.Account;

import java.util.Map;

public interface IAccountRepository {
    Map<String, Account> getAll();
}

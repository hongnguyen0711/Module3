package service;

import model.Account;

import java.util.Map;

public interface IAccountService {

    Map<String, Account> getAll();
}

package service;

import model.Role;
import repository.IRoleRepository;
import repository.RoleRepository;

import java.util.List;

public class RoleService implements IRoleService{
    IRoleRepository roleRepository = new RoleRepository();

    @Override
    public List<Role> getRole() {
        return roleRepository.getRole();
    }
}

package stopheracleum.service;

import stopheracleum.model.Role;

import java.util.List;

/**
 * Created by michael on 02.08.17.
 */
public interface RoleService {
    Role findById(int id);

    Role findByName(String name);

    List<Role> findAll();
}

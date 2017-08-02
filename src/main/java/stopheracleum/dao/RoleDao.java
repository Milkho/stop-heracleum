package stopheracleum.dao;

import stopheracleum.model.Role;

import java.util.List;

/**
 * Created by michael on 02.08.17.
 */
public interface RoleDao {
    List<Role> findAll();

    Role findByName(String name);

    Role findById(int id);
}

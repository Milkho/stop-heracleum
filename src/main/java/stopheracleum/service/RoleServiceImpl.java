package stopheracleum.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import stopheracleum.dao.RoleDao;
import stopheracleum.model.Role;

import java.util.List;

/**
 * Created by michael on 02.08.17.
 */
@Service("roleService")
@Transactional
public class RoleServiceImpl implements RoleService{

    @Autowired
    RoleDao dao;

    public Role findById(int id) {
        return dao.findById(id);
    }

    public Role findByName(String name){
        return dao.findByName(name);
    }

    public List<Role> findAll() {
        return dao.findAll();
    }
}


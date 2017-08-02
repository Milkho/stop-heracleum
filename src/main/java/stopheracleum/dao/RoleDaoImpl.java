package stopheracleum.dao;

import org.hibernate.Criteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;
import stopheracleum.model.Role;

import java.util.List;

/**
 * Created by michael on 02.08.17.
 */
@Repository("roleDao")
public class RoleDaoImpl extends AbstractDao<Integer, Role>implements RoleDao{

    public Role findById(int id) {
        return getByKey(id);
    }

    public Role findByName(String name) {
        Criteria criteria = createEntityCriteria();
        criteria.add(Restrictions.eq("name", name));
        return (Role) criteria.uniqueResult();
    }

    @SuppressWarnings("unchecked")
    public List<Role> findAll(){
        Criteria criteria = createEntityCriteria();
        criteria.addOrder(Order.asc("type"));
        return (List<Role>)criteria.list();
    }

}
package stopheracleum.dao;

import org.hibernate.Criteria;
import org.hibernate.Hibernate;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import stopheracleum.model.User;

import java.util.List;

/**
 * Created by michael on 02.08.17.
 */

@Repository("userDao")
public class UserDaoImpl extends AbstractDao<Integer, User> implements UserDao {

    public User findById(int id) {
        User user = getByKey(id);
        if (user != null) {
            Hibernate.initialize(user.getPoints());
        }
        return user;
    }

    public User findBySSO(String sso) {
        Criteria criteria = createEntityCriteria();
        criteria.add(Restrictions.eq("ssoId", sso));
        User user = (User) criteria.uniqueResult();
        if (user != null) {
            Hibernate.initialize(user.getPoints());
        }
        return user;
    }

    @SuppressWarnings("unchecked")
    public List<User> findAllUsers() {
        Criteria criteria = createEntityCriteria().addOrder(Order.asc("username"));
        criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);//To avoid duplicates.
        List<User> users = (List<User>) criteria.list();

        return users;
    }

    public void save(User user) {
        persist(user);
    }

    public void deleteBySSO(String sso) {
        Criteria criteria = createEntityCriteria();
        criteria.add(Restrictions.eq("ssoId", sso));
        User user = (User) criteria.uniqueResult();
        delete(user);
    }

}

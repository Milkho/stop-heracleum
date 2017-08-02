package stopheracleum.dao;

import stopheracleum.model.User;

import java.util.List;

/**
 * Created by michael on 02.08.17.
 */
public interface UserDao {
    User findById(int id);

    User findBySSO(String sso);

    void save(User user);

    void deleteBySSO(String sso);

    List<User> findAllUsers();
}
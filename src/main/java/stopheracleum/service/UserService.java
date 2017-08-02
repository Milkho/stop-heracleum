package stopheracleum.service;

import stopheracleum.model.User;

import java.util.List;

/**
 * Created by michael on 02.08.17.
 */
public interface UserService {
    User findById(int id);

    User findBySSO(String sso);

    void saveUser(User user);

    void updateUser(User user);

    void deleteUserBySSO(String sso);

    List<User> findAllUsers();

    boolean isUserSSOUnique(Integer id, String sso);

}

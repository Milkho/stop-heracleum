package stopheracleum.service;

import stopheracleum.model.User;

/**
 * Service class for {@link stopheracleum.model.User}
 */

public interface UserService {

    void save(User user);

    User findByUsername(String username);
}

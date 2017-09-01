package stopheracleum.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import stopheracleum.model.User;

public interface UserDao extends JpaRepository<User, Long> {
    User findByUsername(String username);
}

package stopheracleum.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import stopheracleum.model.User;

import java.util.List;


public interface UserDao extends JpaRepository<User, Long> {
    User findByUsername(String username);

}
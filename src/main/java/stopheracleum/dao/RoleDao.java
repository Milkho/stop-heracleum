package stopheracleum.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import stopheracleum.model.Role;

public interface RoleDao extends JpaRepository<Role, Long> {
}

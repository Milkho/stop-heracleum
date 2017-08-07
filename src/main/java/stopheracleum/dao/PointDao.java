package stopheracleum.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import stopheracleum.model.Point;


import java.util.List;

public interface PointDao extends JpaRepository<Point, Long> {

}

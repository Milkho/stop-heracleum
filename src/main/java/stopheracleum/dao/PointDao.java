package stopheracleum.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import stopheracleum.model.Point;

import java.util.List;


public interface PointDao extends JpaRepository<Point, Long> {
    @SuppressWarnings("unchecked")
    @Override
    Point save(Point point);

    @Override
    List<Point> findAll();

    @Override
    void deleteInBatch(Iterable <Point> points);

    @Override
    Point getOne(Long id);
}
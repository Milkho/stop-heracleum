package stopheracleum.service;


import stopheracleum.model.Point;

import java.util.List;

/**
 * Service class for {@link stopheracleum.model.Point}
 */

public interface PointService {

    void addPoint(Point point);

    List<Point> findAllPoints();

    Point getOne(Long id);

    void deleteInBatch(Iterable<Point> points);
}

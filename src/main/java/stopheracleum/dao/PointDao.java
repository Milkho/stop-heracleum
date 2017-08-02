package stopheracleum.dao;

import stopheracleum.model.Point;


import java.util.List;

/**
 * Created by michael on 02.08.17.
 */
public interface PointDao {

    void save(Point point);

    void delete(Point point);

    Point findById(int id);

    List<Point> findByUserID(int userID);

    List<Point> findAll(int userID);
}

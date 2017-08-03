package stopheracleum.service;

import stopheracleum.model.Point;
import stopheracleum.model.User;

import java.util.List;

/**
 * Created by michael on 02.08.17.
 */
public interface PointService {

    Point findById(int id);

    void savePoint(Point point);

    void updatePoint(Point point);

    List<User> findAllPointByUserID(int userId);

}

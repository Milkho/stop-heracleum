package stopheracleum.service;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import stopheracleum.model.Point;
import stopheracleum.model.User;

import java.util.List;

/**
 * Created by michael on 02.08.17.
 */

@Service("pointService")
@Transactional
public class PointServiceImpl implements PointService{
    @Override
    public Point findById(int id) {
        //TODO
        return null;
    }

    @Override
    public void savePoint(Point point) {
        //TODO
    }

    @Override
    public void updatePoint(Point point) {
        //TODO
    }

    @Override
    public List<User> findAllPointByUserID(int userId) {
        //TODO
        return null;
    }
}

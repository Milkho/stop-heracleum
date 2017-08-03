package stopheracleum.dao.hibernateimpl;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import stopheracleum.dao.PointDao;
import stopheracleum.model.Point;

import java.util.List;

/**
 * Created by michael on 02.08.17.
 */
public class PointDaoImpl implements PointDao {

    @Autowired
    private SessionFactory sessionFactory;


    @Override
    public void save(Point point) {
        //TODO
    }

    @Override
    public void delete(Point point) {
        //TODO
    }

    @Override
    public Point findById(int id) {
        //TODO
        return null;
    }

    @Override
    public List<Point> findByUserID(int userID) {
        //TODO
        return null;
    }

    @Override
    public List<Point> findAll(int userID) {
        //TODO
        return null;
    }
}

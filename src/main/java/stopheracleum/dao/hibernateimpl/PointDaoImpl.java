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

    public void addPoint(Point point) {
        sessionFactory.getCurrentSession().save(point);
    }

    public void updatePoint(Point point) {
        Point pointToUpdate = getPoint(point.getId());

        pointToUpdate.setLatitude(point.getLatitude());
        pointToUpdate.setLongtitude(point.getLongtitude());
        pointToUpdate.setDate(point.getDate());
        pointToUpdate.setPhotoLink(point.getPhotoLink());
        pointToUpdate.setUser(point.getUser());

        sessionFactory.getCurrentSession().update(pointToUpdate);
    }

    public Point getPoint(int id) {
        return sessionFactory.getCurrentSession().get(Point.class, id);
    }

    public void deletePoint(int id) {
        Point point = getPoint(id);
        if(point!=null){
            sessionFactory.getCurrentSession().delete(point);
        }
    }

    @SuppressWarnings("unchecked")
    public List<Point> getPoints() {
        return sessionFactory.getCurrentSession().createQuery("").list();
    }
}

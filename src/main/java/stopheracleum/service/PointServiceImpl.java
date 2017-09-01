package stopheracleum.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import stopheracleum.dao.PointDao;
import stopheracleum.model.Point;

import java.util.Date;
import java.util.List;

@Service
public class PointServiceImpl implements PointService {

    @Autowired
    private PointDao pointDao;

    @Autowired
    private UserService userService;

    @Override
    @Transactional
    public void addPoint(Point point) {
        point.setUser(userService.getCurrentlyAuthenticatedUser());
        pointDao.save(point);
    }

    @Override
    @Transactional
    public Point getOne(Long id){
        return pointDao.getOne(id);
    }

    @Override
    @Transactional
    public List<Point> findAllPoints() {
        return pointDao.findAll();
    }

    @Override
    @Transactional
    public void deleteInBatch(Iterable<Point> points) {
        pointDao.deleteInBatch(points);
    }
}

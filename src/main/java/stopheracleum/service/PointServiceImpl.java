package stopheracleum.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import stopheracleum.dao.PointDao;
import stopheracleum.model.Point;

import java.util.Date;

@Service
public class PointServiceImpl implements PointService {

    @Autowired
    private PointDao pointDao;

    @Autowired
    private UserService userService;


    @Override
    public void save(Point point) {
        point.setUser(userService.getCurrentlyAuthenticatedUser());
        //point.setPhotoLink("sds");
        pointDao.save(point);
    }
}

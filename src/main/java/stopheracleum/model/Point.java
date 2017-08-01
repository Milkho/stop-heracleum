package stopheracleum.model;

import java.util.Date;
import javax.persistence.*;
import org.hibernate.validator.constraints.NotEmpty;

/**
 * Created by michael on 01.08.17.
 */
@Entity
@Table(name = "point")
public class Point {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column (name = "latitude")
    @NotEmpty
    private Double latitude;

    @Column (name = "longitude")
    @NotEmpty
    private Double longitude;

    @Column (name = "date")
    @NotEmpty
    private Date date = new Date();

    @Column (name = "photo_link")
    @NotEmpty
    private String photoLink;

    @ManyToOne
    @JoinColumn (name = "user_id")
    private User user;

    public Point (){

    }

    public Point(Integer id, User user, Double latitude, Double longitude, Date date, String photoLink) {
        this.id = id;
        this.user = user;
        this.latitude = latitude;
        this.longitude = longitude;
        this.date = date;
        this.photoLink = photoLink;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Double getLatitude() {
        return latitude;
    }

    public void setLatitude(Double latitude) {
        this.latitude = latitude;
    }

    public Double getLongtitude() {
        return longitude;
    }

    public void setLongtitude(Double longtitude) {
        this.longitude = longtitude;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public String getPhotoLink() {
        return photoLink;
    }

    public void setPhotoLink(String photoLink) {
        this.photoLink = photoLink;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof Point)) return false;

        Point point = (Point) o;

        if (id != point.id) return false;
        if (user != point.user) return false;
        if (!latitude.equals(point.latitude)) return false;
        if (!longitude.equals(point.longitude)) return false;
        if (!date.equals(point.date)) return false;
        return photoLink != null ? photoLink.equals(point.photoLink) : point.photoLink == null;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + latitude.hashCode();
        result = 31 * result + longitude.hashCode();
        result = 31 * result + date.hashCode();
        result = 31 * result + (photoLink != null ? photoLink.hashCode() : 0);
        return result;
    }


}

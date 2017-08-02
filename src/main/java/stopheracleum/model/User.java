package stopheracleum.model;

import java.io.Serializable;
import java.util.*;

import javax.persistence.*;
import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.beans.support.MutableSortDefinition;
import org.springframework.beans.support.PropertyComparator;


/**
 * Created by michael on 01.08.17.
 */
@Entity
@Table(name = "user")
public class User implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name = "sso_id", nullable=false)
    @NotEmpty
    private String ssoID;

    @Column(name = "first_name", nullable=false)
    @NotEmpty
    private String firstName;

    @Column(name = "last_name", nullable=false)
    @NotEmpty
    private String lastName;

    @Column(name = "email", nullable=false)
    @NotEmpty
    private String email;

    @Column(name = "username", unique=true, nullable=false)
    @NotEmpty
    private String username;

    @Column(name = "password", nullable=false)
    @NotEmpty
    private String password;

    @ManyToOne
    @JoinColumn (name = "role_id")
    private Role role;

    @OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "user")
    private Set<Point> points;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getSsoID() {
        return ssoID;
    }

    public void setSsoID(String ssoID) {
        this.ssoID = ssoID;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }


    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    private Set<Point> getPointsInternal() {
        if (this.points == null) {
            this.points = new HashSet<Point>();
        }
        return this.points;
    }

    public List<Point> getPoints() {
        List<Point> sortedPoints = new ArrayList<Point>(getPointsInternal());
        PropertyComparator.sort(sortedPoints, new MutableSortDefinition("id", false, false));
        return Collections.unmodifiableList(sortedPoints);
    }

    public void addPoint(Point point) {
        getPointsInternal().add(point);
        point.setUser(this);
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof User)) return false;

        User user = (User) o;

        if (!id.equals(user.id)) return false;
        if (!firstName.equals(user.firstName)) return false;
        if (!lastName.equals(user.lastName)) return false;
        if (!email.equals(user.email)) return false;
        if (!username.equals(user.username)) return false;
        if (!password.equals(user.password)) return false;
        return points != null ? points.equals(user.points) : user.points == null;
    }

    @Override
    public int hashCode() {
        int result = id.hashCode();
        result = 31 * result + firstName.hashCode();
        result = 31 * result + lastName.hashCode();
        result = 31 * result + email.hashCode();
        result = 31 * result + username.hashCode();
        result = 31 * result + password.hashCode();
        return result;
    }

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", firstName='" + firstName + '\'' +
                ", lastName='" + lastName + '\'' +
                ", email='" + email + '\'' +
                ", username='" + username + '\'' +
                ", password='" + password + '\'' +
                '}';
    }
}

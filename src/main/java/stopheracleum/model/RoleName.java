package stopheracleum.model;

import java.io.Serializable;

/**
 * Created by michael on 02.08.17.
 */
public enum RoleName implements Serializable {
    USER("user"),
    ADMIN("admin");

    String roleName;

    private RoleName(String roleName){
        this.roleName = roleName;
    }

    public String getRoleName(){
        return roleName;
    }

}

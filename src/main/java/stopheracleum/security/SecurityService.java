package stopheracleum.security;

/**
 * Service for enabling security features.
 */

public interface SecurityService {

    String findLoggedInUsername();

    void autoLogin(String username, String password);
}
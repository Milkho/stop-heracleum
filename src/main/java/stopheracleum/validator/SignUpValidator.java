package stopheracleum.validator;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;
import stopheracleum.model.User;
import stopheracleum.service.UserService;

import java.util.Objects;
import java.util.regex.Pattern;

/**
 * Validator for sign up form
 * implements {@link Validator} interface.
 */

@Component
public class SignUpValidator implements Validator {

    @Autowired
    private UserService userService;

    // regular expression for username validation
    private static final String USERNAME_PATTERN = "^[a-z0-9_-]$";

    @Override
    public boolean supports(Class<?> aClass) {
        return User.class.equals(aClass);
    }

    @Override
    public void validate(Object o, Errors errors) {
        User user = (User) o;
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "firstName", "Required");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "lastName", "Required");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "email", "Required");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "username", "Required");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "password", "Required");

        if (user.getUsername().length() < 4 || user.getUsername().length() > 32) {
            errors.rejectValue("username", "Size.userForm.username");
        }

        //validate with regular expression
        else if (!Pattern.compile(USERNAME_PATTERN).matcher(user.getUsername()).matches()) {
            errors.rejectValue("username", "Invalid.userForm.username");
        }
        else if (userService.findByUsername(user.getUsername()) != null) {
            errors.rejectValue("username", "Duplicate.userForm.username");
        }

        if (!user.getConfirmPassword().equals(user.getPassword())) {
            errors.rejectValue("confirmPassword", "Different.userForm.password");
        }


    }
}

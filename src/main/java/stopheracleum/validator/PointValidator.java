package stopheracleum.validator;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;
import org.springframework.stereotype.Component;
import stopheracleum.model.Point;

/**
 * Validator for {@link stopheracleum.model.Point} class,
 * implements {@link Validator} interface.
 */
@Component
public class PointValidator implements Validator {
    @Override
    public boolean supports(Class<?> aClass) {
        return Point.class.equals(aClass);
    }

    @Override
    public void validate(Object o, Errors errors) {
        Point point = (Point) o;

        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "latitude", "Required");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "longitude", "Required");


    }
}



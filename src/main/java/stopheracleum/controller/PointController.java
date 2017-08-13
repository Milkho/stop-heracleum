package stopheracleum.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import stopheracleum.model.Point;
import stopheracleum.service.PointService;
import stopheracleum.validator.PointValidator;

/**
 * Controller for {@link stopheracleum.model.Point}'s pages.
 */

@Controller
public class PointController {

    @Autowired
    private PointService pointService;

    @Autowired
    private PointValidator pointValidator;

    @RequestMapping(value = "/map", method = RequestMethod.GET)
    public String map(Model model) {
        return "map";
    }


    @RequestMapping(value = "/map", method = RequestMethod.POST)
    public String point(@ModelAttribute("pointForm") Point pointForm, BindingResult bindingResult, Model model) {
        pointValidator.validate(pointForm, bindingResult);

        if (bindingResult.hasErrors()) {
            return "map";
        }

        pointService.save(pointForm);

        return "map";
    }

}

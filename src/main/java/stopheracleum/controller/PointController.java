package stopheracleum.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import stopheracleum.model.Point;
import stopheracleum.service.PointService;
import stopheracleum.service.UserService;
import stopheracleum.validator.PointValidator;

import java.util.Collections;
import java.util.List;

/**
 * Controller for {@link stopheracleum.model.Point}'s pages.
 */
@Controller
public class PointController {

    @Autowired
    private PointService pointService;

    @Autowired
    private PointValidator pointValidator;

    @Autowired
    private UserService userService;

    private List<Point> points;

    @RequestMapping(value = "/map", method = RequestMethod.GET)
    public String map(Model model) {

        points = pointService.findAllPoints();
        model.addAttribute("points", points);

        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (!(auth instanceof AnonymousAuthenticationToken) && auth != null) {
            model.addAttribute("pointForm", new Point());
            model.addAttribute("currentUserId", userService.getCurrentlyAuthenticatedUser().getId());
        }
        return "map";
    }


    @RequestMapping(value = "/map", method = RequestMethod.POST)
    public String point(@ModelAttribute("pointForm") Point pointForm, BindingResult bindingResult, Model model,
                        final RedirectAttributes redirectAttributes) {
        if (points == null) {
            points = pointService.findAllPoints();
        }
        model.addAttribute("points", points);

        pointValidator.validate(pointForm, bindingResult);

        if (bindingResult.hasErrors()) {
            return "map";
        }

        pointService.addPoint(pointForm);

        redirectAttributes.addAttribute("success", "true");

        return "redirect:map";
    }

    @RequestMapping(value = "/map/remove-point", method = RequestMethod.POST   )
    public String removePoint(@RequestParam("pointId") Long pointIdToRemove) {
        pointService.deleteInBatch(Collections.singletonList(pointService.getOne(pointIdToRemove)));
        System.out.println("it's ok");
        return "redirect:/map";
    }
}

package stopheracleum.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.Locale;


@Controller
public class MainController {

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String home(Locale locale, Model model) {
        return "index";
    }

    @RequestMapping(value = "/contact", method = RequestMethod.GET)
    public String contact(Locale locale, Model model) {
        return "contact";
    }

}

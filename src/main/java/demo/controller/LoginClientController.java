package demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
@RequestMapping
public class LoginClientController {
    @RequestMapping(value = {"/login"}, method = RequestMethod.GET)
    public String getIndex(ModelMap model) {

        return "loginClient";
    }

    @RequestMapping(value = {"/signUp"}, method = RequestMethod.GET)
    public String signUp(ModelMap model) {

        return "signUp";
    }
}

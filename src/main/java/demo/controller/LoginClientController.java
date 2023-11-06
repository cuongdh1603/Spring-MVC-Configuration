package demo.controller;

import demo.model.Client;
import demo.serviceImpl.ClientServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
@RequestMapping
public class LoginClientController {
    
    @Autowired
    private ClientServiceImpl clientServiceImpl;
    
    @RequestMapping(value = {"/login"}, method = RequestMethod.GET)
    public String getIndex(ModelMap model) {
        Client client = new Client();
        model.addAttribute("client", client);
        return "loginClient";
    }
    
    @RequestMapping(value = {"/post-login"}, method = RequestMethod.POST)
    public String doLogin(@ModelAttribute("client") Client client) {
        System.out.println(client.getUsername() + " " + client.getPassword());
        Client loggedInClient = clientServiceImpl.checkClientExist(client);
        if(loggedInClient == null){
            System.out.println("Dang nhap that bai");
        }
        else{
            System.out.println("Dang nhap thanh cong");
        }
        return "redirect:/user";
    }

    @RequestMapping(value = {"/signUp"}, method = RequestMethod.GET)
    public String signUp(ModelMap model) {
        
        return "signUp";
    }
}

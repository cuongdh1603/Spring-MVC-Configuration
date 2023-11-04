package demo.controller;

import demo.model.Client;
import demo.service.ClientSerVice;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.List;

@Controller
public class ClientController {
    @Autowired
    private ClientSerVice serVice;
    @RequestMapping(value = {"/client"}, method = RequestMethod.GET)
    public String getIndex(ModelMap model)  {
        List<Client> clients = serVice.getAllClient();
        System.out.println(clients);
        model.addAttribute("clients", clients);
        return "client";
    }
}

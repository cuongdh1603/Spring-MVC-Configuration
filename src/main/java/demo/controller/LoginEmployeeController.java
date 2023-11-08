/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package demo.controller;

import demo.model.Employee;
import demo.service.EmployeeService;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

/**
 *
 * @author OS
 */
@Controller
public class LoginEmployeeController {
    
    @Autowired
    private EmployeeService employeeService;
    
    @RequestMapping(value = {"/employ/login"}, method = RequestMethod.GET)
    public String getLoginForm(Model model) {
        Employee employee = new Employee();
        model.addAttribute("employee", employee);
        return "employee/login";
    }
    
    @RequestMapping(value = {"/employ/post-login"}, method = RequestMethod.POST)
    public String doLogin(Model model,
            @ModelAttribute("employee") Employee employee,
            RedirectAttributes redirectAttributes,
            HttpSession session)
    {
        if(employee.getUsername().trim().equals("admin") && employee.getPassword().trim().equals("admin")){
            Employee admin = new Employee();
            employee.setUsername("admin");
            employee.setPassword("admin");
            session.setAttribute("loggedEmployee", admin);
            return "redirect:/admin";
        }
        Employee loggedEmployee = employeeService.checkIfEmployeeExist(employee);
        if(loggedEmployee == null){
            redirectAttributes.addAttribute("failedLogin", "___");
            return "redirect:/employ/login";
        }
        else{
            session.setAttribute("loggedEmployee", loggedEmployee);
        }
        return "redirect:/employ";
    }
}

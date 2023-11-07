/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package demo.controller;

import demo.model.Employee;
import demo.service.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 *
 * @author OS
 */
@Controller
@RequestMapping("/employ")
public class LoginEmployeeController {
    
    @Autowired
    private EmployeeService employeeService;
    
    @RequestMapping(value = {"/login"}, method = RequestMethod.GET)
    public String getLoginForm(Model model) {
        Employee employee = new Employee();
        model.addAttribute("employee", employee);
        return "employee/login";
    }
    
    @RequestMapping(value = {"/post-login"}, method = RequestMethod.POST)
    public String doLogin(Model model,
            @ModelAttribute("employee") Employee employee)
    {
        if(employee.getUsername().trim().equals("admin") && employee.getPassword().trim().equals("admin")){
            return "redirect:/admin";
        }
        Employee loggedEmployee = employeeService.checkIfEmployeeExist(employee);
        if(loggedEmployee == null){
            System.out.println("FAIL");
        }
        else{
            System.out.println("SUCCESS");
        }
        return "employee/login";
    }
}

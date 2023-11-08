/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package demo.controller;

import demo.model.Employee;
import demo.service.SoldProductSerVice;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/employ")
public class EmployeeController {
    
    @Autowired
    private SoldProductSerVice soldProductService;
    
    @RequestMapping(method = RequestMethod.GET)
    public String showHomePage(Model model, HttpSession session) {
        Employee employee = (Employee) session.getAttribute("loggedEmployee");
//        System.out.println("Size: " + soldProductService.getSoldProductsByBranch("DN").size());
        model.addAttribute("employee", employee);
        return "employee/index";
    }
    
    @RequestMapping(value = {"/soldproduct"},method = RequestMethod.GET)
    public String showSoldProductList(Model model, HttpSession session) {
        Employee employee = (Employee) session.getAttribute("loggedEmployee");
        model.addAttribute("employee", employee);
        
        model.addAttribute("soldproducts", soldProductService.getSoldProductsByBranch("DN"));
        return "employee/soldproducts";
    }
    
    
}

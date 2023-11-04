/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package demo.controller;

import demo.model.Branch;
import demo.model.Employee;
import demo.service.BranchService;
import demo.service.EmployeeService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 *
 * @author OS
 */
@Controller
@RequestMapping("/branch")
public class BranchController {
    
    @Autowired
    private BranchService branchService;
    
    @Autowired
    private EmployeeService employeeService;
    
    @RequestMapping(value = {"","/all"}, method = RequestMethod.GET)
    public String showAllBranches(Model model) {
        List<Branch> branches = branchService.getAllBranches();
        model.addAttribute("branches", branches);
        return "admin/branchs";
    }
    
    @RequestMapping(value = {"/{branchId}/emp"}, method = RequestMethod.GET)
    public String showEmployeeEachBranch(Model model, @PathVariable("branchId") String branchId) {
        System.out.println(branchId);
        List<Employee> employees = employeeService.getEmployeeByBranch(branchId);
        model.addAttribute("employees", employees);
        return "admin/employees";
    }
}

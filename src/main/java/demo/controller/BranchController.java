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
import org.springframework.web.bind.annotation.ModelAttribute;
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
    
    @RequestMapping(method = RequestMethod.GET)
    public String showAllBranches(Model model) {
        List<Branch> branches = branchService.getAllBranches();
        model.addAttribute("branches", branches);
        return "admin/branchs";
    }
    
    @RequestMapping(value = {"/{branchId}/emp"}, method = RequestMethod.GET)
    public String showEmployeeEachBranch(Model model, @PathVariable("branchId") String branchId) {
        System.out.println(branchId);
        List<Employee> employees = employeeService.getEmployeeByBranch(branchId);
        model.addAttribute("branchId", branchId);
        model.addAttribute("employees", employees);
        return "admin/employees";
    }
    
    @RequestMapping(value = {"/{branchId}/emp/add"}, method = RequestMethod.GET)
    public String showAddEmployeeForm(Model model, @PathVariable("branchId") String branchId){
        Employee employee = new Employee();
        model.addAttribute("branchId", branchId);
        model.addAttribute("employee", employee);
        return "admin/add_employee";
    }
    
    @RequestMapping(value = {"/{branchId}/emp/save"}, method = RequestMethod.POST)
    public String getEmployeeForm(Model model, 
            @PathVariable("branchId") String branchId, 
            @ModelAttribute("employee") Employee employee) 
    {
        System.out.println("Chi nhanh : " + branchId);
        System.out.println("Thong tin NV : " + employee);
        if(employeeService.checkIfUsernameExist(employee)){
            model.addAttribute("usernameError", "___");
            model.addAttribute("branchId", branchId);
            model.addAttribute("employee", employee);
            return "admin/add_employee";
        }
        if(employeeService.checkIfPhoneExist(employee)){
            model.addAttribute("phoneError", "___");
            model.addAttribute("branchId", branchId);
            model.addAttribute("employee", employee);
            return "admin/add_employee";
        }
//        System.out.println(employeeService.createNewEmployeeID(branchId.trim()));
        employee.setId(employeeService.createNewEmployeeID(branchId.trim()));
        Branch branch = branchService.getBranchById(branchId.trim());
        if(branch != null) {
            employee.setBranch(branch);
//            System.out.println("Last : " + employee);
            employeeService.saveEmployee(employee);
        }
        return "redirect:/branch/" + branchId + "/emp";
    }
    
}

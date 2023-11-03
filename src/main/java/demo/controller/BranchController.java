/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package demo.controller;

import demo.model.Branch;
import demo.service.BranchService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 *
 * @author OS
 */
@Controller
@RequestMapping
public class BranchController {
    @Autowired
    private BranchService branchService;
    
    @RequestMapping(value = {"/"}, method = RequestMethod.GET)
    public String getIndex(ModelMap model){
        List<Branch> branchs = branchService.getAllBranches();
        model.addAttribute("branchs", branchs);
        for (Branch branch : branchs) {
            System.out.println(branch);
        }
        return "index";
    }
}

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package demo.service;

import demo.model.Employee;
import demo.repository.EmployeeRepository;
import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author OS
 */
@Service
public class EmployeeService {
    @Autowired
    private EmployeeRepository employeeRepository;
    
    @Transactional
    public List<Employee> getEmployeeByBranch(String branchId){
        
        List<Employee> employees = employeeRepository.getAll();
        List<Employee> branchEmployees = new ArrayList<Employee>();
        
        for (Employee employee : employees) {
            if(employee.getBranch().getId().trim().equals(branchId.trim()))
                branchEmployees.add(employee);
        }
        System.out.println("So luong: " + branchEmployees.size());
        return branchEmployees;
    }
}

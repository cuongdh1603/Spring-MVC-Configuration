/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package demo.service;

import demo.model.Branch;
import demo.repository.BranchRepository;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author OS
 */
@Service
public class BranchService {
    @Autowired
    private BranchRepository branchRepository;
    
    @Transactional
    public List<Branch> getAllBranches() {
        return branchRepository.getAll();
    }
    
    public Branch getBranchById(String branchId) {
        List<Branch> branchs = getAllBranches();
        for (Branch branch : branchs) {
            if(branch.getId().trim().equals(branchId))
                return branch;
        }
        return null;
    }
}

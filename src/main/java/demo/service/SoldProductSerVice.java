/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package demo.service;

import demo.model.SoldProduct;
import demo.repository.SoldProductRepository;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author thanh
 */
@Service
public class SoldProductSerVice {

    @Autowired
    private SoldProductRepository repo;

    public List<SoldProduct> getAllSoldProduct() {
        return repo.getAllPr();
    }
    
    public SoldProduct getProductById(String id) {
        return repo.getById(id);
    }
    
}
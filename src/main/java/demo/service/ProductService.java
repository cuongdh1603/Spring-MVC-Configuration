/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package demo.service;

import demo.model.Product;
import demo.repository.ProductRepository;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author OS
 */
@Service
public class ProductService {
    @Autowired
    private ProductRepository productRepository;
    
    @Transactional
    public List<Product> getAllProduct() {
        return productRepository.getAll();
    }
    
    public boolean checkIfProductNameExist(Product product) {
        List<Product> products = getAllProduct();
        for (Product pr : products) {
            if(pr.getName().trim().equalsIgnoreCase(product.getName()))
                return true;
        }
        return false;
    }
}

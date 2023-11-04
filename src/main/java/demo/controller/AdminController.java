/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package demo.controller;

import demo.model.Branch;
import demo.model.Product;
import demo.service.BranchService;
import demo.service.ProductService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 *
 * @author OS
 */
@Controller
@RequestMapping("/admin")
public class AdminController {
    
    @Autowired
    private ProductService productService;
    
    @RequestMapping(value = {"/"}, method = RequestMethod.GET)
    public String getIndex(){
        return "admin/index";
    }
    
    @RequestMapping(value = {"/products"}, method = RequestMethod.GET)
    public String showProducts(Model model) {
        List<Product> products = productService.getAllProduct();
        model.addAttribute("products", products);
        
        for (Product product : products) {
            product.setImg("/resources/product_img/638175171985162982_asus-vivobook-e1404fa-nk186w-r5-7520u-den-dd-moi.webp");
            System.out.println(product);
        }
        
        return "admin/products";
    }
}

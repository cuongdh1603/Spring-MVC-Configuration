/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package demo.controller;

import demo.model.Employee;
import demo.model.Product;
import demo.model.ProductMapper;
import demo.service.ProductService;
import demo.service.SoldProductSerVice;
import java.util.List;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/employ")
public class EmployeeController {
    
    @Autowired
    private SoldProductSerVice soldProductService;
    
    @Autowired
    private ProductService productService;
    
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
    
    @RequestMapping(value = {"/soldproduct/add"},method = RequestMethod.GET)
    public String showNewProductList(Model model, HttpSession session) {
        Employee employee = (Employee) session.getAttribute("loggedEmployee");
        model.addAttribute("employee", employee);
        
        List<Product> newProducts = productService.getNewProductList(soldProductService.getSoldProductsByBranch("DN"));
        model.addAttribute("newProducts", newProducts);
        return "employee/new_products";
    }
    
    @RequestMapping(value = {"/soldproduct/{id}"}, method = RequestMethod.GET)
    public String soldProduct(Model model, @PathVariable("id") String productId) {
        Product product = productService.getProductById(productId);
        ProductMapper productMapper = new ProductMapper();
        productMapper.setId(product.getId());
        productMapper.setName(product.getName());
        productMapper.setPrice(product.getPrice());
        productMapper.setDescription(product.getDescription());
        productMapper.setFilePath(product.getImagePath());

        model.addAttribute("product", productMapper);
        return "admin/soldproduct";
    }
    
}

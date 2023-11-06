/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package demo.controller;

import demo.model.Product;
import demo.model.ProductMapper;
import demo.service.BranchService;
import demo.service.ProductService;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

/**
 *
 * @author OS
 */
@Controller
@RequestMapping("/admin")
public class AdminController {
    
    @Autowired
    private ProductService productService;
    
    @RequestMapping(method = RequestMethod.GET)
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
    
    @RequestMapping(value = {"/add"}, method = RequestMethod.GET)
    public String addNewProduct(Model model) {
        ProductMapper product = new ProductMapper();
        model.addAttribute("product", product);
        return "admin/add_product";
    }
    
    @RequestMapping(value = {"/save/product"}, method = RequestMethod.POST)
    public String saveProduct(Model model,
            @ModelAttribute("product") ProductMapper productMapper
    ){
        Product product = new Product();
        product.setName(productMapper.getName().trim());
        product.setPrice(productMapper.getPrice());
        product.setDescription(productMapper.getDescription().trim());
        product.setImg(productMapper.getImage().getOriginalFilename());
        
        if(productService.checkIfProductNameExist(product)){
            model.addAttribute("errorName", "Tên s?n ph?m ?ã b? trùng");
            model.addAttribute("product", productMapper);
            
        }
        return "admin/add_product";
    }
    
}

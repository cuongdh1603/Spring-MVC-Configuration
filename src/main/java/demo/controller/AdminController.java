/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package demo.controller;

import demo.model.Product;
import demo.model.ProductMapper;
import demo.service.ProductService;
import java.io.IOException;
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
    ) throws IOException{
        Product product = new Product();
        product.setName(productMapper.getName().trim());
        product.setPrice(productMapper.getPrice());
        product.setDescription(productMapper.getDescription().trim());
        product.setImg(productMapper.getImage().getOriginalFilename().trim());
        
        if(product.getDescription().trim().equals("")
                ||product.getName().trim().equals("")
                ||product.getPrice().equals(null)){
            model.addAttribute("blankError", "Tên s?n ph?m ?ã b? trùng");
            model.addAttribute("product", productMapper);
        }
        if(product.getImg().equals("")){
            model.addAttribute("imageError", "Tên s?n ph?m ?ã b? trùng");
            model.addAttribute("product", productMapper);
        }
        if(productService.checkIfProductNameExist(product)){
            model.addAttribute("nameError", "Tên s?n ph?m ?ã b? trùng");
            model.addAttribute("product", productMapper);
            
        }
        
        String productId = productService.createNewProductID();
        
        if(productId.equals(null)) {
            model.addAttribute("idCreateError", "Tên s?n ph?m ?ã b? trùng");
            model.addAttribute("product", productMapper);
        }
        product.setId(productId);
        productService.saveProduct(product, productMapper.getImage());
        
        System.out.println("Thong tin san pham : " + productId);
        return "redirect:/admin/products";
    }
    
    @RequestMapping(value = {"/update/product/{productId}"}, method = RequestMethod.GET)
    public String showUpdateProductForm(Model model, @PathVariable("productId") String productId) {
        Product product = productService.getProductById(productId);
        ProductMapper productMapper = new ProductMapper();
        productMapper.setId(product.getId());
        productMapper.setName(product.getName());
        productMapper.setPrice(product.getPrice());
        productMapper.setDescription(product.getDescription());
        productMapper.setFilePath(product.getImagePath());
        
        model.addAttribute("product", productMapper);
        return "admin/update_product";
    }
    
    @RequestMapping(value = {"/update/product"}, method = RequestMethod.POST)
    public String updateProduct(Model model,
            @ModelAttribute("product") ProductMapper productMapper) throws IOException
    {
        String id = productMapper.getId();
//        System.out.println("ID: " + id);
        Product product = productService.getProductById(id);
        product.setName(productMapper.getName());
        product.setPrice(productMapper.getPrice());
        product.setDescription(productMapper.getDescription().trim());
        
        productMapper.setFilePath(product.getImagePath());
        if(product.getDescription().trim().equals("")
                ||product.getName().trim().equals("")
                ||product.getPrice().equals(null)){
            model.addAttribute("blankError", "Tên s?n ph?m ?ã b? trùng");
            model.addAttribute("product", productMapper);
            return "admin/update_product";
        }
        if(product.getImg().trim().equals("")){
            model.addAttribute("imageError", "Tên s?n ph?m ?ã b? trùng");
            model.addAttribute("product", productMapper);
            return "admin/update_product";
        }
        if(productService.checkIfUpdatedNameInvalid(product)){
            model.addAttribute("nameError", "Tên s?n ph?m ?ã b? trùng");
            model.addAttribute("product", productMapper);
            return "admin/update_product";
        }
        
        productService.updateProduct(product, productMapper.getImage());
        return "redirect:/admin/products";
    }
    
}

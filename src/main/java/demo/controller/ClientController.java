package demo.controller;

import demo.model.Client;
import demo.model.Product;

import demo.model.ProductMapper;
import demo.service.ClientSerVice;

import demo.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.List;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.PathVariable;

import demo.service.ClientSerVice;


@Controller
public class ClientController {

    @Autowired
    private ClientSerVice serVice;

    @Autowired
    private ProductService productService;

    @RequestMapping(value = {"/client"}, method = RequestMethod.GET)
    public String getIndex(ModelMap model) {
        List<Client> clients = serVice.getAllClient();
        System.out.println(clients);
        model.addAttribute("clients", clients);
        return "admin/client";
    }

    @RequestMapping(value = {"/user"}, method = RequestMethod.GET)
    public String getUser(ModelMap model) {
        List<Product> products = productService.getAllProduct();
        model.addAttribute("products", products);
        return "client/index";
    }

    @RequestMapping(value = {"/buy/{id}"}, method = RequestMethod.GET)
    public String findByProduct(@PathVariable("id") String id, ModelMap model) {
        Product product = productService.getProductById(id);
        ProductMapper productMapper = new ProductMapper();
        productMapper.setId(product.getId());
        productMapper.setName(product.getName());
        productMapper.setPrice(product.getPrice());
        productMapper.setDescription(product.getDescription());
        productMapper.setFilePath(product.getImagePath());
        model.addAttribute("product", productMapper);
        return "client/buy";
    }
}

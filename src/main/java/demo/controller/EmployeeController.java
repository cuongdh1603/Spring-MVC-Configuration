/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package demo.controller;

import demo.model.Bill;
import demo.model.Branch;
import demo.model.Client;
import demo.model.Employee;
import demo.model.Product;
import demo.model.ProductMapper;
import demo.model.SoldProduct;
import demo.service.BranchService;
import demo.service.ProductService;
import demo.service.SoldProductSerVice;
import java.util.List;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
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

    @Autowired
    private BranchService branchService;

    @RequestMapping(method = RequestMethod.GET)
    public String showHomePage(Model model, HttpSession session) {
        Employee employee = (Employee) session.getAttribute("loggedEmployee");
//        System.out.println("Size: " + soldProductService.getSoldProductsByBranch("DN").size());
        model.addAttribute("employee", employee);
        return "employee/index";
    }

    @RequestMapping(value = {"/soldproduct"}, method = RequestMethod.GET)
    public String showSoldProductList(Model model, HttpSession session) {
        Employee employee = (Employee) session.getAttribute("loggedEmployee");
        model.addAttribute("employee", employee);

        model.addAttribute("soldproducts", soldProductService.getSoldProductsByBranch(employee.getId().substring(0, 2)));
        return "employee/soldproducts";
    }

    @RequestMapping(value = {"/soldproduct/add"}, method = RequestMethod.GET)
    public String showNewProductList(Model model, HttpSession session) {
        Employee employee = (Employee) session.getAttribute("loggedEmployee");
        model.addAttribute("employee", employee);

        List<Product> newProducts = productService.getNewProductList(soldProductService.getSoldProductsByBranch(employee.getId().substring(0, 2)));
        model.addAttribute("newProducts", newProducts);
        return "employee/new_products";
    }

    @RequestMapping(value = {"/soldproductup/{id}"}, method = RequestMethod.GET)
    public String findSoldProductId(Model model, @PathVariable("id") String id) {
        SoldProduct soldProduct = soldProductService.getProductById(id);
        model.addAttribute("productId", soldProduct.getProduct().getId().trim());
        model.addAttribute("soldproduct", soldProduct);
        return "employee/updatesoldproduct";
    }

    @RequestMapping(value = {"/{productId}/updateqt"}, method = RequestMethod.POST)
    public String capnhatsoLuongKho(Model model , 
            @ModelAttribute("soldproduct") SoldProduct soldproduct,
            @PathVariable("productId") String productId,
            HttpSession session) 
    {
        Employee employee = (Employee) session.getAttribute("loggedEmployee");
        model.addAttribute("employee", employee);
        
        
        Product product = productService.getProductById(productId);
        Branch branch = employee.getBranch();
        if(product != null && branch != null){
//            System.out.println("Product: " + product);
//            System.out.println("Branch : " + branch);
            soldproduct.setBranch(branch);
            soldproduct.setProduct(product);
            soldProductService.saveOrUpdate(soldproduct);
        }
//        soldProductService.saveOrUpdate(soldproduct);
        return "redirect:/employ/soldproduct";
    }

    @RequestMapping(value = {"/soldproduct/{id}"}, method = RequestMethod.GET)
    public String soldProduct(Model model, @PathVariable("id") String id) {
        Product product = productService.getProductById(id);
        SoldProduct soldProduct = new SoldProduct();
        ProductMapper productMapper = new ProductMapper();
        productMapper.setId(product.getId());
        productMapper.setName(product.getName());
        productMapper.setPrice(product.getPrice());
        productMapper.setDescription(product.getDescription());
        productMapper.setFilePath(product.getImagePath());
        model.addAttribute("product", productMapper);
        model.addAttribute("soldproduct", soldProduct);
        return "employee/addsoldproduct";
    }

    @RequestMapping(value = {"/updateSoldProduct/{id}"}, method = RequestMethod.POST)
    public String updateSoldPr(Model model, @ModelAttribute("soldproduct") SoldProduct soldproduct, HttpSession session, @PathVariable("id") String id) {
        Employee employee = (Employee) session.getAttribute("loggedEmployee");
        Product product = productService.getProductById(id);
        Branch branch = branchService.getBranchById(employee.getId().substring(0, 2));
        soldproduct.setProduct(product);
        soldproduct.setBranch(branch);
        soldproduct.setId(employee.getId().substring(0, 2) + createNewSoldProductID());
        soldProductService.saveOrUpdate(soldproduct);
        model.addAttribute("soldproduct", soldproduct);
        model.addAttribute("employee", employee);
        model.addAttribute("soldproducts", soldProductService.getSoldProductsByBranch(employee.getId().substring(0, 2)));
        return "employee/soldproducts";
    }

    public String createNewSoldProductID() {
        List<SoldProduct> soldProducts = soldProductService.getAllSoldProduct();
        Integer numId = 1;
        for (SoldProduct bill : soldProducts) {
            if (numId == Integer.parseInt(bill.getId().trim().substring(4))) {
                numId++;
            } else {
                break;
            }
        }
        if (numId > 999) {
            return null;
        }

        return "PR" + String.format("%03d", numId);
    }
}

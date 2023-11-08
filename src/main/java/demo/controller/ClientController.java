package demo.controller;

import demo.model.Bill;
import demo.model.Client;
import demo.model.Product;

import demo.model.ProductMapper;
import demo.model.SoldProduct;
import demo.service.BillService;
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
import demo.service.SoldProductSerVice;
import java.util.Date;
import javax.servlet.http.HttpSession;
import org.springframework.web.bind.annotation.ModelAttribute;

@Controller
public class ClientController {

    @Autowired
    private ClientSerVice serVice;

    @Autowired
    private ProductService productService;

    @Autowired
    private BillService bilServce;

    @Autowired
    private SoldProductSerVice service;

    @RequestMapping(value = {"/client"}, method = RequestMethod.GET)
    public String getIndex(ModelMap model) {
        List<Client> clients = serVice.getAllClient();
        System.out.println(clients);
        model.addAttribute("clients", clients);
        return "admin/client";
    }

    @RequestMapping(value = {"/user"}, method = RequestMethod.GET)
    public String getUser(ModelMap model, HttpSession session) {
        Client loggedClient = (Client) session.getAttribute("loggedClient");
        if (loggedClient == null) {
            List<SoldProduct> soldproducts = service.getAllSoldProduct();
            model.addAttribute("soldproducts", soldproducts);
            return "client/index";
        } else {
            model.addAttribute("username", loggedClient.getUsername());
            List<SoldProduct> soldproducts = service.getAllSoldProduct();
            model.addAttribute("soldproducts", soldproducts);
            return "client/index";
        }

    }

    @RequestMapping(value = {"/buy/{id}"}, method = RequestMethod.GET)
    public String findByProduct(@PathVariable("id") String id, ModelMap model) {
        SoldProduct soldProduct = service.getProductById(id);
        model.addAttribute("soldProduct", soldProduct);
        return "client/buy";
    }

    @RequestMapping(value = {"/thanhToan/{id}"}, method = RequestMethod.POST)
    public String saveProduct(Model model, @ModelAttribute("bill") Bill bill, HttpSession session, @PathVariable("id") String id) {
        Client client = (Client) session.getAttribute("loggedClient");
        SoldProduct pr = service.getProductById(id);
        String idpr = pr.getId();
        String slicedString = idpr.substring(0, 2);
        System.out.println("ol" + slicedString);

        if (client.getUsername() == null) {
            return "loginClient";
        } else {
            bill.setId(slicedString + createNewBillID());
            bill.setClient(client);
            bill.setSoldProduct(pr);
            bill.setCreateDate(new Date());
            bill.setStatus(1);
            bilServce.Thanhtoan(bill);
            model.addAttribute("bill", bill);
            return "client/SUSSESS";
        }

    }

    public String createNewBillID() {
        List<Bill> bills = bilServce.getAll();
        Integer numId = 1;
        for (Bill bill : bills) {
            if (numId == Integer.parseInt(bill.getId().trim().substring(4))) {
                numId++;
            } else {
                break;
            }
        }
        if (numId > 999) {
            return null;
        }

        return "BL" + String.format("%03d", numId);
    }

}

package demo.controller;

import demo.model.Bill;
import demo.model.Branch;
import demo.service.BillService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.List;

@Controller
public class BillController {
    @Autowired
    private BillService service;

    @RequestMapping(value = {"/bill"}, method = RequestMethod.GET)
    public String getIndex(ModelMap model){
        List<Bill> bills = service.getAll();
        model.addAttribute("bills", bills);
        return "admin/bill";
    }
}

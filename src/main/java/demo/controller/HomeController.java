package demo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpMethod;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import demo.dao.SalesmanDAO;
import demo.model.Salesman;
import demo.repository.SalesmanRepository;
import demo.service.SalesmanService;

@Controller
@RequestMapping
public class HomeController {
	@Autowired
	private SalesmanService salesmanService;
	
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String getReturn() {
//		List<Salesman> salesmans = salesmanService.getSalesmans();
//		for(Salesman s : salesmans) {
//			System.out.println(s);
//		}
		salesmanService.getCountSalesman();
		return "index";
	}
	
	@GetMapping("/logout")
	public String getLogout() {
		Salesman salesmans = salesmanService.getSalesmanById(2);
		
		System.out.println(salesmans);
		
		return "logout";
	}
	
	@GetMapping("/save-logout")
	public String getSave() {
		Salesman salesman = new Salesman();
//		salesman.setId(4);
		salesman.setName("Nam Phuong");
		salesman.setCity("Cong Doan");
		salesman.setCommission(2.2f);

		
		salesmanService.saveSalesman(salesman);
		
		return "logout";
	}
	
	@GetMapping("/update-logout")
	public String getUpdate() {
		Salesman salesman = new Salesman();
		salesman.setId(6);
		salesman.setName("Diem My");
		salesmanService.updateSalesman(salesman);
		return "logout";
	}
	
	@GetMapping("/delete-logout")
	public String getDelete() {
		Salesman salesman = new Salesman();
		salesman.setId(6);
//		salesman.setName("Diem My");
		salesmanService.deleteSalesman(salesman);
		return "logout";
	}
}

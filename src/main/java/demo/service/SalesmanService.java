package demo.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import demo.dao.SalesmanDAO;
import demo.model.Salesman;

@Service
public class SalesmanService {
	@Autowired
	private SalesmanDAO salesmanDAO;
	
	@Transactional
	public List<Salesman> getSalesmans() {
		return salesmanDAO.getSalesmans();
	}
	
	@Transactional
	public void getCountSalesman() {
		salesmanDAO.countSalesman();
	}
	
	@Transactional
	public Salesman getSalesmanById(Integer id) {
		return salesmanDAO.getSalesmanById(id);
	}
	
	@Transactional
	public void saveSalesman(Salesman salesman) {
		salesmanDAO.saveSalesman(salesman);
	}
	
	@Transactional
	public Salesman updateSalesman(Salesman salesman) {
		return salesmanDAO.updateSalesman(salesman);
	}
	
	@Transactional
	public void deleteSalesman(Salesman salesman) {
		salesmanDAO.deleteSalesman(salesman);
	}
}

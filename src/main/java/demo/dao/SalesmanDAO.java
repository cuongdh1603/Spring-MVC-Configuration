package demo.dao;

import java.util.List;

import javax.persistence.Query;
import javax.persistence.TypedQuery;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;

import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.NativeQuery;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import demo.model.Salesman;
import demo.repository.SalesmanRepository;

@Repository
public class SalesmanDAO {
	@Autowired
	private SalesmanRepository salesmanRepository;
//	@Autowired
//	private SessionFactory sessionFactory;
	
	
	
	public List<Salesman> getSalesmans() {
		return salesmanRepository.getAllSalesman();
		
	}
	
	public void countSalesman() {
		System.out.println(salesmanRepository.getSalesmanQuantity());
	}
	
	public Salesman getSalesmanById(Integer id){
		return salesmanRepository.getSalesman(id);
	}
	
	public void saveSalesman(Salesman salesman) {
		salesmanRepository.addSalesman(salesman);
	}
	
	public Salesman updateSalesman(Salesman salesman) {
		return salesmanRepository.updateSalesman(salesman);
	}
	
	public void deleteSalesman(Salesman salesman) {
		salesmanRepository.deleteSalesman(6);
	}
}

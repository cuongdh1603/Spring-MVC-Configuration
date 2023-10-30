package demo.repository;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import demo.model.Salesman;

@Repository
@Transactional
public class SalesmanRepository {
	@Autowired
	private SessionFactory sessionFactory;
	
	public SessionFactory getSessionFactory() {
		if (sessionFactory == null) {
			throw new IllegalStateException("SessionFactory has not been set on DAO before usage");
		}
		return sessionFactory;
	}
//	
//	public Salesman getSalesmans(int id){
//		return sessionFactory.getCurrentSession().get(Salesman.class, id);
//	}
	public void addSalesman(Salesman salesman) {
		sessionFactory.getCurrentSession().saveOrUpdate(salesman);
	}
	public List<Salesman> getAllSalesman() {
		Criteria criteria = (Criteria) getSessionFactory().getCurrentSession().createCriteria(Salesman.class);
		return criteria.list();
	}
	public Salesman getSalesman(int salesmanId) {
		return (Salesman)sessionFactory.getCurrentSession()
				.get(Salesman.class, salesmanId);
	}
	public Salesman updateSalesman(Salesman salesman) {
		sessionFactory.getCurrentSession().update(salesman);
		return salesman;
	}
	public void deleteSalesman(Integer salesmanId) {
		Salesman salesman = (Salesman) sessionFactory.getCurrentSession()
				.load(Salesman.class, salesmanId);
		if(salesman != null) {
			this.sessionFactory.getCurrentSession().delete(salesman);
		}
	}
	public int getSalesmanQuantity() {
		return (Integer)sessionFactory.getCurrentSession()
				.createNativeQuery("SELECT COUNT(*) FROM salesman")
				.uniqueResult();
	}
}

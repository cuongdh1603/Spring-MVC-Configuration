package demo.repository;

import javax.transaction.Transactional;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
@Transactional
public class BookRepository {
	@Autowired
	private SessionFactory sessionFactory;
	
	public SessionFactory getSessionFactory() {
		if(sessionFactory == null) {
			throw new IllegalStateException("SessionFactory has not been set on DAO before usage");
		}
		return sessionFactory;
	}
}

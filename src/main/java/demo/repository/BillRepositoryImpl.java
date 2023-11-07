package demo.repository;

import demo.model.Bill;
import org.hibernate.Criteria;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class BillRepositoryImpl implements BillRepository {

    @Autowired
    private SessionFactory sessionFactory;

    public SessionFactory getSessionFactory() {
        return sessionFactory;
    }

    @Override
    public List<Bill> getAllBill() {
        Criteria criteria = (Criteria) getSessionFactory().getCurrentSession().createCriteria(Bill.class);
        return criteria.list();
    }

    public void saveOrUpdate(Bill bill) {
        getSessionFactory().getCurrentSession().saveOrUpdate(bill);
    }

}

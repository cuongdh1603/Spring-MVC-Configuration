package demo.repository;

import demo.model.Bill;
import demo.model.Branch;
import demo.model.Client;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository
@Transactional
public class ClientRepositoryImpl implements ClientRepository {
    @Autowired
    private SessionFactory sessionFactory;

    public SessionFactory getSessionFactory() {
        return sessionFactory;
    }


    @Override
    public List<Client> getAllClient()  {

        Criteria criteria = (Criteria) getSessionFactory().getCurrentSession().createCriteria(Client.class);
        return criteria.list();

    }
}

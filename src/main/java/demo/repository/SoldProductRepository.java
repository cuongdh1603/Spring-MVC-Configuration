/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package demo.repository;

import demo.model.SoldProduct;
import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author thanh
 */
@Repository
@Transactional
public class SoldProductRepository {

    @Autowired
    private SessionFactory sessionFactory;

    public SessionFactory getSessionFactory() {
        return sessionFactory;
    }

    public List<SoldProduct> getAllPr() {
        Criteria criteria = (Criteria) getSessionFactory().getCurrentSession().createCriteria(SoldProduct.class);
        return criteria.list();
    }
      public SoldProduct getById(String id) {
        return getSessionFactory().getCurrentSession().get(SoldProduct.class, id);
    }
    
    
}

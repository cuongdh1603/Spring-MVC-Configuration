/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package demo.repository;

import demo.model.Product;
import java.util.List;
import javax.persistence.TypedQuery;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author OS
 */
@Repository
@Transactional
public class ProductRepository {
    @Autowired
    private SessionFactory sessionFactory;
    
    public SessionFactory getSessionFactory() {
        return sessionFactory;
    }
    
    public List<Product> getAll() {
        CriteriaBuilder cb = getSessionFactory().getCurrentSession().getCriteriaBuilder();
        CriteriaQuery<Product> cq = cb.createQuery(Product.class);
        Root<Product> rootEntry = cq.from(Product.class);
        
        CriteriaQuery<Product> all = cq.select(rootEntry);
        TypedQuery<Product> allQuery = getSessionFactory().getCurrentSession().createQuery(all);
        return allQuery.getResultList();
        
    }
    
    public void saveOrUpdate(Product product) {
        getSessionFactory().getCurrentSession().saveOrUpdate(product);
    }
    
    public Product getById(String id) {
        return getSessionFactory().getCurrentSession().get(Product.class, id);
    }
    
}

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package demo.repository;

import demo.model.Branch;
import java.util.List;
import org.hibernate.Criteria;
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
public class BranchRepository {
    @Autowired
    private SessionFactory sessionFactory;
    
    public SessionFactory getSessionFactory() {
        return sessionFactory;
    }
    
    @SuppressWarnings("unchecked")
    public List<Branch> getAll() {
        Criteria criteria = (Criteria) getSessionFactory().getCurrentSession().createCriteria(Branch.class);
        return criteria.list();
    }
}

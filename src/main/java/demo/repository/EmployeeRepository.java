/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package demo.repository;

import demo.model.Employee;
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
public class EmployeeRepository {
    @Autowired
    private SessionFactory sessionFactory;
    
    public SessionFactory getSessionFactory() {
        return sessionFactory;
    }
    
    public List<Employee> getAll() {
        CriteriaBuilder cb = getSessionFactory().getCurrentSession().getCriteriaBuilder();
        CriteriaQuery<Employee> cq = cb.createQuery(Employee.class);
        Root<Employee> rootEntry = cq.from(Employee.class);
        
        CriteriaQuery<Employee> all = cq.select(rootEntry);
        TypedQuery<Employee> allQuery = getSessionFactory().getCurrentSession().createQuery(all);
        return allQuery.getResultList();
    }
}

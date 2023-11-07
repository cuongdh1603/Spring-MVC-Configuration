package demo.repository;

import demo.model.Bill;

import java.util.List;

public interface BillRepository {

    public List<Bill> getAllBill();

    public void saveOrUpdate(Bill bill);

}

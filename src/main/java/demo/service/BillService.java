package demo.service;

import demo.model.Bill;

import java.util.List;

public interface BillService {
     List<Bill> getAll();
     void Thanhtoan(Bill bill);
}

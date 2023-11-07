package demo.serviceImpl;

import demo.model.Bill;
import demo.repository.BillRepository;
import demo.service.BillService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import java.util.List;

@Service
@Transactional
public class BillServiceImpl implements BillService {

    @Autowired
    private BillRepository repo;

    @Override
    public List<Bill> getAll() {

        return repo.getAllBill();
    }

    public void Thanhtoan(Bill bill) {
        repo.saveOrUpdate(bill);
    }
}

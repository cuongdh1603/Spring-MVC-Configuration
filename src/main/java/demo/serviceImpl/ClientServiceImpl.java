package demo.serviceImpl;

import demo.model.Client;
import demo.repository.ClientRepository;
import demo.service.ClientSerVice;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.List;

@Service
public class ClientServiceImpl implements ClientSerVice {
    @Autowired
    private ClientRepository repo;

    @Override

    public List<Client> getAllClient()  {
        return repo.getAllClient();
    }
    
    public Client checkClientExist(Client client){
        List<Client> clients = getAllClient();
        for (Client cl : clients) {
            if(cl.getUsername().trim().equals(client.getUsername()) && cl.getPassword().trim().equals(client.getPassword()))
                return cl;
        }
        return null;
    }
}

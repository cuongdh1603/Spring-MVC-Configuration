package demo.serviceImpl;

import demo.model.Client;
import demo.repository.ClientRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.List;
import demo.service.ClientSerVice;

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
    
    public boolean checkIfUsernameExist(Client client) {
        List<Client> clients = getAllClient();
        for (Client cl : clients) {
            if(cl.getUsername().trim().equals(client.getUsername()))
                return true;
        }
        return false;
    }
    
    public boolean checkIfPhoneExist(Client client) {
        List<Client> clients = getAllClient();
        for (Client cl : clients) {
            if(cl.getPhone().trim().equals(client.getPhone()))
                return true;
        }
        return false;
    }
    
    public String createNewProductID() {
        List<Client> clients = getAllClient();
        Integer numId = 1;
        for (Client client : clients) {
            if (numId == Integer.valueOf(client.getId().substring(2))) {
                numId++;
            } else {
                break;
            }
        }
        if (numId > 999) {
            return null;
        }

        return "CL" + String.format("%03d", numId);
    }
    
    
    public void saveClient(Client client) {
        repo.saveClient(client);
    }
        
}

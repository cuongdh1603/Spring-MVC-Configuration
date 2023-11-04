package demo.model;

import lombok.Data;

import java.util.Date;
import java.util.List;

import javax.persistence.*;

@Entity
@Data
@Table(name = "CLIENT")
public class Client {
    @Id
    @Column(name = "ID")
    private String id;
    @Column(name = "name")
    private String name;
    @Column(name = "dob")
    private Date dob;
    @Column(name = "phone")
    private String phone;
    @Column(name = "username")
    private String username;
    @Column(name = "password")
    private String password;

//    @OneToMany(mappedBy = "client",fetch = FetchType.EAGER)
//    private List<Bill> bills;


}

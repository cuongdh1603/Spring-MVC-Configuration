package demo.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "BILL")
public class Bill {
	
	@Id
	@Column(name = "ID")
	private String id;
	
	@Column(name = "quantity")
	private Integer quantity;
	
	@Column(name = "create_date")
	private Date createDate;
	
	@Column(name = "status")
	private Integer status;
	
	@ManyToOne
	@JoinColumn(name = "soldproduct_id")
	private SoldProduct soldProduct;
	
	@ManyToOne
	@JoinColumn(name = "client_id")
	private Client client;
	
}

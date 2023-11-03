package demo.model;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "SOLDPRODUCT")
public class SoldProduct {
	
	@Id
	@Column(name = "ID")
	private String id;
	
	@Column(name = "quantity")
	private Integer quantity;
//	
	@OneToMany(mappedBy = "SOLDPRODUCT")
	private List<Bill> bills;
	
	@ManyToOne
	@JoinColumn(name = "branch_id")
	private Branch branch;
	
	@ManyToOne
	@JoinColumn(name = "product_id")
	private Product product;
	
	

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public Integer getQuantity() {
		return quantity;
	}

	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}

	public Branch getBranch() {
		return branch;
	}

	public void setBranch(Branch branch) {
		this.branch = branch;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}
	
	
}

package demo.model;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Data
@Entity
@Table(name = "BRANCH")
public class Branch {
	
	@Id
	@Column(name = "ID")
	private String id;
	
	@Column(name = "name")
	private String name;
	
	@Column(name = "address")
	private String address;
	
	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return "[ " + this.id + " , " + this.name + " , " + this.address + " ]";
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	
	/*-------------------------------------------------------*/
	@OneToMany(mappedBy = "branch")
	private List<Employee> employees;
	
	
	public List<Employee> getEmployees() {
		return employees;
	}
	public void setEmployees(List<Employee> employees) {
		this.employees = employees;
	}

	@OneToMany(mappedBy = "branch")
	private List<SoldProduct> soldProducts;
	
	public List<SoldProduct> getSoldProducts() {
		return soldProducts;
	}
	public void setSoldProducts(List<SoldProduct> soldProducts) {
		this.soldProducts = soldProducts;
	}
	
	
}

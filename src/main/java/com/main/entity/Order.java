package com.main.entity;

import java.sql.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import lombok.Data;

@SuppressWarnings("serial")
@Data
@Entity @Table(name = "orders")
public class Order {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	int id;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	java.util.Date Orderdate;
	String address;
	String Status;
//	@ManyToOne
//	@JoinColumn(name = "Supplierid")
//	Supplier supplier;
	@ManyToOne
	@JoinColumn(name = "Accountid")
	Account account;
	@OneToMany(mappedBy = "order")
	List<OrderDetail> orderdetail;
}

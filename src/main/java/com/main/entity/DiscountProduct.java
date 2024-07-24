//package com.main.entity;
//
//import java.util.Date;
//import java.util.List;
//
//import jakarta.persistence.Entity;
//import jakarta.persistence.Id;
//import jakarta.persistence.JoinColumn;
//import jakarta.persistence.ManyToOne;
//import jakarta.persistence.Table;
//import lombok.Data;
//
//@SuppressWarnings("serial")
//@Data
//@Entity
//@Table(name = "DiscountProduct")
//public class DiscountProduct {
//	@Id
//	@ManyToOne
//	@JoinColumn(name = "ProductId", referencedColumnName = "id")
//	private Product product;
//
//	@Id
//	@ManyToOne
//	@JoinColumn(name = "DiscountId", referencedColumnName = "id")
//	private Discount discount;
//}

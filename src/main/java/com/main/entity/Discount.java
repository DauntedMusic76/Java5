package com.main.entity;

import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonIgnore;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import lombok.Data;

@SuppressWarnings("serial")
@Data
@Entity 
@Table(name = "Discounts")
public class Discount {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	int id;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	Date startdate;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	Date enddate;
	int discountpercent;
//	@OneToMany(mappedBy = "discount")
//	List<DiscountProduct> discountproduct;
}

package com.main.entity;

import java.util.List;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.main.entity.*;
import com.main.entity.Product;

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
@Table(name = "Categories")
public class Category {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	int id;
	String categoryname;
	@JsonIgnore
	@OneToMany(mappedBy = "category")
	List<Product> products;
}

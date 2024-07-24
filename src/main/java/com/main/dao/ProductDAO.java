package com.main.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.main.entity.Product;

public interface ProductDAO  extends JpaRepository<Product, Integer> {
	@Query("select p from Product p where p.productname like %:name%")
	List<Product> findByName(String name);
}

package com.main.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.main.entity.Supplier;

public interface SupplierDAO extends JpaRepository<Supplier, Integer> {

}

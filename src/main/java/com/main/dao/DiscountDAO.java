package com.main.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.main.entity.Discount;

public interface DiscountDAO extends JpaRepository<Discount, Integer> {

}

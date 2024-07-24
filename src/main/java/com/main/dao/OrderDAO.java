package com.main.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.main.entity.Order;

public interface OrderDAO extends JpaRepository<Order, Integer> {

}

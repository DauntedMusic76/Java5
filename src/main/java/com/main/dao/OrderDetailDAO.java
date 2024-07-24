package com.main.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.main.entity.OrderDetail;

public interface OrderDetailDAO extends JpaRepository<OrderDetail, Integer>{

}

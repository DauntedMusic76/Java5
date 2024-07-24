package com.main.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.main.entity.*;

public interface CategoryDAO extends JpaRepository<Category, Integer>{
}

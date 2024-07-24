package com.main.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.main.entity.*;

public interface AccountDAO extends JpaRepository<Account,Integer>{
	Account findByEmail(String email);
}
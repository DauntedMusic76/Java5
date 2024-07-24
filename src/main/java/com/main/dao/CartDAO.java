package com.main.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import com.main.entity.Cart;

import jakarta.transaction.Transactional;

public interface CartDAO extends JpaRepository<Cart, Integer> {
	@Query("select c from Cart c join c.account a where a.id = :accountid")
	List<Cart> findCartByAccountId(int accountid);
	@Query("SELECT MAX(a.id) FROM Order a")
    int findMaxId();
	@Transactional
    @Modifying
    @Query("DELETE FROM Cart c WHERE c.account.id = :accountId")
    void deleteByOrderId(int accountId);
}

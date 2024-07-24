package com.main.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.main.dao.AccountDAO;
import com.main.dao.CartDAO;
import com.main.dao.ProductDAO;
import com.main.entity.Account;
import com.main.entity.Cart;
import com.main.entity.Product;

import jakarta.servlet.http.HttpSession;

@Controller
public class ListProduct {
	@Autowired
	HttpSession session;
	@Autowired
	ProductDAO dao;
	@Autowired
	CartDAO cartdao;
	@Autowired
	AccountDAO accountdao;

	@RequestMapping("/listproduct")
	public String listProduct(Model model) {
		List<Product> item = dao.findAll();
		model.addAttribute("items", item);
		Object isAdmin = session.getAttribute("idUser");
		boolean checkCart = true;
		if (isAdmin != null) {
			Account account = accountdao.findById((int) session.getAttribute("idUser")).get();
			model.addAttribute("username", account.getUsername());
			System.out.println(account.getRoleid());
			boolean check;
			if (account.getRoleid() == 1) {
				check = true;
			} else {
				check = false;
			}
			System.out.println(check);
			model.addAttribute("isAdmin", check);
		} else {
			checkCart = false;
			
		}
		model.addAttribute("checkCart", checkCart);
		return "/listProduct";
	}
	
	@RequestMapping("/listsearch")
	public String search(Model model, @RequestParam("itemname") String name) {
		List<Product> item = dao.findByName(name);
		model.addAttribute("items", item);
		
		Object isAdmin = session.getAttribute("idUser");
		boolean checkCart = true;
		if (isAdmin != null) {
			Account account = accountdao.findById((int) session.getAttribute("idUser")).get();
			model.addAttribute("username", account.getUsername());
			boolean check;
			if (account.getRoleid() == 1) {
				check = true;
			} else {
				check = false;
			}
			model.addAttribute("isAdmin", check);
		} else {
			checkCart = false;
			
		}
		model.addAttribute("checkCart", checkCart);

		return "/listProduct";
	}

	@RequestMapping("/detailproduct/{id}")
	public String detailProduct(@PathVariable("id") int id, Model model) {
		Product items = dao.findById(id).orElse(null);
		model.addAttribute("product", items);
		List<Product> item = dao.findAll();
		model.addAttribute("items", item);
		System.out.println();
		return "/detailProduct";
	}

	@RequestMapping("/footer")
	public String menu() {
		return "/footer";
	}

	@RequestMapping("/idUser")
	public String idUser() {
		session.removeAttribute("idUser");
		session.setAttribute("idUser", 4);
		return "redirect:/listproduct";
	}

	@RequestMapping("/logout")
	public String logout() {
		session.removeAttribute("idUser");
		return "redirect:/login";
	}
}

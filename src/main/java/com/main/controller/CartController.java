package com.main.controller;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.main.dao.AccountDAO;
import com.main.dao.CartDAO;
import com.main.dao.CategoryDAO;
import com.main.dao.OrderDAO;
import com.main.dao.OrderDetailDAO;
import com.main.dao.ProductDAO;
import com.main.dao.SupplierDAO;
import com.main.entity.Account;
import com.main.entity.Cart;
import com.main.entity.CartItem;
import com.main.entity.Category;
import com.main.entity.Order;
import com.main.entity.OrderDetail;
import com.main.entity.Product;
import com.main.entity.Supplier;
import com.main.service.ShoppingCartService;

import jakarta.servlet.http.HttpSession;

@Controller
public class CartController {
	@Autowired
	HttpSession session;
	@Autowired
	ProductDAO dao;
	@Autowired
	CartDAO cartdao;
	@Autowired
	AccountDAO accountdao;
	@Autowired
	CategoryDAO categorydao;
	@Autowired
	SupplierDAO supplierdao;
	@Autowired
	OrderDAO orderdao;
	@Autowired
	OrderDetailDAO orderDetailDAO;

	@RequestMapping("/cart/index")
	public String cartIndex(Model model) {
		int idUser = (int) session.getAttribute("idUser");
		List<Cart> item = cartdao.findCartByAccountId(idUser);
		model.addAttribute("items", item);
		int subtotal = 0;
		for (Cart x : item) {
			subtotal = subtotal + x.getTotal();
		}
		model.addAttribute("subtotal", subtotal);

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
		return "/cart";
	}

	@RequestMapping("/detailproduct/add/{id}")
	public String addToCart(Model model, @PathVariable("id") int id) {
		try {
			int idUser = (int) session.getAttribute("idUser");
			Account account = accountdao.findById(idUser).get();
			Product product = dao.findById(id).get();
			Cart cart = new Cart();
			cart.setProduct(product);
			cart.setAccount(account);
			List<Cart> allCartItem = cartdao.findAll();
			int count = 0;
			for (Cart x : allCartItem) {
				if (cart.getProduct() == x.getProduct() && cart.getAccount() == x.getAccount()) {
					cart.setQuantity(x.getQuantity() + 1);
					cart.setId(x.getId());
					count++;
					break;
				}
			}
			if (count == 0) {
				cart.setQuantity(1);
			}
			int quantity = cart.getQuantity();
			int price = cart.getProduct().getPrice();
			int total = quantity * price;
			cart.setTotal(total);
			cartdao.save(cart);
			return "redirect:/listproduct";
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return "redirect:/listproduct";
	}

	@RequestMapping("/cart/update/{id}")
	public String update(Model model, @PathVariable("id") int id, @RequestParam("quantity") int quantity) {
		Cart updateCart = cartdao.findById(id).get();
		updateCart.setQuantity(quantity);
		int total = updateCart.getQuantity() * updateCart.getProduct().getPrice();
		updateCart.setTotal(total);
		cartdao.save(updateCart);
		return "redirect:/cart/index";
	}

	@RequestMapping("/cart/remove/{id}")
	public String removeCart(Model model, @PathVariable("id") int id) {
		cartdao.deleteById(id);
		return "redirect:/cart/index";
	}

	@RequestMapping("/cart/checkout")
	public String checkout(Model model, @RequestParam("address") String address) {
		Account account = accountdao.findById((int) session.getAttribute("idUser")).get();
		List<Cart> cart = cartdao.findCartByAccountId(account.getId());
		Order ord = new Order();
		ord.setAccount(account);
		ord.setAddress(address);
		ord.setOrderdate(new java.util.Date());
		ord.setStatus("none");
		orderdao.save(ord);
		int orderid = cartdao.findMaxId();
		Order ord1 = orderdao.findById(orderid).get();
		for (Cart x : cart) {
			OrderDetail ordetail = new OrderDetail();
			ordetail.setProduct(x.getProduct());
			ordetail.setUnitprice(x.getProduct().getPrice());
			ordetail.setOrder(ord1);
			ordetail.setQuantity(x.getQuantity());
			orderDetailDAO.save(ordetail);
		}
		cartdao.deleteByOrderId(ord1.getAccount().getId());
		return "redirect:/cart/index";
	}
}

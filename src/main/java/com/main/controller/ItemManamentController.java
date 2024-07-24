package com.main.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import org.apache.poi.ss.usermodel.*;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.main.dao.AccountDAO;
import com.main.dao.CategoryDAO;
import com.main.dao.DiscountDAO;
import com.main.dao.ProductDAO;
import com.main.dao.SupplierDAO;
import com.main.entity.Account;
import com.main.entity.Category;
import com.main.entity.Discount;
import com.main.entity.Product;
import com.main.entity.Supplier;

import jakarta.servlet.ServletContext;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@Controller
public class ItemManamentController {
	@Autowired
	ProductDAO dao;
	@Autowired
	CategoryDAO categoryDAO;
	@Autowired
	SupplierDAO supplierDAO;
	@Autowired
	DiscountDAO discountDAO;
	@Autowired
	ServletContext app;
	@Autowired
	AccountDAO accountdao;
	@Autowired
	HttpSession session;

	@RequestMapping("/itemmanament/index")
	public String itemManament(Model model) {
		// tạo model ảo
		Product productItems = new Product();
		model.addAttribute("product", productItems);
		Category categoryItems = new Category();
		model.addAttribute("category", categoryItems);
		Supplier supplierItems = new Supplier();
		model.addAttribute("supplier", supplierItems);
		Discount discountItems = new Discount();
		model.addAttribute("discount", discountItems);

		// Lấy list
		List<Category> categoryItem = categoryDAO.findAll();
		model.addAttribute("categoryItem", categoryItem);
		List<Supplier> supplieritem = supplierDAO.findAll();
		model.addAttribute("supplierItem", supplieritem);
		List<Discount> discountItem = discountDAO.findAll();
		model.addAttribute("discountItem", discountItem);
		List<Product> items = dao.findAll();
		model.addAttribute("items", items);
		
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
		return "ItemManament";
	}

	@RequestMapping("/itemmanament/product/edit/{id}")
	public String prouctEdit(Model model, @PathVariable("id") int id) {
		// tạo model ảo
		Product productItems = dao.findById(id).get();
		model.addAttribute("product", productItems);
		Category item = new Category();
		model.addAttribute("category", item);
		Supplier supplierItems = new Supplier();
		model.addAttribute("supplier", supplierItems);
		Discount discountItems = new Discount();
		model.addAttribute("discount", discountItems);

		// Lấy list
		List<Category> categoryItem = categoryDAO.findAll();
		model.addAttribute("categoryItem", categoryItem);
		List<Supplier> supplieritem = supplierDAO.findAll();
		model.addAttribute("supplierItem", supplieritem);
		List<Discount> discountItem = discountDAO.findAll();
		model.addAttribute("discountItem", discountItem);
		List<Product> items = dao.findAll();
		model.addAttribute("items", items);
		return "ItemManament";
	}

	@RequestMapping("/itemmanament/category/edit/{id}")
	public String categoryEdit(Model model, @PathVariable("id") int id) {
		// tạo model ảo
		Category item = categoryDAO.findById(id).get();
		model.addAttribute("category", item);
		Supplier supplierItems = new Supplier();
		model.addAttribute("supplier", supplierItems);
		Discount discountItems = new Discount();
		model.addAttribute("discount", discountItems);
		Product productItems = new Product();
		model.addAttribute("product", productItems);

		// Lấy list
		List<Category> categoryItem = categoryDAO.findAll();
		model.addAttribute("categoryItem", categoryItem);
		List<Supplier> supplieritem = supplierDAO.findAll();
		model.addAttribute("supplierItem", supplieritem);
		List<Discount> discountItem = discountDAO.findAll();
		model.addAttribute("discountItem", discountItem);
		List<Product> items = dao.findAll();
		model.addAttribute("items", items);
		return "ItemManament";
	}

	@RequestMapping("/itemmanament/supplier/edit/{id}")
	public String supplierEdit(Model model, @PathVariable("id") int id) {
		// tạo model ảo
		Supplier item = supplierDAO.findById(id).get();
		model.addAttribute("supplier", item);
		Category categoryItems = new Category();
		model.addAttribute("category", categoryItems);
		Discount discountItems = new Discount();
		model.addAttribute("discount", discountItems);
		Product productItems = new Product();
		model.addAttribute("product", productItems);

		// Lấy list
		List<Category> categoryItem = categoryDAO.findAll();
		model.addAttribute("categoryItem", categoryItem);
		List<Supplier> supplieritem = supplierDAO.findAll();
		model.addAttribute("supplierItem", supplieritem);
		List<Discount> discountItem = discountDAO.findAll();
		model.addAttribute("discountItem", discountItem);
		List<Product> items = dao.findAll();
		model.addAttribute("items", items);
		return "ItemManament";
	}

	@RequestMapping("/itemmanament/discount/edit/{id}")
	public String discountEdit(Model model, @PathVariable("id") int id) {
		// tạo model ảo
		Discount discountItems = discountDAO.findById(id).get();
		model.addAttribute("discount", discountItems);
		Category categoryItems = new Category();
		model.addAttribute("category", categoryItems);
		Supplier supplierItems = new Supplier();
		model.addAttribute("supplier", supplierItems);
		Product productItems = new Product();
		model.addAttribute("product", productItems);

		// Lấy list
		List<Category> categoryItem = categoryDAO.findAll();
		model.addAttribute("categoryItem", categoryItem);
		List<Supplier> supplieritem = supplierDAO.findAll();
		model.addAttribute("supplierItem", supplieritem);
		List<Discount> discountItem = discountDAO.findAll();
		model.addAttribute("discountItem", discountItem);
		List<Product> items = dao.findAll();
		model.addAttribute("items", items);
		return "ItemManament";
	}

	// bang product
	@RequestMapping("/itemmanament/product/create")
	public String productCreate(Product item, @RequestParam("attach") MultipartFile attach) {
		// thêm 1 danh mục mới vào bảng categories
		try {
			if (!attach.isEmpty()) {
				String fileName = attach.getOriginalFilename();
				String filePath = "D:/D/SOF3021_Java5/java5/ASM_CuaHangLaptop/src/main/resources/static/uploadImages/"
						+ fileName;
				File file = new File(filePath);
				attach.transferTo(file);
				System.out.println("" + app.getRealPath("/resources/static/uploadphoto/") + fileName);
				item.setImage(fileName);
				dao.save(item);
				return "redirect:/itemmanament/index";
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return "redirect:/itemmanament/index";
	}

	@RequestMapping("/itemmanament/product/update/{id}")
	public String productUpdate(Product item, @PathVariable("id") int id,
			@RequestParam("attach") MultipartFile attach) {
		// thêm 1 danh mục mới vào bảng categories
		try {
			if (!attach.isEmpty()) {
				String fileName = attach.getOriginalFilename();
				String filePath = "D:/D/SOF3021_Java5/java5/ASM_CuaHangLaptop/src/main/resources/static/uploadImages/"
						+ fileName;
				File file = new File(filePath);
				attach.transferTo(file);
				System.out.println("" + app.getRealPath("/resources/static/uploadphoto/") + fileName);
				item.setImage(fileName);
				item.setId(id);
				dao.save(item);
				return "redirect:/itemmanament/index";
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return "redirect:/itemmanament/index";
	}

	@RequestMapping("/itemmanament/product/delete/{id}")
	public String productDelete(@PathVariable("id") int id) {
		dao.deleteById(id);
		return "redirect:/itemmanament/index";
	}

	@RequestMapping("/itemmanament/product/clear")
	public String productClear() {
		return "redirect:/itemmanament/index";
	}

	// bang category
	@RequestMapping("/itemmanament/category/create")
	public String categoryCreate(Category item) {
		// thêm 1 danh mục mới vào bảng categories
		categoryDAO.save(item);
		return "redirect:/itemmanament/index";
	}

	@RequestMapping("/itemmanament/category/update/{id}")
	public String categoryUpdate(Category item, @PathVariable("id") int id) {
		// thêm 1 danh mục mới vào bảng categories
		item.setId(id);
		categoryDAO.save(item);
		return "redirect:/itemmanament/index";
	}

	@RequestMapping("/itemmanament/category/delete/{id}")
	public String categoryDelete(@PathVariable("id") int id) {
		categoryDAO.deleteById(id);
		return "redirect:/itemmanament/index";
	}

	@RequestMapping("/itemmanament/category/clear")
	public String categoryClear() {
		return "redirect:/itemmanament/index";
	}

	// Bang supplier
	@RequestMapping("/itemmanament/supplier/create")
	public String supplierCreate(Supplier item) {
		// thêm 1 danh mục mới vào bảng categories
		supplierDAO.save(item);
		return "redirect:/itemmanament/index";
	}

	@RequestMapping("/itemmanament/supplier/update/{id}")
	public String supplierUpdate(Supplier item, @PathVariable("id") int id) {
		// thêm 1 danh mục mới vào bảng categories
		item.setId(id);
		supplierDAO.save(item);
		return "redirect:/itemmanament/index";
	}

	@RequestMapping("/itemmanament/supplier/delete/{id}")
	public String supplierDelete(@PathVariable("id") int id) {
		supplierDAO.deleteById(id);
		return "redirect:/itemmanament/index";
	}

	@RequestMapping("/itemmanament/supplier/clear")
	public String supplierClear() {
		return "redirect:/itemmanament/index";
	}

	// Bang discount
	@RequestMapping("/itemmanament/discount/create")
	public String discountCreate(Discount item) {
		// thêm 1 danh mục mới vào bảng categories
		discountDAO.save(item);
		return "redirect:/itemmanament/index";
	}

	@RequestMapping("/itemmanament/discount/update/{id}")
	public String discountUpdate(Discount item, @PathVariable("id") int id) {
		// thêm 1 danh mục mới vào bảng categories
		item.setId(id);
		discountDAO.save(item);
		return "redirect:/itemmanament/index";
	}

	@RequestMapping("/itemmanament/discount/delete/{id}")
	public String discountDelete(@PathVariable("id") int id) {
		discountDAO.deleteById(id);
		return "redirect:/itemmanament/index";
	}

	@RequestMapping("/itemmanament/discount/clear")
	public String discountClear() {
		return "redirect:/itemmanament/index";
	}

	@GetMapping("/itemmanament/index/export")
	public String exportToExcel() {
		List<Product> productList = dao.findAll();

		Workbook workbook = new XSSFWorkbook();
		Sheet sheet = workbook.createSheet("Products");
		Row headerRow = sheet.createRow(0);

		String[] columns = { "Id", "Product name", "Price", "Quantity", "Category", "Supplier", "Available", "Image" };
		for (int i = 0; i < columns.length; i++) {
			Cell cell = headerRow.createCell(i);
			cell.setCellValue(columns[i]);
		}

		int rowNum = 1;
		for (Product product : productList) {
			Row row = sheet.createRow(rowNum++);

			row.createCell(0).setCellValue(product.getId());
			row.createCell(1).setCellValue(product.getProductname());
			row.createCell(2).setCellValue(product.getPrice());
			row.createCell(3).setCellValue(product.getQuantity());
			row.createCell(4).setCellValue(product.getCategory().getCategoryname());
			row.createCell(5).setCellValue(product.getSupplier().getSuppliername());
			row.createCell(6).setCellValue(product.isAvailable());
			row.createCell(7).setCellValue(product.getImage());
		}

		try (FileOutputStream fileOut = new FileOutputStream("D:/products.xlsx")) {
			workbook.write(fileOut);
		} catch (IOException e) {
			e.printStackTrace();
			return "redirect:/itemmanament/index"; // Return an error view or message
		}

		try {
			workbook.close();
		} catch (IOException e) {
			e.printStackTrace();
		}

		return "redirect:/itemmanament/index"; // Redirect to a relevant page
	}
}

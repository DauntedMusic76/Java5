package com.main.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import org.apache.poi.ss.usermodel.*;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.main.dao.AccountDAO;
import com.main.entity.Account;
import com.main.entity.Product;

import jakarta.servlet.ServletContext;
import jakarta.servlet.http.HttpSession;

@Controller
public class AccountController {
	@Autowired
	AccountDAO dao;

	@Autowired
	ServletContext app;
	
	@Autowired
	HttpSession session;

	@RequestMapping("/account/ThongTinNguoiDung2")
	public String list(Model model) {
		Account item = new Account();
		model.addAttribute("item", item);
		List<Account> items = dao.findAll();
		model.addAttribute("items", items);
		
		Object isAdmin = session.getAttribute("idUser");
		boolean checkCart = true;
		if (isAdmin != null) {
			Account account = dao.findById((int) session.getAttribute("idUser")).get();
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
		return ("/ThongTinNguoiDung2");
	}

	@RequestMapping("/account/edit/{id}")
	public String edit(Model model, @PathVariable("id") Integer id) {
		// 2. tìm theo id
		Account item = dao.findById(id).get();
		model.addAttribute("item", item);
		List<Account> items = dao.findAll();
		model.addAttribute("items", items);
		return "/ThongTinNguoiDung2";
	}

	@RequestMapping("/account/create")
	public String create(Account item, @RequestParam("attach") MultipartFile attach) {
		try {
			if (!attach.isEmpty()) {
				String fileName = attach.getOriginalFilename();
				// Đường dẫn mới
				String filePath = "D:/D/SOF3021_Java5/java5/ASM_CuaHangLaptop/src/main/resources/static/uploadImages/"
						+ fileName;
				File file = new File(filePath);
				attach.transferTo(file);
				System.out.println("" + app.getRealPath("/resources/static/uploadimages/") + fileName);
				item.setPhoto(fileName);
				dao.save(item);
				return "redirect:/account/ThongTinNguoiDung2";
			}
		} catch (Exception ex) {
			System.out.println("Loi");
			ex.printStackTrace();
		}
		return "redirect:/account/ThongTinNguoiDung2";
	}

	@RequestMapping("/account/update")
	public String update(@ModelAttribute("item") Account item, @RequestParam("attach") MultipartFile attach) {
		try {
			String fileName = attach.getOriginalFilename();
			// Đường dẫn mới
			String filePath = "D:/D/SOF3021_Java5/java5/ASM_CuaHangLaptop/src/main/resources/static/uploadImages/"
					+ fileName;
			File file = new File(filePath);
			attach.transferTo(file);
			System.out.println("" + app.getRealPath("/resources/static/uploadimages/") + fileName);
			item.setPhoto(fileName);
			dao.save(item);
			return "redirect:/account/ThongTinNguoiDung2";

		} catch (Exception ex) {
			System.out.println("Loi");
			ex.printStackTrace();
		}
		dao.save(item);
		return "redirect:/account/ThongTinNguoiDung2";
	}

	@RequestMapping("/account/delete/{id}")
	public String delete(@PathVariable("id") Integer id) {
		dao.deleteById(id);
		return "redirect:/account/ThongTinNguoiDung2";
	}

	@RequestMapping("/account/clear")
	public String clear() {
		return "redirect:/account/ThongTinNguoiDung2";
	}

	@GetMapping("/ThongTinNguoiDung2/export")
	public String exportToExcel() {
		List<Account> accountList = dao.findAll();

		Workbook workbook = new XSSFWorkbook();
		Sheet sheet = workbook.createSheet("Products");
		Row headerRow = sheet.createRow(0);

		String[] columns = { "id", "Username", "Password", "Email", "Fullname", "Role", "Photo" };
		for (int i = 0; i < columns.length; i++) {
			Cell cell = headerRow.createCell(i);
			cell.setCellValue(columns[i]);
		}

		int rowNum = 1;
		for (Account account : accountList) {
			Row row = sheet.createRow(rowNum++);

			row.createCell(0).setCellValue(account.getId());
			row.createCell(1).setCellValue(account.getUsername());
			row.createCell(2).setCellValue(account.getPassword());
			row.createCell(3).setCellValue(account.getEmail());
			row.createCell(4).setCellValue(account.getFullname());
			row.createCell(5).setCellValue(account.getRoleid());
			row.createCell(6).setCellValue(account.getPhoto());
		}

		try (FileOutputStream fileOut = new FileOutputStream("D:/account.xlsx")) {
			workbook.write(fileOut);
		} catch (IOException e) {
			e.printStackTrace();
			return "redirect:/account/ThongTinNguoiDung2"; // Return an error view or message
		}

		try {
			workbook.close();
		} catch (IOException e) {
			e.printStackTrace();
		}

		return "redirect:/account/ThongTinNguoiDung2"; // Redirect to a relevant page
	}

}

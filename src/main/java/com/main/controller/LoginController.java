package com.main.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.main.dao.AccountDAO;
import com.main.entity.Account;
import com.main.service.VerificationCodeService;

import jakarta.servlet.http.HttpSession;

@Controller
public class LoginController {

    @Autowired
    AccountDAO dao;

    @Autowired
    private VerificationCodeService verificationCodeService;
    
    @Autowired
    HttpSession session;

    @RequestMapping("/login")
    public String index(Model model) {
        return "/login";
    }

    @RequestMapping(value = "/login/dangnhap", method = RequestMethod.POST)
    public String dangnhap(@RequestParam("email") String email, @RequestParam("pass") String pass, Model model) {
        String Email = verificationCodeService.getVerification(email);
        String Pass = verificationCodeService.getVerification(pass);
        try {
            if (Email != null && Pass != null) {
                Account account = dao.findByEmail(Email);
                // Log retrieved account for debugging
//                System.out.println("Retrieved Account: " + account);
                if (account != null && account.getPassword().equals(Pass)) {  // Check if the password matches
                    model.addAttribute("successMessage", "Đăng nhập thành công!");
                    session.setAttribute("idUser", account.getId());
                    return "redirect:/listproduct";  // Correct path without "/"
                } else {
                    model.addAttribute("errorMessage", "Tài khoản không tồn tại hoặc mật khẩu không đúng!");
                }
            } else {
                model.addAttribute("errorMessage", "Email hoặc mật khẩu không hợp lệ!");
            }
        } catch (Exception e) {
            model.addAttribute("errorMessage", "Thông tin hoặc tài khoản không chính xác: " + e.getMessage());
        }

        return "/login";
    }

}

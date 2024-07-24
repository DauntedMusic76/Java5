package com.main.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.main.dao.AccountDAO;
import com.main.entity.Account;
import com.main.service.VerificationCodeService;

import java.awt.print.Printable;
import java.util.Random;

@Controller
public class ForgotPasswordController {

    private static final Logger logger = LoggerFactory.getLogger(ForgotPasswordController.class);

    @Autowired
    private JavaMailSender mailSender;

    @Autowired
    private AccountDAO accountDAO;

    @Autowired
    private VerificationCodeService verificationCodeService;

    @RequestMapping("/forgotpassword")
    public String showEmailForm() {
        return "forgotpassword";
    }

    @PostMapping("/forgotpassword/layma")
    public String forgotPassword(@RequestParam("to") String to, Model model) {

        try {
            if (to.equals("")) {
                model.addAttribute("successMessage", "Email không được để trống!");
                return "forgotpassword";
            } else {
                String randomNumbers = generateRandomNumbers();
                verificationCodeService.storeVerificationCode(to, randomNumbers);

                String fullMessage = "\n\nMã xác nhận của bạn là: " + randomNumbers;

                SimpleMailMessage email = new SimpleMailMessage();
                email.setTo(to);
                email.setText(fullMessage);

                mailSender.send(email);
                logger.info("Email sent to {}", to);

                model.addAttribute("successMessage", "Email đã được gửi thành công!");
                System.out.print(fullMessage);
            }
        } catch (Exception e) {
            logger.error("Error while sending email", e);
            model.addAttribute("errorMessage", "Lỗi khi gửi email: " + e.getMessage());
        }

        return "forgotpassword";
    }

    @PostMapping("/forgotpassword/doimatkhau")
    public String changePassword(@RequestParam("to") String to, @RequestParam("ma") String ma,
                                 @RequestParam("newPassword") String newPassword, Model model) {

        String storedCode = verificationCodeService.getVerificationCode(to);

        try {
            if (storedCode != null && storedCode.equals(ma)) {
                Account account = accountDAO.findByEmail(to);
                if (account != null) {
                    account.setPassword(newPassword);
                    accountDAO.save(account);
                    verificationCodeService.removeVerificationCode(to);
                    model.addAttribute("successMessage", "Đổi mật khẩu thành công!");
                } else {
                    model.addAttribute("errorMessage", "Tài khoản không tồn tại!");
                }
            } else {
                model.addAttribute("errorMessage", "Mã xác nhận không chính xác hoặc tài khoản không tồn tại!");
            }
        } catch (Exception e) {
            model.addAttribute("errorMessage", "Lỗi khi đổi mật khẩu: " + e.getMessage());
        }

        return "forgotpassword";
    }

    private String generateRandomNumbers() {
        Random random = new Random();
        StringBuilder numbers = new StringBuilder();

        for (int i = 0; i < 5; i++) {
            numbers.append(random.nextInt(10));
        }

        return numbers.toString();
    }
}

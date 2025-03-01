package com.xworkz.gym.controller;

import com.xworkz.gym.entity.RegistrationEntity;
import com.xworkz.gym.service.GymService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@RequestMapping("/")
@Controller
public class UserLoginController {
    @Autowired
    GymService gymService;

    @Autowired
    PasswordEncoder encoder;

    @PostMapping("/userLogin")
    public String onUserLogin(@RequestParam String email, @RequestParam String password, Model model) {

        RegistrationEntity value = gymService.getData(email, password);
        email = value.getEmail();
        System.err.println("email" + email + "====" + value.getPassword() + "====" + value.getLogInCount());
        if (value == null) {
            return "UserLogin";
        }
        if (password.equals(value.getPassword()) && (value.getLogInCount() == -1)) {
            model.addAttribute("email", email);
            return "UpdatePassword";
        }
        if (encoder.matches(password, value.getPassword()) && (value.getLogInCount() == 0)){
            model.addAttribute("email",email);
            return "UserProfile";
        }
        if (encoder.matches(password, value.getPassword()) &&(value.getLogInCount()>=0 && value.getLogInCount()<3)) {
            gymService.resetLoginCount(email,password);
            model.addAttribute("email",email);
            return "UserProfile";
        }
        if (!(encoder.matches(password, value.getPassword())) && (value.getLogInCount() == 3)) {
            model.addAttribute("email",email);
            return "UserLogin";
        }

        return "index";
    }
    @PostMapping("/resetPassword")
    public String forgotPassword(@RequestParam String email, @RequestParam String newPassword, @RequestParam String confirmPassword) {
        System.out.println("Received request for resetting password:");
        System.out.println("Email: " + email);
        System.out.println("New Password: " + newPassword);
        System.out.println("Confirm Password: " + confirmPassword);

        String response = gymService.resetPasswordByEmail(email, newPassword, confirmPassword);

        if ("password updated successfully".equals(response)) {
            return "UpdatePasswordSuccess";
        } else {
            return "ForgotPassword";
        }
    }

}

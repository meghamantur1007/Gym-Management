package com.xworkz.gym.controller;

import com.xworkz.gym.constant.PackageEnum;
import com.xworkz.gym.dto.AdminLogInDto;
import com.xworkz.gym.service.GymService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;


@RequestMapping("/")
@Controller
public class AdminLoginController {

    @Autowired
    GymService gymService;

    List<PackageEnum> packages = new ArrayList<>(Arrays.asList(PackageEnum.values()));
    @PostMapping("/logIn")
    public String logIn(AdminLogInDto dto, Model model) throws NoSuchAlgorithmException {
        System.out.println("dto===" + dto);
        boolean entity = gymService.getAll(dto);

        if (entity) {
            return "Success";
        } else {
            model.addAttribute("error", "Email or Password does not match");
            return "AdminLogin";
        }
    }

}


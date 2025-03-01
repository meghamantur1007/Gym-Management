package com.xworkz.gym.controller;

import com.xworkz.gym.constant.GymNameEnum;
import com.xworkz.gym.constant.PackageEnum;
import com.xworkz.gym.dto.RegistrationDto;
import com.xworkz.gym.service.GymService;
import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import javax.validation.ConstraintViolation;
import java.io.*;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Set;


@RequestMapping("/")
@Controller
public class RegistrationController {
    @Autowired
    GymService gymService;

    @GetMapping("/registration")
    public String onRegistration(Model model) {
        List<PackageEnum> packages = new ArrayList<>(Arrays.asList(PackageEnum.values()));
        List<GymNameEnum> gymNames = new ArrayList<>(Arrays.asList(GymNameEnum.values()));
        model.addAttribute("packages", packages);
        model.addAttribute("gymNames", gymNames);
        return "Registration";
    }

    @PostMapping("/registration")
    public String register( RegistrationDto dto) {
        System.out.println("Registration Dto=====" + dto);
        Set<ConstraintViolation<RegistrationDto>> set = gymService.saveRegistration(dto);
        if (set.isEmpty()) {
            return "RegistrationSuccess";
        } else {
            return "Registration";
        }
    }
}

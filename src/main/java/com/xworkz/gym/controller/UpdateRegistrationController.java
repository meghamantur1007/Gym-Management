package com.xworkz.gym.controller;

import com.xworkz.gym.constant.PackageEnum;
import com.xworkz.gym.entity.UpdateRegistrationEntity;
import com.xworkz.gym.service.GymService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@RequestMapping("/")
@Controller
public class UpdateRegistrationController {

    @Autowired
    GymService gymService;

    @GetMapping("/update")
    public String showUpdatePage(Model model) {
        List<PackageEnum> packages = new ArrayList<>(Arrays.asList(PackageEnum.values()));
        model.addAttribute("packages", packages);
        return "Update";
    }

    @PostMapping("/searchEmail")
    public String getDetailsByEmail(@RequestParam String email, Model model) {
        UpdateRegistrationEntity details = gymService.getDetailsByEmail(email);
        if (details != null) {
            model.addAttribute("details", details);
            return "Update";
        }
        return "Success";
    }

    @PostMapping("/update")
    public String updateDetails(@RequestParam int id,
                                @RequestParam String packages,
                                @RequestParam String trainer,
                                @RequestParam double amount,
                                @RequestParam double paidAmount,
                                @RequestParam double balance,
                                @RequestParam int installment, Model model) {
        boolean value = gymService.updateDetailsById(packages, trainer, amount, paidAmount, balance, installment, id);
        if (value) {
            return "UpdateValueSuccess";
        }
        return "Success";
    }
}

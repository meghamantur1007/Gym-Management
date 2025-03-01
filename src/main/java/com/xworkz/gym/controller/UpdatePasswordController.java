package com.xworkz.gym.controller;

import com.xworkz.gym.service.GymService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/")
public class UpdatePasswordController {

    @Autowired
    GymService gymService;

    @PostMapping("/updatePassword")
    public String updatePassword(@RequestParam String oldPassword,@RequestParam String newPassword,@RequestParam String confirmPassword,@RequestParam String email){
        boolean value= gymService.updatePassword(oldPassword,newPassword,confirmPassword,email);
        if(value){
            return "UpdatePasswordSuccess";
        }
        return "UpdatePassword";
    }
}

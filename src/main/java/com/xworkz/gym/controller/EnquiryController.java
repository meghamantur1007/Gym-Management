package com.xworkz.gym.controller;

import com.xworkz.gym.dto.EnquiryDto;
import com.xworkz.gym.service.GymService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/")
@Controller
public class EnquiryController {
    @Autowired
    GymService gymService;

    @PostMapping("/enquiry")
    public String enquiry(EnquiryDto enquiryDto, Model model) {
        boolean save = gymService.saveEnquiry(enquiryDto);

        if (save) {
            model.addAttribute("success","Enquiry is successful");
        }
        return "Enquiry";
    }
}

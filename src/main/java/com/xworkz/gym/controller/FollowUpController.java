package com.xworkz.gym.controller;

import com.xworkz.gym.entity.EnquiryEntity;
import com.xworkz.gym.entity.ViewDetailsEntity;
import com.xworkz.gym.service.GymService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.time.LocalDateTime;
import java.util.List;

@RequestMapping("/")
@Controller
public class FollowUpController {
    @Autowired
    GymService gymService;

    @GetMapping("/follow")
    public String showFollowPage(Model model) {
        List<EnquiryEntity> enquiries = gymService.getAllEnquiries();
        model.addAttribute("enquiries", enquiries);
        return "Follow";
    }

    @PostMapping("/updateEnquiry")
    public String updateEnquiry(@RequestParam("id") int id,
                                @RequestParam String name,
                                @RequestParam long phoneNumber,
                                @RequestParam("status") String status,
                                @RequestParam("description") String description,
                                Model model) {
        gymService.updateStatusAndDescription(id, status, description);
        gymService.saveViewDetails(id, name, phoneNumber, description);

        List<EnquiryEntity> updatedEnquiries = gymService.getAllEnquiries();
        model.addAttribute("enquiries", updatedEnquiries);

        model.addAttribute("success", "Status and Description Updated Successfully");
        return "Follow";
    }

    @GetMapping("/viewDetails")
    public String viewDetails(@RequestParam int id, Model model) {
        List<ViewDetailsEntity> data = gymService.getAllData(id);
        System.out.println("viewDetails in controller======" + data.toString());

        model.addAttribute("data", data);
        LocalDateTime updatedOn = null;
        for (ViewDetailsEntity value : data) {
            updatedOn = value.getUpdatedOn();
        }
        model.addAttribute("formattedDate", updatedOn);
        return "ViewDetails";
    }
}

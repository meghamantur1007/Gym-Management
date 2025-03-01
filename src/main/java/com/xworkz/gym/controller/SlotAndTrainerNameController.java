package com.xworkz.gym.controller;

import com.xworkz.gym.service.GymService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/")
public class SlotAndTrainerNameController {

    @Autowired
    GymService gymService;

    @PostMapping("/slotAndTrainerName")
    public String onSlotAndTrainerName(@RequestParam String email, Model model) {
        Object[] slotAndTrainerName = gymService.getSlotAndTrainerName(email);
        if (slotAndTrainerName != null) {
            model.addAttribute("slot", slotAndTrainerName[0]);
            model.addAttribute("trainerName", slotAndTrainerName[1]);
            model.addAttribute("email",email);
        }
        else {
            model.addAttribute("errorMessage", "No data found for this email or you have entered the wrong email address.");
            model.addAttribute("slot", "Not Found");
            model.addAttribute("trainerName", "Not Found");
        }
        return "SlotAndTrainerName";
    }
}

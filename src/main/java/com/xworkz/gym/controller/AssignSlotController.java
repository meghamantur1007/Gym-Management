package com.xworkz.gym.controller;

import com.xworkz.gym.entity.TrainerDetailsEntity;
import com.xworkz.gym.service.GymService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/")
public class AssignSlotController {
    @Autowired
    GymService gymService;

    @GetMapping("/assignSlot")
    public String onAssignSlot(Model model) {
        List<TrainerDetailsEntity> trainerDetails = gymService.getTrainerDetails();
        System.out.println("details----"+trainerDetails);
        if (trainerDetails != null && !trainerDetails.isEmpty()) {
            model.addAttribute("timeslots", trainerDetails);
            model.addAttribute("trainerNames", trainerDetails);
            return "AssignSlot";
        } else {
            return "index";
        }
    }

    @PostMapping("/assignSlot")
    public String onUpdateSlotAndTrainer(String email,String slot,String trainerName,Model model){
        boolean saved=gymService.updateSlotAndTrainerName(email,slot,trainerName);
        if(saved){
            model.addAttribute("updated","Trainer and Slot are Assigned");
            return "AssignSlot";
        }
        return "index";
    }


}

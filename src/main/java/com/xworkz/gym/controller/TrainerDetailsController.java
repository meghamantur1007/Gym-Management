package com.xworkz.gym.controller;

import com.xworkz.gym.dto.TrainerDetailsDto;
import com.xworkz.gym.entity.TimeSlotEntity;
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
public class TrainerDetailsController {
    @Autowired
    private GymService gymService;

    @GetMapping("/trainerDetails")
    public String getTimeSlots(Model model) {
        List<TimeSlotEntity> timeSlotList = gymService.getAllTimeSlots();

        if (timeSlotList != null && !timeSlotList.isEmpty()) {
            model.addAttribute("timeslots", timeSlotList);
            return "TrainerDetails";
        } else {
            return "index";
        }
    }

    @PostMapping("/trainerDetails")
    public String saveTrainerDetails(TrainerDetailsDto trainerDetailsDto,Model model){
        boolean save=gymService.saveTrainerDetails(trainerDetailsDto);
        if(save){
            model.addAttribute("saved","Trainer Details are saved");
            return "TrainerDetails";
        }
        return "index";
    }
}

package com.xworkz.gym.controller;

import com.xworkz.gym.dto.TimeSlotDto;
import com.xworkz.gym.service.GymService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.beans.PropertyEditorSupport;
import java.time.Duration;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;

@Controller
public class TimeSlotController {
    @Autowired
    GymService gymService;

    @InitBinder
    public void initBinder(WebDataBinder binder) {
        binder.registerCustomEditor(LocalTime.class, new PropertyEditorSupport() {
            @Override
            public void setAsText(String text) {
                setValue(LocalTime.parse(text, DateTimeFormatter.ofPattern("HH:mm")));
            }
        });
    }
    @PostMapping("/timeSlot")
    public String onTimeSlot(@ModelAttribute TimeSlotDto timeSlotDto, Model model) {
        System.out.println("Received DTO: " + timeSlotDto);
        boolean saved = gymService.saveTimeSlots(timeSlotDto);
        if (saved) {
            model.addAttribute("savedData", "Time Slots are Saved");
            return "TimeSlot";
        }
        else {
            model.addAttribute("error", "Time Slots are not Saved");
            return "TimeSlot";
        }
    }
}

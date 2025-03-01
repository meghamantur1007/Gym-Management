package com.xworkz.gym.controller;

import com.xworkz.gym.constant.GymNameEnum;
import com.xworkz.gym.entity.TrainerDetailsEntity;
import com.xworkz.gym.service.GymService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
@RequestMapping("/")
public class RemoveTrainerController {

    @Autowired
    GymService gymService;

    @GetMapping("/removeTrainer")
    public String getTrainerDetails(Model model) {
        List<TrainerDetailsEntity> trainerDetails = gymService.getTrainerDetails();

        System.out.println("Trainer Details Retrieved: " + trainerDetails); // Debugging output

        if (trainerDetails != null && !trainerDetails.isEmpty()) {
            model.addAttribute("trainerDetails", trainerDetails);
        }

        return "RemoveTrainer";
    }
    @PostMapping("/removeTrainer")
    public String removeTrainer(@RequestParam("trainerName") String trainerName, Model model) {
        List<Object[]> trainees = gymService.getTraineesByTrainerName(trainerName);

        if (!trainees.isEmpty()) {
            model.addAttribute("error", "Cannot remove trainer, Assign Trainees to a different trainer!");
            model.addAttribute("trainees", trainees);
            return "RemoveTrainer";
        }

        gymService.removeTrainer(trainerName);
        model.addAttribute("success", "Trainer removed successfully!");
        return "RemoveTrainer";
    }


}

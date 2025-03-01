package com.xworkz.gym.controller;

import com.xworkz.gym.entity.RegistrationEntity;
import com.xworkz.gym.service.GymService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/")
public class ExerciseAndDietPlanController {

    @Autowired
    private GymService gymService;

    @GetMapping("/getNameAndPlanByEmail")
    public String getNameAndPlan(@RequestParam String email, Model model) {
        RegistrationEntity data = gymService.getRegistrationEntity(email);

        if (data != null) {
            model.addAttribute("name", data.getName());
            model.addAttribute("plan", data.getPlan());
        }
        return "SetExerciseAndDietPlans";
    }


    @PostMapping("/assignDAW")
    public String assignDAW(@RequestParam("name")String name,@RequestParam("workoutPlan")String workoutPlan ,@RequestParam("dietPlan")String dietPlan,Model model){

        boolean saved =gymService.updateDAWForClients(name,dietPlan,workoutPlan);
        model.addAttribute("success","Exercises and Diet Plans are saved Successfully");
        if (saved){
            return "SetExerciseAndDietPlans";
        }
        return "index";
    }

    @GetMapping("/viewDAW")
    public String dawDetails(@RequestParam("email")String email, Model model){

        RegistrationEntity registrationEntity =gymService.getRegistrationEntity(email);
        if (registrationEntity!=null){
            model.addAttribute("registrationEntity",registrationEntity);
            return "ViewDietAndExercise";
        }
        return "index";
    }

}

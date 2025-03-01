package com.xworkz.gym.restController;

import com.xworkz.gym.entity.UpdateRegistrationEntity;
import com.xworkz.gym.service.GymService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@RestController
public class UpdateRestController {

    @Autowired
    GymService gymService;

    @GetMapping(value = "/email/{email}", produces = MediaType.APPLICATION_JSON_VALUE)
    public String onUserEmail(@PathVariable String email, @RequestParam(required = false) String alternateEmail) {

        if (alternateEmail != null && alternateEmail.equals(email)) {
            return "Email should be different";
        }
        Long count = gymService.getCountOfEmail(email);
        if (count > 0) {
            return "You can update the form";
        } else {
            return "This email does not exist";
        }
    }

}





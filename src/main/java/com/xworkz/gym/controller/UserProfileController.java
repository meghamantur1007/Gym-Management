package com.xworkz.gym.controller;

import com.xworkz.gym.dto.RegistrationDto;
import com.xworkz.gym.entity.RegistrationEntity;
import com.xworkz.gym.service.GymService;
import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

@RequestMapping("/")
@Controller
public class UserProfileController {
    @Autowired
    GymService gymService;

    @PostMapping("/updateUserProfile")
    public String onUserProfile(@RequestParam int age,
                                @RequestParam float height,
                                @RequestParam float weight,
                                @RequestParam String plan,
                                @RequestParam String email,
                                @RequestParam("picture") MultipartFile multipartFile) throws IOException {

            if (multipartFile.isEmpty()) {
                String fileName = multipartFile.getOriginalFilename();
                boolean saved = gymService.userProfile(age, height, weight, plan, email, fileName);
                if (saved) {
                    return "UpdateProfileSuccess";
                } else {

                    return "UpdateUserProfile";

                }
            }else {
                System.out.println("multipartFile===" + multipartFile);
                System.out.println("multipartFile OriginalFilename==" + multipartFile.getOriginalFilename());
                System.out.println("multipartFile==" + multipartFile.getContentType());

                byte[] bytes = multipartFile.getBytes();
                Path path = Paths.get("C:\\fileUpload\\" + System.currentTimeMillis() + ".jpg");
                Files.write(path, bytes);
                String filePath = path.getFileName().toString();
                System.err.println("filePath====" + filePath);
                boolean saved = gymService.userProfile(age, height, weight, plan, email, filePath);
                if (saved) {
                    return "UpdateProfileSuccess";
                } else {

                    return "UpdateUserProfile";

                }
            }
    }

    @GetMapping("/updateProfile")
    public String onUserProfile(@RequestParam String email,Model model,MultipartFile multipartFile) {

            RegistrationEntity data = gymService.getRegistrationEntity(email);
        System.out.println("data--------"+data.toString());
            model.addAttribute("data", data);
            model.addAttribute("email",email);
            return "UpdateUserProfile";
    }

    @GetMapping("/viewProfile")
    public String viewProfile(@RequestParam String email, Model model){
        RegistrationEntity data=gymService.getRegistrationEntity(email);
        model.addAttribute("data",data);
        return "ViewUserProfile";
    }

    @GetMapping("/download")
    public void display(HttpServletResponse response, @RequestParam String filePath) throws Exception {
        System.out.println("this is image======" + filePath);
        response.setContentType("Image/jpeg");
        File file = new File("C:\\fileUpload\\" + filePath);
        InputStream inputStream = new BufferedInputStream(new FileInputStream(file));
        ServletOutputStream outputStream = response.getOutputStream();
        IOUtils.copy(inputStream, outputStream);
        response.flushBuffer();
    }
}

package com.xworkz.gym.dto;

import lombok.Data;
import lombok.NoArgsConstructor;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;

@Data
@NoArgsConstructor
public class AdminLogInDto {
    @NotBlank(message = "Email cannot be empty")
    @Email(message = "Invalid email format")
    private String logInId;

    private String password;
}

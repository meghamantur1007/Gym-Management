package com.xworkz.gym.dto;

import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.web.multipart.MultipartFile;

import javax.validation.constraints.*;

@Data
@NoArgsConstructor
public class RegistrationDto {

    @NotBlank(message = "Name cannot be empty")
    @Size(min = 3, max = 20, message = "Name should be between 3 to 20 characters")
    @Pattern(regexp = "^[A-Za-z ]+$", message = "Name should contain only alphabets and spaces")
    private String name;

    @NotBlank(message = "Email cannot be empty")
    @Email(message = "Invalid email format")
    private String email;

    private long phoneNumber;

    @NotBlank(message = "Package cannot be empty")
    private String packages;

    @NotBlank(message = "Trainer selection is required")
    @Pattern(regexp = "yes|no", message = "Trainer should be either 'yes' or 'no'")
    private String trainer;

    @NotBlank(message = "Gym name cannot be empty")
    private String gymName;

    @NotNull(message = "Amount cannot be null")
    @Positive(message = "Amount must be greater than zero")
    private double amount;

    @Min(value = 0, message = "Discount cannot be negative")
    @Max(value = 100, message = "Discount cannot exceed 100%")
    private double discount;

    @NotNull(message = "Paid amount cannot be null")
    @PositiveOrZero(message = "Paid amount cannot be negative")
    private double paidAmount;

    @NotNull(message = "Balance cannot be null")
    @PositiveOrZero(message = "Balance cannot be negative")
    private double balance;

    private int installment;

    private int age;

    private float height;

    private float weight;

    private String plan;

    private String picture;

    private String slot;

    private String trainer_name;
}

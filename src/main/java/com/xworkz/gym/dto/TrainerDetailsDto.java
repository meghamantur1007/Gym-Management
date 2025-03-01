package com.xworkz.gym.dto;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class TrainerDetailsDto {
    private String trainerName;
    private long phoneNumber;
    private String slot;
}

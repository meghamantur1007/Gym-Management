package com.xworkz.gym.dto;


import com.xworkz.gym.entity.EnquiryEntity;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class EnquiryDto {
    private String name;
    private String area;
    private long phoneNumber;
    private String distance;
    private int age;
    private String status;
    private String description;


}

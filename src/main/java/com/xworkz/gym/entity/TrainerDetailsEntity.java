package com.xworkz.gym.entity;

import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;

@Entity
@Data
@NoArgsConstructor
@Table(name="trainer_details")
@NamedQuery(name="getTrainerDetails",query="select t from TrainerDetailsEntity t")
@NamedQuery(name="removeTrainerByTrainerName",query = "delete  from TrainerDetailsEntity t where t.trainerName = :trainerNameBy")

public class TrainerDetailsEntity {
    @Id
    @GeneratedValue (strategy = GenerationType.IDENTITY)
    private int id;
    @Column(name="trainer_name")
    private String trainerName;
    @Column(name="phone_number")
    private long phoneNumber;
    private String slot;
}

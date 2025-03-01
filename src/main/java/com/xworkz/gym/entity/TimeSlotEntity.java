package com.xworkz.gym.entity;

import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;

@Entity
@NoArgsConstructor
@Data
@Table(name="time_slots")
@NamedQuery(name = "getAllTimeSlots", query = "SELECT t FROM TimeSlotEntity t")


public class TimeSlotEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    @Column(name="start_time")
    private String startTime;
    @Column(name="end_time")
    private String endTime;
    @Column(name="duration")
    private String duration;
}

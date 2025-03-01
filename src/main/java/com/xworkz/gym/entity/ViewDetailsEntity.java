package com.xworkz.gym.entity;

import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.time.LocalDateTime;

@Entity
@Table(name="view_details")
@Data
@NoArgsConstructor
@NamedQuery(name="getAllData",query = "select v from ViewDetailsEntity v where enquiryId = :enquiryIdBy")
public class ViewDetailsEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    @Column(name="enquiry_id")
    private int enquiryId;
    private String name;
    @Column(name="phone_number")
    private long phoneNumber;
    private String remarks;
    @Column(name="updated_on")
    private LocalDateTime updatedOn;
}

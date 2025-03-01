package com.xworkz.gym.entity;

import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;

@Entity
@Table(name="enquiry_and_follow")
@Data
@NoArgsConstructor
@NamedQuery(name="getAllEntries",query = "select en from EnquiryEntity en")
@NamedQuery(
        name = "updateStatusAndDescription",
        query = "UPDATE EnquiryEntity e SET e.status = :statusBy, e.description = :descriptionBy WHERE e.id = :idBy"
)
public class EnquiryEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    private String name;
    private String area;
    @Column(name="phone_number")
    private long phoneNumber;
    private String distance;
    private int age;
    private String status;
    private String description;


}

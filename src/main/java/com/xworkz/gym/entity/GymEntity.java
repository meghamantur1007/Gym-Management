package com.xworkz.gym.entity;

import lombok.Data;

import javax.persistence.*;

@Entity
@Data
@Table(name = "login_table")
@NamedQuery(name = "selectAllByLogInId", query = "SELECT ge FROM GymEntity ge WHERE ge.logInId = :logInIdBy")
public class GymEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    @Column(name = "logIn_id")
    private String logInId;
    private String name;
    private String password;
}

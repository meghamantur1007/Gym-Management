package com.xworkz.gym.entity;

import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.time.LocalDateTime;

@Entity
@NoArgsConstructor
@Data
@Table(name="registration_update")
@NamedQuery(name="selectRegisteredNames",query = "SELECT r.name FROM RegistrationEntity r")
@NamedQuery(name="countByEmail", query = "select count(re) from RegistrationEntity re where re.email = :setEmail")
@NamedQuery(name = "getUserByEmail", query = "SELECT u FROM RegistrationEntity u WHERE u.email = :emailBy")
@NamedQuery(name="updatePassword",query = "update RegistrationEntity r set r.password = :setNewPassword, r.logInCount = :setLogInCount where r.email = :emailBy")
@NamedQuery(name="updateLoginCountByEmail",query = "update RegistrationEntity r set r.logInCount =:loginCountBy where r.email= :emailBy")
@NamedQuery(name="resetLogInCountByEmail",query = "update RegistrationEntity r set r.logInCount = :loginCountBy where r.email= :emailBy ")
@NamedQuery(name="accountLockedTimeByEmail",query = "update RegistrationEntity r set r.accountLockedTime = :accountLockedTimeBy where r.email = :emailBy" )
@NamedQuery(name = "resetPasswordByEmail", query = "update RegistrationEntity r set r.password = :setNewPassword where r.email = :emailBy")
@NamedQuery(name = "updateDataByEmail", query = "UPDATE RegistrationEntity r SET r.age = :setAge, r.height = :setHeight, r.weight = :setWeight, r.plan = :setPlan, r.filePath = :setFilePath WHERE r.email = :emailBy")
@NamedQuery(name="getAllByEmail", query="SELECT r FROM RegistrationEntity r WHERE r.email = :emailBy")
@NamedQuery(name = "updateSlotAndTrainerByEmail", query = "UPDATE RegistrationEntity r SET r.slot = :slot, r.trainerName = :trainerName WHERE r.email = :emailBy")
@NamedQuery(name="getSlotAndTrainerNameByEmail",query = "select r.slot, r.trainerName from RegistrationEntity r where r.email = :emailBy")
@NamedQuery(name="getTraineesByTrainerName",query = "select r.name, r.email from RegistrationEntity r where r.trainerName = :trainerNameBy")
@NamedQuery(name="updateClientDAWbyName",query = "update RegistrationEntity r set r.exercise = :exercise, r.dietPlan = :dietPlan where r.name = :name")
public class RegistrationEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    private String name;
    private String email;
    private String password;
    private String packages;
    private String trainer;
    @Column(name="phone_number")
    private long phoneNumber;
    private double amount;
    private double discount;
    @Column(name="paid_amount")
    private double paidAmount;
    private double balance;
    @Column(name="gym_name")
    private String gymName;
    private int installment;
    @Column(name="logIn_count")
    private int logInCount;
    @Column(name="account_locked_time")
    private LocalDateTime accountLockedTime;
    private int age;
    private float weight;
    private float height;
    private String plan;
    @Column(name="file_path")
    private String filePath;
    private String slot;
    @Column(name="trainer_name")
    private String trainerName;
    private String exercise;
    @Column(name="diet_plan")
    private String dietPlan;
}

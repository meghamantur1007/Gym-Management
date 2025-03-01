package com.xworkz.gym.entity;

import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;

@Entity
@NoArgsConstructor
@Data
@Table(name="update_amount_table")
@NamedQuery(name="findAllByEmail",query = "select u from UpdateRegistrationEntity u where u.email = :emailBy")
@NamedQuery(
        name = "updateValuesById",
        query = "update UpdateRegistrationEntity u " +
                "set u.packages = :setPackage, " +
                "u.trainer = :setTrainer, " +
                "u.amount = :setAmount, "+
                "u.paidAmount = :setPaidAmount, " +
                "u.balance = :setBalance, " +
                "u.installment = :setInstallment " +
                "where u.id = :idBy"
)
public class UpdateRegistrationEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    private String name;
    private String email;
    private String packages;
    private String trainer;
    private double amount;
    @Column(name="paid_amount")
    private double paidAmount;
    private double balance;
    private int installment;
}

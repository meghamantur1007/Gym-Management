package com.xworkz.gym.service;

import com.xworkz.gym.dto.*;
import com.xworkz.gym.entity.*;

import javax.validation.ConstraintViolation;
import java.security.NoSuchAlgorithmException;
import java.util.List;
import java.util.Set;

public interface GymService {
    boolean getAll(AdminLogInDto dto) throws NoSuchAlgorithmException;

    boolean saveEnquiry(EnquiryDto enquiryDto);

    Set<ConstraintViolation<RegistrationDto>> saveRegistration(RegistrationDto registrationDto);

    String generatePassword();

    boolean saveEmail(String email, String password);

    List<EnquiryEntity> getAllEnquiries();

    void updateStatusAndDescription(int id,String status, String description);

    Long getCountOfEmail(String email);

    UpdateRegistrationEntity getDetailsByEmail(String email);

    boolean updateDetailsById(String packages, String trainer, double amount, double paidAmount, double balance, int installment, int id);

    boolean saveViewDetails(int id, String name, long phoneNumber, String description);

    List<ViewDetailsEntity> getAllData(int id);

    RegistrationEntity getData(String email,String password);

    boolean updatePassword(String oldPassword,String newPassword,String confirmPassword,String email);

    String resetPasswordByEmail(String email, String newPassword, String confirmPassword);

    void resetLoginCount(String email,String password);

    boolean userProfile(int age, float height, float weight, String plan, String email, String picture);

    RegistrationEntity getRegistrationEntity(String email);

    boolean saveTimeSlots(TimeSlotDto timeSlotDto);

    List<TimeSlotEntity> getAllTimeSlots();

    boolean saveTrainerDetails(TrainerDetailsDto trainerDetailsDto);

    List<TrainerDetailsEntity> getTrainerDetails();

    boolean updateSlotAndTrainerName(String email,String slot,String trainerName);

    Object[] getSlotAndTrainerName(String email);

    List<Object[]> getTraineesByTrainerName(String trainerName);

    boolean removeTrainer(String trainerName);

    boolean updateDAWForClients(String clientName, String dietPlan, String workoutPlan);
}

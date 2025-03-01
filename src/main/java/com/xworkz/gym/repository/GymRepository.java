package com.xworkz.gym.repository;

import com.xworkz.gym.entity.*;

import java.util.List;

public interface GymRepository {

    GymEntity getAll(String logInId);

    boolean saveEnquiry(EnquiryEntity enquiryEntity);

    boolean saveRegistration(RegistrationEntity registrationEntity);

    List<EnquiryEntity> getAllEnquiries();

    void updateStatusAndDescription(int id, String status, String description);

    boolean saveUpdateRegistration(UpdateRegistrationEntity updateRegistrationEntity);

    Long getCountOfEmail(String email);

    UpdateRegistrationEntity findByEmail(String email);

    boolean updateValuesById(String packages, String trainer, double amount,double paidAmount, double balance, int installment,int id);

    boolean saveViewDetails(ViewDetailsEntity viewDetailsEntity);

    List<ViewDetailsEntity> getAllData(int id);

    RegistrationEntity getData(String email);

    boolean updatePassword(String hashedPassword,String email);

    void updateLoginCountByEmail(String email, int logInCount);

    boolean resetLoginCountByEmail(String email);

    String updateLockedAccountTimeByEmail(String email);

    String resetPasswordByEmail(String email, String hashedPassword);

    boolean updateUserProfile(int age,float weight,float height,String plan,String email,String picture);

    boolean saveTimeSlots(TimeSlotEntity timeSlotEntity);

    List<TimeSlotEntity> getTimeSlots();

    boolean saveTrainerDetails(TrainerDetailsEntity trainerDetailsEntity);

    List<TrainerDetailsEntity> getTrainerDetails();

    public boolean updateSlotAndTrainer(String email,String slot, String trainerName);

    Object[] getSlotAndTrainer(String email);

    List<Object[]> getTraineesByTrainerName(String trainerName);

    boolean removeTrainerByTrainerName(String trainerName);

    boolean updateDAWForClients(RegistrationEntity registrationEntity);
}

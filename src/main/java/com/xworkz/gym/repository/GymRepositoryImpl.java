package com.xworkz.gym.repository;

import com.xworkz.gym.entity.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Query;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@Repository
public class GymRepositoryImpl implements GymRepository {

    @Autowired
    EntityManagerFactory entityManagerFactory;

    @Override
    public GymEntity getAll(String logInId) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        EntityTransaction entityTransaction = entityManager.getTransaction();

        GymEntity entity = null;
        try {
            entityTransaction.begin();
            entity = (GymEntity) entityManager.createNamedQuery("selectAllByLogInId").setParameter("logInIdBy", logInId).getSingleResult();
            entityTransaction.commit();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            entityManager.close();
        }
        if (entity != null) {
            return entity;
        }
        return null;
    }

    @Override
    public boolean saveEnquiry(EnquiryEntity enquiryEntity) {
        System.out.println("data in repoImpl==" + enquiryEntity);
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        EntityTransaction entityTransaction = entityManager.getTransaction();

        try {
            entityTransaction.begin();
            entityManager.persist(enquiryEntity);
            System.out.println("saved");
            entityTransaction.commit();
        } catch (Exception e) {
            if (entityTransaction.isActive()) {
                entityTransaction.rollback();
            }
        } finally {
            entityManager.close();

        }
        return true;
    }


    @Override
    public boolean saveRegistration(RegistrationEntity registrationEntity) {
        System.out.println("Data in repoImpl == " + registrationEntity);

        // Initialize entity manager and transaction
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        EntityTransaction entityTransaction = entityManager.getTransaction();

        try {
            // Start transaction
            entityTransaction.begin();

            // Persist the registration entity
            entityManager.persist(registrationEntity);
            System.out.println("Persisted entity: " + registrationEntity);

            // Commit the transaction
            entityTransaction.commit();
            System.out.println("Transaction committed successfully.");
            return true; // Return true if successful
        } catch (Exception e) {
            if (entityTransaction.isActive()) {
                // Rollback the transaction in case of error
                entityTransaction.rollback();
            }
            e.printStackTrace();
            System.err.println("Error saving registration entity: " + e.getMessage());
            return false; // Return false if an error occurred
        } finally {
            // Close the entity manager
            entityManager.close();
        }
    }


    @Override
    public List<EnquiryEntity> getAllEnquiries() {
        EntityManager em = entityManagerFactory.createEntityManager();
        EntityTransaction et = em.getTransaction();
        List<EnquiryEntity> list = null;

        try {
            et.begin();

            list = em.createNamedQuery("getAllEntries").getResultList();

            et.commit();
        } catch (Exception e) {
            if (et.isActive()) {
                et.rollback();
            }

        } finally {
            em.close();
        }
        if (list != null)
            return list;
        else {
            return null;
        }
    }
    @Override
    public void updateStatusAndDescription(int id, String status, String description) {
        EntityManager em = entityManagerFactory.createEntityManager();
        EntityTransaction et = em.getTransaction();

        try {
            et.begin();
            int updatedRows = em.createNamedQuery("updateStatusAndDescription")
                    .setParameter("statusBy", status)
                    .setParameter("descriptionBy", description)
                    .setParameter("idBy", id)
                    .executeUpdate();
            et.commit();

            if (updatedRows == 0) {
                System.out.println("No records updated. Check if the ID exists.");
            } else {
                System.out.println("Updated successfully!");
            }

        } catch (Exception e) {
            if (et.isActive()) {
                et.rollback();
            }
            e.printStackTrace(); // Log the exception for debugging
        } finally {
            em.close();
        }
    }

    @Override
    public boolean saveUpdateRegistration(UpdateRegistrationEntity updateRegistrationEntity) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        EntityTransaction entityTransaction = entityManager.getTransaction();

        try {
            entityTransaction.begin();
            entityManager.persist(updateRegistrationEntity);
            entityTransaction.commit();
        } catch (Exception e) {
            if (entityTransaction.isActive()) {
                entityTransaction.rollback();
            }
            e.printStackTrace();
        } finally {
            entityManager.close();
        }
        return true;
    }


    @Override
    public Long getCountOfEmail(String email) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        EntityTransaction entityTransaction = entityManager.getTransaction();

        Long count = (Long) entityManager.createNamedQuery("countByEmail").setParameter("setEmail", email).getSingleResult();
        try {
            entityTransaction.begin();
            entityTransaction.commit();

        } catch (Exception e) {
            if (entityTransaction.isActive()) {
                entityTransaction.rollback();
            }

        } finally {
            entityManager.close();
        }
        return count;
    }

    @Override
    public UpdateRegistrationEntity findByEmail(String email) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        UpdateRegistrationEntity details = null;
        try {
            details = (UpdateRegistrationEntity) entityManager.createNamedQuery("findAllByEmail").setParameter("emailBy", email).getSingleResult();
            System.out.println("data is coming in repo===" + details);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            entityManager.close();
        }
        return details;
    }

    @Override
    public boolean updateValuesById(String packages, String trainer, double amount, double paidAmount, double balance, int installment, int id) {
        EntityManager em = entityManagerFactory.createEntityManager();
        EntityTransaction et = em.getTransaction();

        try {
            et.begin();
            int value = em.createNamedQuery("updateValuesById")
                    .setParameter("setPackage", packages)
                    .setParameter("setTrainer", trainer)
                    .setParameter("setAmount", amount)
                    .setParameter("setPaidAmount", paidAmount)
                    .setParameter("setBalance", balance)
                    .setParameter("setInstallment", installment)
                    .setParameter("idBy", id)
                    .executeUpdate();
            et.commit();

            if (value > 0) {
                return true;
            } else {
                return false;
            }
        } catch (Exception e) {
            if (et.isActive()) {
                et.rollback();
            }
            e.printStackTrace();
            return false;
        } finally {
            em.close();
        }
    }

    @Override
    public boolean saveViewDetails(ViewDetailsEntity viewDetailsEntity) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        EntityTransaction entityTransaction = entityManager.getTransaction();

        try {
            entityTransaction.begin();
            entityManager.persist(viewDetailsEntity);
            entityTransaction.commit();
        } catch (Exception e) {
            if (entityTransaction.isActive()) {
                entityTransaction.rollback();
            }
            e.printStackTrace();
        } finally {
            entityManager.close();
        }
        return true;
    }

    @Override
    public List<ViewDetailsEntity> getAllData(int id) {
        EntityManager em = entityManagerFactory.createEntityManager();
        EntityTransaction et = em.getTransaction();
        List<ViewDetailsEntity> list = null;

        try {
            et.begin();

            list = em.createNamedQuery("getAllData").setParameter("enquiryIdBy", id).getResultList();
            System.out.println("viewDetails in repo======" + list.toString());
            et.commit();
        } catch (Exception e) {
            if (et.isActive()) {
                et.rollback();
            }

        } finally {
            em.close();
        }
        if (list != null)
            return list;
        else {
            return null;
        }
    }

    @Override
    public RegistrationEntity getData(String email) {
        EntityManager em = entityManagerFactory.createEntityManager();
        EntityTransaction et = em.getTransaction();
        RegistrationEntity entity = null;

        try {
            et.begin();
            entity = (RegistrationEntity) em.createNamedQuery("getAllByEmail").setParameter("emailBy", email).getSingleResult();
            System.out.println("entity in repo==" + entity.toString());
            et.commit();
        } catch (Exception e) {
            e.printStackTrace();
            if (et.isActive()) {
                et.rollback();
            }
        } finally {
            em.close();
        }

        return entity;
    }

    @Override
    public boolean updatePassword(String hashedPassword, String email) {
        EntityManager em = entityManagerFactory.createEntityManager();
        EntityTransaction et = em.getTransaction();

        try {
            et.begin();
            int value = em.createNamedQuery("updatePassword")
                    .setParameter("setNewPassword", hashedPassword)
                    .setParameter("setLogInCount", 0)
                    .setParameter("emailBy", email)
                    .executeUpdate();
            et.commit();

            if (value > 0) {
                return true;
            } else {
                return false;
            }
        } catch (Exception e) {
            if (et.isActive()) {
                et.rollback();
            }
            e.printStackTrace();
            return false;
        } finally {
            em.close();
        }
    }

    @Override
    public void updateLoginCountByEmail(String email, int logInCount) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        EntityTransaction entityTransaction = entityManager.getTransaction();

        // log.info("entering=================");

        int count = logInCount + 1;
        try {
            entityTransaction.begin();

            Query query = entityManager.createNamedQuery("updateLoginCountByEmail");
            query.setParameter("loginCountBy", count);
            query.setParameter("emailBy", email);

            int value = query.executeUpdate();

            entityTransaction.commit();

        } catch (Exception e) {
            if (entityTransaction.isActive()) {
                entityTransaction.rollback();
            }

        } finally {
            entityManager.close();

        }
    }

    @Override
    public boolean resetLoginCountByEmail(String email) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        EntityTransaction entityTransaction = entityManager.getTransaction();
        try {
            entityTransaction.begin();

            Query query = entityManager.createNamedQuery("resetLogInCountByEmail");
            query.setParameter("loginCountBy", 0);
            query.setParameter("emailBy", email);

            int value = query.executeUpdate();

            entityTransaction.commit();

        } catch (Exception e) {
            if (entityTransaction.isActive()) {
                entityTransaction.rollback();
            }

        } finally {
            entityManager.close();

        }
        return false;
    }

    @Override
    public String updateLockedAccountTimeByEmail(String email) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        EntityTransaction entityTransaction = entityManager.getTransaction();

        try {
            entityTransaction.begin();

            Query query = entityManager.createNamedQuery("accountLockedTimeByEmail");
            query.setParameter("accountLockedTimeBy", LocalDateTime.now());
            query.setParameter("emailBy", email);

            int value = query.executeUpdate();
            entityTransaction.commit();

            if (value > 0) {
                System.out.println("Account lock time is set to current time.");
            } else {
                System.out.println("Failed to set account lock time.");
            }
        } catch (Exception e) {
            if (entityTransaction.isActive()) {
                entityTransaction.rollback();
            }
        } finally {
            entityManager.close();
        }

        return "Account lock time is set.";
    }

    @Override
    public String resetPasswordByEmail(String email, String hashedPassword) {
        System.out.println("Entering repository resetPasswordByEmail");
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        EntityTransaction entityTransaction = entityManager.getTransaction();

        try {
            entityTransaction.begin();

            Query query = entityManager.createNamedQuery("resetPasswordByEmail");
            query.setParameter("setNewPassword", hashedPassword);
            query.setParameter("emailBy", email);

            int value = query.executeUpdate();
            entityTransaction.commit();

            System.out.println("Rows affected: " + value);

            if (value > 0) {
                return "password updated successfully";
            } else {
                return "Password Updated";
            }
        } catch (Exception e) {
            if (entityTransaction.isActive()) {
                entityTransaction.rollback();
            }

        } finally {
            entityManager.close();
        }
        return "password updated successfully";
    }

    @Override
    public boolean updateUserProfile(int age, float weight, float height, String plan, String email, String filePath) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        EntityTransaction entityTransaction = entityManager.getTransaction();

        try {
            entityTransaction.begin();
            int value = entityManager.createNamedQuery("updateDataByEmail")
                    .setParameter("setAge", age)
                    .setParameter("setHeight", height)
                    .setParameter("setWeight", weight)
                    .setParameter("setPlan", plan)
                    .setParameter("emailBy", email)
                    .setParameter("setFilePath", filePath)
                    .executeUpdate();
            entityTransaction.commit();

            if (value > 0) {
                System.out.println("Values are updated in RegistrationEntity");
            } else {
                System.out.println("No values updated in RegistrationEntity. Check the email.");
            }

        } catch (Exception e) {
            if (entityTransaction.isActive()) {
                entityTransaction.rollback();
            }
            e.printStackTrace();
        } finally {
            entityManager.close();
        }

        return true;
    }

    @Override
    public boolean saveTimeSlots(TimeSlotEntity timeSlotEntity) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        EntityTransaction entityTransaction = entityManager.getTransaction();

        try {
            entityTransaction.begin();
            entityManager.persist(timeSlotEntity);
            System.out.println("saved");
            entityTransaction.commit();
        } catch (Exception e) {
            if (entityTransaction.isActive()) {
                entityTransaction.rollback();
            }
        } finally {
            entityManager.close();

        }
        return true;
    }

    @Override
    public List<TimeSlotEntity> getTimeSlots() {
        EntityManager em = entityManagerFactory.createEntityManager();
        List<TimeSlotEntity> list = new ArrayList<>();

        try {
            list = em.createNamedQuery("getAllTimeSlots", TimeSlotEntity.class).getResultList();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            em.close();
        }

        return list;
    }

    @Override
    public boolean saveTrainerDetails(TrainerDetailsEntity trainerDetailsEntity) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        EntityTransaction entityTransaction = entityManager.getTransaction();

        try {
            entityTransaction.begin();
            entityManager.persist(trainerDetailsEntity);
            entityTransaction.commit();
        } catch (Exception e) {
            if (entityTransaction.isActive()) {
                entityTransaction.rollback();
            }
        } finally {
            entityManager.close();

        }
        return true;
    }

    @Override
    public List<TrainerDetailsEntity> getTrainerDetails() {
        EntityManager em = entityManagerFactory.createEntityManager();
        List<TrainerDetailsEntity> list = new ArrayList<>();

        try {
            list = em.createNamedQuery("getTrainerDetails").getResultList();
            System.out.println("trainerDeayils in repo====" + list);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            em.close();
        }
        return list;
    }

    @Override
    public boolean updateSlotAndTrainer(String email, String slot, String trainerName) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        EntityTransaction entityTransaction = entityManager.getTransaction();

        try {
            entityTransaction.begin();
            int value = entityManager.createNamedQuery("updateSlotAndTrainerByEmail")
                    .setParameter("slot", slot)  // Ensure it matches @NamedQuery
                    .setParameter("trainerName", trainerName)
                    .setParameter("emailBy", email)
                    .executeUpdate();
            entityTransaction.commit();

            if (value > 0) {
                System.out.println("Values are updated in RegistrationEntity");
            } else {
                System.out.println("No values updated in RegistrationEntity. Check the email.");
            }

        } catch (Exception e) {
            if (entityTransaction.isActive()) {
                entityTransaction.rollback();
            }
            e.printStackTrace();
        } finally {
            entityManager.close();
        }

        return true;
    }

    @Override
    public Object[] getSlotAndTrainer(String email) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        EntityTransaction entityTransaction = entityManager.getTransaction();
        Object[] slotAndTrainerName = null;

        try {
            entityTransaction.begin();
            slotAndTrainerName = (Object[]) entityManager
                    .createNamedQuery("getSlotAndTrainerNameByEmail")
                    .setParameter("emailBy", email)
                    .getSingleResult();
            System.out.println("slotAndTrainerName: " + slotAndTrainerName[0] + ", " + slotAndTrainerName[1]);
            entityTransaction.commit();
        } catch (Exception e) {
            if (entityTransaction.isActive()) {
                entityTransaction.rollback();
            }
            e.printStackTrace();
        } finally {
            entityManager.close();
        }
        return slotAndTrainerName;
    }
    @Override
    public List<Object[]> getTraineesByTrainerName(String trainerName) {
        EntityManager em = entityManagerFactory.createEntityManager();
        List<Object[]> trainees = new ArrayList<>();

        try {
            trainees = em.createNamedQuery("getTraineesByTrainerName", Object[].class)
                    .setParameter("trainerNameBy", trainerName)
                    .getResultList();

            System.out.println("Trainee Details: " + trainees);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            em.close();
        }
        return trainees;
    }

    @Override
    public boolean removeTrainerByTrainerName(String trainerName) {
        EntityManager em = entityManagerFactory.createEntityManager();
        EntityTransaction et=em.getTransaction();
        try {
            et.begin();
            int value = em.createNamedQuery("removeTrainerByTrainerName").setParameter("trainerNameBy", trainerName).executeUpdate();
            et.commit();
            if (value > 0) {
                return true;
            } else {
                return false;
            }
        }
        catch (Exception e){
            e.printStackTrace();
        }
        finally {
            em.close();
        }
        return true;
        }


    @Override
    public boolean updateDAWForClients(RegistrationEntity registrationEntity) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        EntityTransaction transaction = entityManager.getTransaction();
        try {
            transaction.begin();
            Query query = entityManager.createNamedQuery("updateClientDAWbyName");
            query.setParameter("name", registrationEntity.getName());
            query.setParameter("dietPlan", registrationEntity.getDietPlan());
            query.setParameter("exercise",registrationEntity.getExercise());

            int updatedRows = query.executeUpdate();
            transaction.commit();
            return updatedRows > 0;
        } catch (Exception e) {
            if (transaction.isActive()) {
                transaction.rollback();
            }
            e.printStackTrace();
            return false;
        } finally {
            entityManager.close();
        }
    }
}









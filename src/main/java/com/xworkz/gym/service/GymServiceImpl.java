package com.xworkz.gym.service;

import com.xworkz.gym.constant.StatusEnum;
import com.xworkz.gym.dto.*;
import com.xworkz.gym.entity.*;
import com.xworkz.gym.repository.GymRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.validation.ConstraintViolation;
import javax.validation.Validation;
import javax.validation.Validator;
import javax.validation.ValidatorFactory;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.time.Duration;
import java.time.LocalDateTime;
import java.util.*;

@Service
public class GymServiceImpl implements GymService {

    @Autowired
    GymRepository gymRepository;

    @Autowired
    PasswordEncoder encoder;

    @Override
    public boolean getAll(AdminLogInDto dto) throws NoSuchAlgorithmException {
        GymEntity gymEntity = gymRepository.getAll(dto.getLogInId());
        if (gymEntity != null) {
            MessageDigest messageDigest = MessageDigest.getInstance("SHA-256");
            byte[] hashedBytes = messageDigest.digest(dto.getPassword().getBytes());
            String encodedHash = Base64.getEncoder().encodeToString(hashedBytes);

            return encodedHash.equals(gymEntity.getPassword());
        }
        return false;
    }


    @Override
    public boolean saveEnquiry(EnquiryDto enquiryDto) {

        EnquiryEntity enquiryEntity = new EnquiryEntity();
        enquiryEntity.setName(enquiryDto.getName());
        enquiryEntity.setArea(enquiryDto.getArea());
        enquiryEntity.setPhoneNumber(enquiryDto.getPhoneNumber());
        enquiryEntity.setDistance(enquiryDto.getDistance());
        enquiryEntity.setAge(enquiryDto.getAge());
        enquiryEntity.setStatus(String.valueOf(StatusEnum.Enquired));

        return gymRepository.saveEnquiry(enquiryEntity);

    }

    @Override
    public Set<ConstraintViolation<RegistrationDto>> saveRegistration(RegistrationDto registrationDto) {
        System.out.println("Registration in service===== " + registrationDto);

        String password = generatePassword();
        String filePath = registrationDto.getPicture();

        // Convert DTO to entity
        RegistrationEntity registrationEntity = new RegistrationEntity();
        registrationEntity.setName(registrationDto.getName());
        registrationEntity.setEmail(registrationDto.getEmail());
        registrationEntity.setPassword(password);
        registrationEntity.setPhoneNumber(registrationDto.getPhoneNumber());
        registrationEntity.setPackages(registrationDto.getPackages());
        registrationEntity.setTrainer(registrationDto.getTrainer());
        registrationEntity.setGymName(registrationDto.getGymName());
        registrationEntity.setAmount(registrationDto.getAmount());
        registrationEntity.setDiscount(registrationDto.getDiscount());
        registrationEntity.setBalance(registrationDto.getBalance());
        registrationEntity.setInstallment(registrationDto.getInstallment());
        registrationEntity.setPaidAmount(registrationDto.getPaidAmount());
        registrationEntity.setLogInCount(-1);
        registrationEntity.setFilePath(filePath);

        // Validate DTO
        ValidatorFactory vf = Validation.buildDefaultValidatorFactory();
        Validator validator = vf.getValidator();
        Set<ConstraintViolation<RegistrationDto>> violations = validator.validate(registrationDto);
        if (violations.isEmpty()) {
            // Attempt to save the registration entity
            boolean saved = gymRepository.saveRegistration(registrationEntity);
            System.out.println("Saved status: " + saved); // Check if the save is successful

            if (saved) {
                // Prepare update entity if registration is saved
                UpdateRegistrationEntity updateRegistrationEntity = new UpdateRegistrationEntity();
                updateRegistrationEntity.setName(registrationDto.getName());
                updateRegistrationEntity.setEmail(registrationDto.getEmail());
                updateRegistrationEntity.setPackages(registrationDto.getPackages());
                updateRegistrationEntity.setTrainer(registrationDto.getTrainer());
                updateRegistrationEntity.setAmount(registrationDto.getAmount());
                updateRegistrationEntity.setPaidAmount(registrationDto.getPaidAmount());
                updateRegistrationEntity.setBalance(registrationDto.getBalance());
                updateRegistrationEntity.setInstallment(registrationDto.getInstallment());

                // Save the update entity
                boolean updateSaved = gymRepository.saveUpdateRegistration(updateRegistrationEntity);
                System.out.println("Update saved status: " + updateSaved);

                // Save email if both registration and update are successful
                if (updateSaved) {
                    saveEmail(registrationDto.getEmail(), password);
                }
            }
        } else {
            System.out.println("Validation failed: " + violations);
        }

        return violations; // Return validation violations to the caller if any
    }


    @Override
    public String generatePassword() {
        int passwordLength = 6;
        Random random = new Random();
        int firstDigit = 1 + random.nextInt(9);
        StringBuilder password = new StringBuilder(String.valueOf(firstDigit));
        for (int i = 1; i < passwordLength; i++) {
            password.append(random.nextInt(10));
        }
        System.out.println("password======================" + password);
        return password.toString();
    }

    @Override
    public boolean saveEmail(String email, String password) {


        final String username = "meghamantur831@gmail.com";
        final String userPassword = "dzqz wlws umfa enac";

        Properties prop = new Properties();
        prop.put("mail.smtp.host", "smtp.gmail.com");
        prop.put("mail.smtp.port", "587");
        prop.put("mail.smtp.auth", "true");
        prop.put("mail.smtp.starttls.enable", "true");
        prop.put("mail.smtp.ssl.trust", "smtp.gmail.com");

        Session session = Session.getInstance(prop,
                new javax.mail.Authenticator() {
                    protected PasswordAuthentication getPasswordAuthentication() {
                        return new PasswordAuthentication(username, userPassword);
                    }
                });

        try {

            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(username));
            message.setRecipients(
                    Message.RecipientType.TO,
                    InternetAddress.parse(email)
            );
            message.setSubject("Your password");
            message.setText("your passwordd" + password);

            Transport.send(message);

            System.out.println("Done");

        } catch (MessagingException e) {
            e.printStackTrace();
        }

        return true;
    }

    @Override
    public List<EnquiryEntity> getAllEnquiries() {
        return gymRepository.getAllEnquiries();
    }

    @Override
    public void updateStatusAndDescription(int id, String status, String description) {
        System.out.println("-----descri===="+description);
        gymRepository.updateStatusAndDescription(id, status, description);
    }


    @Override
    public Long getCountOfEmail(String email) {
        return gymRepository.getCountOfEmail(email);
    }

    @Override
    public UpdateRegistrationEntity getDetailsByEmail(String email) {
        return gymRepository.findByEmail(email);

    }

    @Override
    public boolean updateDetailsById(String packages, String trainer, double amount, double paidAmount, double balance, int installment, int id) {
        gymRepository.updateValuesById(packages, trainer, amount, paidAmount, balance, installment, id);
        return true;
    }

    @Override
    public boolean saveViewDetails(int id, String name, long phoneNumber, String description) {
        ViewDetailsEntity viewDetailsEntity = new ViewDetailsEntity();
        viewDetailsEntity.setEnquiryId(id);
        viewDetailsEntity.setName(name);
        viewDetailsEntity.setPhoneNumber(phoneNumber);
        viewDetailsEntity.setRemarks(description);
        viewDetailsEntity.setUpdatedOn(LocalDateTime.now());

        boolean value = gymRepository.saveViewDetails(viewDetailsEntity);
        if (value) {
            return true;
        } else {
            return false;
        }
    }

    @Override
    public List<ViewDetailsEntity> getAllData(int id) {
        return gymRepository.getAllData(id);
    }

    @Override
    public RegistrationEntity getData(String email, String password) {
        RegistrationEntity entity = gymRepository.getData(email);

        if (entity == null) {
            System.out.println("No user found for email: " + email);
            return null;
        }

        System.out.println("logincount==========" + entity.getLogInCount());

        if (password.equals(entity.getPassword()) && entity.getLogInCount() == -1) {
            return entity;
        }

        if (!(password.equals(entity.getPassword())) && (entity.getLogInCount() >= 0 && entity.getLogInCount() < 3)) {
            gymRepository.updateLoginCountByEmail(email, entity.getLogInCount());
            return entity;
        }

        if (entity.getLogInCount() == 3) {
            System.out.println("Account is locked.");

            if (entity.getAccountLockedTime() == null) {
                gymRepository.updateLockedAccountTimeByEmail(email);
            }

            LocalDateTime currentTime = LocalDateTime.now();
            LocalDateTime accountLockedTime = entity.getAccountLockedTime();
            System.out.println("Account locked time: " + accountLockedTime);

            if (accountLockedTime != null) {
                long lockedTime = Duration.between(accountLockedTime, currentTime).toMinutes();
                System.out.println("Locked time in minutes: " + lockedTime);

                if (lockedTime > 2) {
                    System.out.println("You can log in now.");
                    gymRepository.resetLoginCountByEmail(email);
                    return entity;
                } else {
                    System.out.println("Account is still locked. Try after some time.");
                }
            }
            return null;
        }

        if (entity.getPassword().equals(password)) {
            int logInCount = entity.getLogInCount();
            if (logInCount == -1) {
                return entity;
            }
            if (logInCount < 3) {
                System.out.println("Login successful. Resetting login count.");
                gymRepository.resetLoginCountByEmail(entity.getEmail());
                return entity;
            }
        }

        return null;
    }

    @Override
    public boolean updatePassword(String oldPassword, String newPassword, String confirmPassword, String email) {
        if (newPassword.equals(confirmPassword)) {
            String hashedPassword = encoder.encode(newPassword);
            return gymRepository.updatePassword(hashedPassword, email);
        }
        return true;
    }

    @Override
    public String resetPasswordByEmail(String email, String newPassword, String confirmPassword) {
        System.out.println("reset password in service");
        if (newPassword.equals(confirmPassword)) {
            gymRepository.resetLoginCountByEmail(email);
            String hashedPassword = encoder.encode(newPassword);
            return gymRepository.resetPasswordByEmail(email, hashedPassword); // Pass dynamic parameters
        }
        return "password updated successfully";
    }

    @Override
    public void resetLoginCount(String email, String password) {

        gymRepository.resetLoginCountByEmail(email);
    }

    @Override
    public boolean userProfile(int age, float height, float weight, String plan, String email, String fileName) {

        boolean saved = gymRepository.updateUserProfile(age, weight, height, plan, email, fileName);
        return saved;
    }

    @Override
    public RegistrationEntity getRegistrationEntity(String email) {
        return gymRepository.getData(email);
    }

    @Override
    public boolean saveTimeSlots(TimeSlotDto timeSlotDto) {
        System.out.println("timeslot in service===" + timeSlotDto);

        TimeSlotEntity timeSlotEntity = new TimeSlotEntity();
        timeSlotEntity.setStartTime(String.valueOf(timeSlotDto.getStartTime()));
        timeSlotEntity.setEndTime(String.valueOf(timeSlotDto.getEndTime()));
        timeSlotEntity.setDuration(timeSlotDto.getDuration());

        boolean saved = gymRepository.saveTimeSlots(timeSlotEntity);
        return saved;
    }

    @Override
    public List<TimeSlotEntity> getAllTimeSlots() {
        List<TimeSlotEntity> slots = gymRepository.getTimeSlots();
        return slots;
    }

    @Override
    public boolean saveTrainerDetails(TrainerDetailsDto trainerDetailsDto) {
        TrainerDetailsEntity trainerDetailsEntity = new TrainerDetailsEntity();
        trainerDetailsEntity.setTrainerName(trainerDetailsDto.getTrainerName());
        trainerDetailsEntity.setPhoneNumber(trainerDetailsDto.getPhoneNumber());
        trainerDetailsEntity.setSlot(trainerDetailsDto.getSlot());

        boolean save = gymRepository.saveTrainerDetails(trainerDetailsEntity);
        if (save) {
            return true;
        }
        return false;
    }

    @Override
    public List<TrainerDetailsEntity> getTrainerDetails() {
        List<TrainerDetailsEntity> trainerDetails = gymRepository.getTrainerDetails();
        System.out.println("in service====" + trainerDetails);
        return trainerDetails;
    }

    @Override
    public boolean updateSlotAndTrainerName(String email, String slot, String trainerName) {
        return gymRepository.updateSlotAndTrainer(email, slot, trainerName);
    }

    @Override
    public Object[] getSlotAndTrainerName(String email) {
        return gymRepository.getSlotAndTrainer(email);

    }

    @Override
    public List<Object[]> getTraineesByTrainerName(String trainerName) {
        List<Object[]> trainees = gymRepository.getTraineesByTrainerName(trainerName);

        if (trainees.isEmpty()) {
            System.out.println("No trainees found for trainer: " + trainerName);
        } else {
            System.out.println("Trainee Details for " + trainerName + ": " + trainees);
        }

        return trainees;
    }

    @Override
    public boolean removeTrainer(String trainerName) {
        boolean deleted = gymRepository.removeTrainerByTrainerName(trainerName);

        if (deleted) {
            System.out.println("deleted in service");
            return true;

        }
        return false;
    }


    @Override
    public boolean updateDAWForClients(String clientName, String dietPlan, String workoutPlan){

        System.out.println(clientName);
        System.out.println(dietPlan);
        RegistrationEntity registrationEntity=new RegistrationEntity();
        if (clientName!=null) {
            registrationEntity.setName(clientName);
            if (dietPlan.equals("VEG_WEIGHT_GAIN")){
                registrationEntity.setDietPlan("Breakfast: Oats with whole milk, almonds, banana, peanut butter toast\\n\" +\n" +
                        "        \"Mid-Morning Snack: Greek yogurt with honey and nuts, dates\\n\" +\n" +
                        "        \"Lunch: Paneer curry, brown rice, mixed vegetable sabzi, dal, avocado salad\\n\" +\n" +
                        "        \"Afternoon Snack: Protein smoothie (banana, peanut butter, oats, milk, whey protein)\\n\" +\n" +
                        "        \"Dinner: Quinoa with chickpeas, sautéed vegetables, olive oil dressing\\n\" +\n" +
                        "        \"Post-Dinner: Cottage cheese (paneer), handful of nuts, dark chocolate");
                registrationEntity.setExercise("Day 1: Strength Training (Squats, Deadlifts, Bench Press, Shoulder Press)\\n\" +\n" +
                        "        \"Day 2: Cardio + Core (Cycling, Planks, Russian Twists, Hanging Leg Raises)\\n\" +\n" +
                        "        \"Day 3: Upper Body (Pull-ups, Dumbbell Rows, Bicep Curls, Tricep Dips)\\n\" +\n" +
                        "        \"Day 4: Rest or Active Recovery (Yoga, Stretching)\\n\" +\n" +
                        "        \"Day 5: Lower Body (Lunges, Leg Press, Calf Raises, Hamstring Curls)\\n\" +\n" +
                        "        \"Day 6: Full Body Workout (Burpees, Kettlebell Swings, Deadlifts, Squat Jumps)\\n\" +\n" +
                        "        \"Day 7: Rest");
            }
            if (dietPlan.equals("VEG_WEIGHT_LOSS")){
                registrationEntity.setDietPlan("Breakfast: Oats with chia seeds, flaxseeds, and almond milk\\n\" +\n" +
                        "        \"Mid-Morning Snack: Green smoothie (spinach, cucumber, chia seeds, lemon)\\n\" +\n" +
                        "        \"Lunch: Dal, quinoa, mixed vegetable stir-fry, cucumber salad\\n\" +\n" +
                        "        \"Afternoon Snack: Handful of almonds, green tea\\n\" +\n" +
                        "        \"Dinner: Grilled tofu or paneer, sautéed vegetables, lemon water\\n\" +\n" +
                        "        \"Post-Dinner: Greek yogurt with berries");
                registrationEntity.setExercise("Day 1: HIIT (Jump Squats, Mountain Climbers, Burpees, Plank Holds)\\n\" +\n" +
                        "        \"Day 2: Cardio (Running, Cycling, Jump Rope)\\n\" +\n" +
                        "        \"Day 3: Strength Training (Squats, Deadlifts, Dumbbell Press, Shoulder Press)\\n\" +\n" +
                        "        \"Day 4: Core & Flexibility (Yoga, Pilates, Ab Workouts)\\n\" +\n" +
                        "        \"Day 5: Full Body Circuit (Push-ups, Kettlebell Swings, Box Jumps, Sled Pushes)\\n\" +\n" +
                        "        \"Day 6: Cardio + Endurance (Rowing, Stair Climbing, Sprint Intervals)\\n\" +\n" +
                        "        \"Day 7: Rest or Active Recovery");
            }
            if (dietPlan.equals("NON_VEG_WEIGHT_GAIN")){
                registrationEntity.setDietPlan("Breakfast: Scrambled eggs with whole wheat toast, peanut butter, milk\\n\" +\n" +
                        "        \"Mid-Morning Snack: Boiled eggs, nuts (almonds, walnuts), Greek yogurt\\n\" +\n" +
                        "        \"Lunch: Grilled chicken breast, brown rice, mixed greens, olive oil dressing\\n\" +\n" +
                        "        \"Afternoon Snack: Protein shake (banana, oats, whey protein, peanut butter)\\n\" +\n" +
                        "        \"Dinner: Grilled salmon, mashed sweet potatoes, sautéed spinach\\n\" +\n" +
                        "        \"Post-Dinner: Cottage cheese or boiled eggs, handful of nuts");
                registrationEntity.setExercise("Day 1: Strength Training (Squats, Deadlifts, Bench Press, Shoulder Press)\\n\" +\n" +
                        "        \"Day 2: Cardio + Core (Cycling, Planks, Russian Twists, Hanging Leg Raises)\\n\" +\n" +
                        "        \"Day 3: Upper Body (Pull-ups, Dumbbell Rows, Bicep Curls, Tricep Dips)\\n\" +\n" +
                        "        \"Day 4: Rest or Active Recovery (Yoga, Stretching)\\n\" +\n" +
                        "        \"Day 5: Lower Body (Lunges, Leg Press, Calf Raises, Hamstring Curls)\\n\" +\n" +
                        "        \"Day 6: Full Body Workout (Burpees, Kettlebell Swings, Deadlifts, Squat Jumps)\\n\" +\n" +
                        "        \"Day 7: Rest");
            }
            if (dietPlan.equals("NON_VEG_WEIGHT_LOSS")){
                registrationEntity.setDietPlan("Breakfast: Boiled eggs with avocado toast, black coffee\\n\" +\n" +
                        "        \"Mid-Morning Snack: Green smoothie (spinach, ginger, chia seeds)\\n\" +\n" +
                        "        \"Lunch: Grilled chicken or fish, quinoa, steamed vegetables\\n\" +\n" +
                        "        \"Afternoon Snack: Handful of almonds, green tea\\n\" +\n" +
                        "        \"Dinner: Grilled fish or boiled eggs, sautéed vegetables, lemon water\\n\" +\n" +
                        "        \"Post-Dinner: Greek yogurt with nuts");
                registrationEntity.setExercise("Day 1: HIIT (Jump Squats, Mountain Climbers, Burpees, Plank Holds)\\n\" +\n" +
                        "        \"Day 2: Cardio (Running, Cycling, Jump Rope)\\n\" +\n" +
                        "        \"Day 3: Strength Training (Squats, Deadlifts, Dumbbell Press, Shoulder Press)\\n\" +\n" +
                        "        \"Day 4: Core & Flexibility (Yoga, Pilates, Ab Workouts)\\n\" +\n" +
                        "        \"Day 5: Full Body Circuit (Push-ups, Kettlebell Swings, Box Jumps, Sled Pushes)\\n\" +\n" +
                        "        \"Day 6: Cardio + Endurance (Rowing, Stair Climbing, Sprint Intervals)\\n\" +\n" +
                        "        \"Day 7: Rest or Active Recovery");

            }
            gymRepository.updateDAWForClients(registrationEntity);
            return true;
        }
        return false;
    }

}



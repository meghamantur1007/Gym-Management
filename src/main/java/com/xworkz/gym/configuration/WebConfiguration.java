package com.xworkz.gym.configuration;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.orm.jpa.LocalContainerEntityManagerFactoryBean;
import org.springframework.orm.jpa.vendor.HibernateJpaVendorAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.validation.Validator;
import org.springframework.validation.beanvalidation.LocalValidatorFactoryBean;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

import javax.sql.DataSource;

@Configuration
@ComponentScan("com.xworkz.gym")
public class WebConfiguration {

    private int sizeOfImg = 10*1024*1024;

    @Bean
    public LocalContainerEntityManagerFactoryBean localContainerEntityManagerFactoryBean() {
        LocalContainerEntityManagerFactoryBean bean = new LocalContainerEntityManagerFactoryBean();
        System.out.println("this is webConfiguration class");
        bean.setPackagesToScan("com.xworkz.gym.entity");
        bean.setDataSource(datasource());
        bean.setJpaVendorAdapter(new HibernateJpaVendorAdapter());
        return bean;
    }

    @Bean
    public DataSource datasource() {
        DriverManagerDataSource dataSource = new DriverManagerDataSource();
        dataSource.setDriverClassName("com.mysql.cj.jdbc.Driver");
        dataSource.setUsername("root");
        dataSource.setPassword("Megha@2002");
        dataSource.setUrl("jdbc:mysql://127.0.0.1:3306/gym_database");
        return dataSource;
    }

    @Bean
    public ViewResolver viewResolver() {
        InternalResourceViewResolver resolver = new InternalResourceViewResolver();
        resolver.setPrefix("/");
        resolver.setSuffix(".jsp");
        return resolver;
    }
    @Bean
    public PasswordEncoder encoder() {

        return new BCryptPasswordEncoder();
    }
    @Bean
    public Validator validator(){

        return new LocalValidatorFactoryBean();
    }

    @Bean(name = "multipartResolver")
    public CommonsMultipartResolver multipartResolver() {
        CommonsMultipartResolver commonsMultipartResolver = new CommonsMultipartResolver();
        commonsMultipartResolver.setMaxUploadSize(sizeOfImg);
        commonsMultipartResolver.setMaxInMemorySize(sizeOfImg);
        return commonsMultipartResolver;
    }


}

package com.xworkz.gym.configuration;

import org.springframework.web.servlet.config.annotation.DefaultServletHandlerConfigurer;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer;



public class WebInitializer extends AbstractAnnotationConfigDispatcherServletInitializer implements WebMvcConfigurer {

    @Override
    protected Class<?>[] getRootConfigClasses() {
        System.out.println("initializer");
        return new Class[0];
    }

    @Override
    protected Class<?>[] getServletConfigClasses() {

        return  new Class[]{WebConfiguration.class};
    }

    @Override
    protected String[] getServletMappings() {
        return new String[]{"/"};
    }


    @Override
    public void configureDefaultServletHandling(DefaultServletHandlerConfigurer configurer) {
        configurer.enable();
    }
}

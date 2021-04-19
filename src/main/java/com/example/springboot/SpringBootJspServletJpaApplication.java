package com.example.springboot;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.ServletComponentScan;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
public class SpringBootJspServletJpaApplication {

    public static void main(String[] args) {
        SpringApplication.run(SpringBootJspServletJpaApplication.class, args);
    }

}

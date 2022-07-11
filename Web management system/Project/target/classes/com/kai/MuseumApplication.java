package com.kai;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@MapperScan("com.kai.mapper")
public class MuseumApplication {

    public static void main(String[] args) {
        SpringApplication.run(MuseumApplication.class, args);
    }

}

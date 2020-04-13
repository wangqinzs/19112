package com.st;


import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.transaction.annotation.EnableTransactionManagement;

@SpringBootApplication
@MapperScan(basePackages = "com.st.dao")
@EnableTransactionManagement
public class YaxuancrmApplication {

	public static void main(String[] args) {
		SpringApplication.run(YaxuancrmApplication.class, args);
	}

}

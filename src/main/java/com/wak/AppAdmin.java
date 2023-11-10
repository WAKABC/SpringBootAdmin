package com.wak;

import de.codecentric.boot.admin.server.config.EnableAdminServer;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;

/**
 * Hello world!
 */
@SpringBootApplication
@EnableAdminServer
@EnableDiscoveryClient
public class AppAdmin {
    public static void main(String[] args) {
        SpringApplication.run(AppAdmin.class, args);
    }
}

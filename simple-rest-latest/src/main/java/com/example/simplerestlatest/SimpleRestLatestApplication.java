package com.example.simplerestlatest;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import org.springframework.boot.ApplicationRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.core.io.ClassPathResource;
import org.springframework.stereotype.Repository;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.io.InputStreamReader;
import java.util.List;
import java.util.function.Function;
import java.util.stream.Collectors;

@SpringBootApplication
public class SimpleRestLatestApplication {

	public static void main(String[] args) {
		SpringApplication.run(SimpleRestLatestApplication.class, args);
	}

//	@Bean
//	ApplicationRunner resources() {
//		return args -> {
//			var message = new ClassPathResource("hello");
//			var contents = FileCopyUtils.copyToString(new InputStreamReader(
//					message.getInputStream()));
//			System.out.println("Message: " + contents);
//		};
//	}

}

@RestController
@RequestMapping("/api")
class HelloController {
//	private final UserRepository userRepository;

//	public HelloController(UserRepository userRepository) {
//		this.userRepository = userRepository;
//	}


	@GetMapping("/hello")
	public String hello() {
		return "Hello World";
	}

//	@GetMapping("/users")
//	public List<String> users() {
//        return userRepository.findAll().stream().map(User::getName).collect(Collectors.toList());
//	}

	@PostMapping("/echo")
	public Echo echo(@RequestBody Echo echo) {
		return echo;
	}
}

record Echo(String message) { }


//@Repository
//interface UserRepository extends JpaRepository<User, Long> {
//}
//
//@Entity
//@Table(name = "users")
//class User {
//	@Id
//	@GeneratedValue(strategy = GenerationType.IDENTITY)
//	private Long id;
//
//	private String name;
//	private String email;
//
//	public Long getId() {
//		return id;
//	}
//
//	public void setId(Long id) {
//		this.id = id;
//	}
//
//	public String getName() {
//		return name;
//	}
//
//	public void setName(String name) {
//		this.name = name;
//	}
//
//	public String getEmail() {
//		return email;
//	}
//
//	public void setEmail(String email) {
//		this.email = email;
//	}
//}


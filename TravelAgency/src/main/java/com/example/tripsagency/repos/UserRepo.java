package com.example.tripsagency.repos;

import org.springframework.data.repository.CrudRepository;

import com.example.tripsagency.domain.User;

public interface UserRepo extends CrudRepository<User, Long> {
	User findByUsername(String username);
}

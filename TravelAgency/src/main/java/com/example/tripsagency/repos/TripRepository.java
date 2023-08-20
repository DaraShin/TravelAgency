package com.example.tripsagency.repos;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.example.tripsagency.domain.Trip;


@Repository
public interface TripRepository extends CrudRepository<Trip, Integer>{
	public Iterable<Trip> findByTripType(String tripType);
	public Iterable<Trip> findByIsHotTourTrue();
	public Iterable<Trip> findByTripTypeAndIsHotTourTrue(String tripType);
}

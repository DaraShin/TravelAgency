package com.example.tripsagency.domain;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.validation.constraints.Pattern;

import lombok.Getter;
import lombok.Setter;

@Entity
public class Trip {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "trip_id")
    @Getter
    @Setter
    private int tripId;
    
    @Getter
    @Setter
    private String destination;

    @Column(name = "trip_type")
    @Getter
    @Setter
    private String tripType;

    @Getter
    @Setter
    private double price;

    @Column(name = "is_hot_tour")
    @Getter
    @Setter
    private boolean isHotTour;

    /*@OneToMany(
            cascade = {CascadeType.MERGE,CascadeType.REMOVE},
            mappedBy = "trip")
    @Getter
    @Setter
    private List<Order> orders = new ArrayList<>();*/

    /**
     * Creates String with information about trip.
     * @return String representation of trip.
     */
    /*@Override
    public String toString() {
        String tripString = "ID: " + tripId
                +". Type: " + tripType
                +". Price: "+String.format("%.2f", price);
        if(isHotTour){
            tripString += " !!! hot tour";
        }
        return tripString;
    }*/
}
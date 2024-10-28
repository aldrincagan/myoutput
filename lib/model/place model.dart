import 'package:flutter/material.dart';

class PlaceInfo {
  final String name;
  final String location;
  final String distance;
  final String description;
  final String image;
  final double hours; // Add hours property

  PlaceInfo({
    required this.name,
    required this.location,
    required this.distance,
    required this.description,
    required this.image,
    required this.hours,
  });

}
List<PlaceInfo> places = [
  PlaceInfo(
    name: "Zamboanga City",
    location: "Fort Pilar",
    description: "Discover the hidden gems of the Philippines! Welcome to the WanderPh your essentail companiom for exploring our beautiful country",
    image: "image/city2.jpg",
    hours: 1.30,
    distance: '12 km',   // Specify hours as a double
  ),
  PlaceInfo(
    name: "Cebu City",
    location: "Tourist Spot",
    description: "Discover the hidden gems of the Philippines! Welcome to the WanderPh your essentail companiom for exploring our beautiful country",
    image: "image/cebu.jpg",
    hours: 1.10,
      distance: '570.1 km'// Specify hours as a double
  ),
  PlaceInfo(
    name: "Davao City",
    location: "Pearl Farm",
    description:"Discover the hidden gems of the Philippines! Welcome to the WanderPh your essentail companiom for exploring our beautiful country",
    image: "image/davao.jpg",
    hours: 1.20,
      distance: '658.6km '// Specify hours as a double
  ),
  PlaceInfo(
    name: "Catabato City",
    location: "PC Hill",
    description:"Discover the hidden gems of the Philippines! Welcome to the WanderPh your essentail companiom for exploring our beautiful country",
    image: "image/cotabato.jpg",
    hours: 1.00,
      distance: '448.8km '// Specify hours as a double
  ),
  PlaceInfo(
    name: "Butuan City",
    location: "Carta",
    description: "Discover the hidden gems of the Philippines! Welcome to the WanderPh your essentail companiom for exploring our beautiful country",
    image: "image/butuan.jpg",
    hours: 1.50,
      distance: '661.6km'// Specify hours as a double
  ),
  PlaceInfo(
    name: "Cavite City",
    location: "Samonter Park",
    description:"Discover the hidden gems of the Philippines! Welcome to the WanderPh your essentail companiom for exploring our beautiful country",
    image: "image/cavite.jpg",
    hours: 2.10,
      distance: '1,350'// Specify hours as a double
  ),
  // You can add more PlaceInfo objects here
];


import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class BookingScreen extends StatelessWidget {
  const BookingScreen({Key? key}) : super(key: key);

  Future<void> _confirmBooking(BuildContext context, String name, String email, String phone) async {
    final url = Uri.parse('http://localhost:3000/book'); // Updated endpoint
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'name': name,
        'email': email,
        'phone': phone,
        'location': 'Beautiful Place',
        'duration': '1.30 hours',
        'distance': '15 kilometers',
      }),
    );

    if (response.statusCode == 201) {
      // Booking was successful
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Booking Confirmed'),
            content: const Text('Your trip has been booked successfully!'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Close the dialog
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    } else {
      // Booking failed
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Booking Failed'),
            content: const Text('There was an error booking your trip. Please try again later.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Close the dialog
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final TextEditingController nameController = TextEditingController();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController phoneController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Booking Screen'),
        backgroundColor: Colors.lightBlueAccent,
        foregroundColor: Colors.black,
      ),
      body: Stack(
        children: [
          // Background design
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('image/bd.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Main content
          SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Trip Summary',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Location: Beautiful Place\n'
                      'Duration: 1.30 hours\n'
                      'Distance: 15 kilometers\n',
                  style: TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 32),
                const Text(
                  'Enter Your Details',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    labelText: 'Full Name',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: phoneController,
                  decoration: const InputDecoration(
                    labelText: 'Phone Number',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.phone,
                ),
                const SizedBox(height: 32),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      _confirmBooking(
                        context,
                        nameController.text,
                        emailController.text,
                        phoneController.text,
                      );
                    },
                    child: const Text(
                      'Confirm Booking',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
